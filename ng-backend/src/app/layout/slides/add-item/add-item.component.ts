import { Component } from '@angular/core';

import {
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { getDownloadURL, getStorage, ref, uploadBytes } from 'firebase/storage';

import { Router } from '@angular/router';
import LoadingHelper from '../../../helpers/loading.helper';
import { ISlide } from '../../../models/product.items';
import { FireService } from '../../../services/fire.service';

@Component({
  selector: 'app-add-item',
  standalone: true,
  imports: [ReactiveFormsModule],
  templateUrl: './add-item.component.html',
  styleUrl: './add-item.component.scss',
})
export class AddSlidesItemComponent {
  error = false;
  flavours: ISlide[] = [];

  productForm = new FormGroup({
    name: new FormControl('', Validators.required),
    photo: new FormControl('', Validators.required),
  });
  constructor(private fireService: FireService, private router: Router) {}

  async ngOnInit() {}

  get productFormControl() {
    return this.productForm.controls;
  }

  async saveData() {
    this.error = false;
    if (this.productForm.valid) {
      try {
        LoadingHelper.show();
        const formValue = this.productForm.value;
        const data: ISlide = {
          name: formValue.name!,
          photo: formValue.photo!,
        };
        const result = await this.fireService.saveSlideItem(data);
        console.log(result);
        LoadingHelper.hide();
        this.router.navigateByUrl('/app/slides');
      } catch (error) {
        console.error(error);
      }
    } else {
      this.error = true;
    }
  }
  onFileSelected(event: any): void {
    const file: File = event.target.files[0];
    const storage = getStorage();

    let possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890,./;'[]=-)(*&^%$#@!~`";
    const lengthOfCode = 40;
    var fileName = this.makeRandom(lengthOfCode, possible);

    const storageRef = ref(storage, fileName + '.jpg');
    uploadBytes(storageRef, file)
      .then((snapshot) => {
        getDownloadURL(storageRef).then((downloadURL) => {
          this.productForm.controls['photo'].patchValue(downloadURL);
        });
      })
      .catch((error) => alert('something went wrong'));
  }

  makeRandom(lengthOfCode: number, possible: string) {
    let text = '';
    for (let i = 0; i < lengthOfCode; i++) {
      text += possible.charAt(Math.floor(Math.random() * possible.length));
    }
    return text;
  }
}
