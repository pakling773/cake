import { Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
import {
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { getDownloadURL, getStorage, ref, uploadBytes } from 'firebase/storage';

import { Router } from '@angular/router';
import LoadingHelper from '../../../helpers/loading.helper';
import {
  ICakeCategory,
  ICakeItem,
  IFlavour,
  IShop,
} from '../../../models/product.items';
import { FireService } from '../../../services/fire.service';

import { find, pull } from 'lodash';

@Component({
  selector: 'app-add-item',
  standalone: true,
  imports: [ReactiveFormsModule],
  templateUrl: './add-item.component.html',
  styleUrl: './add-item.component.scss',
})
export class AddItemComponent implements OnInit {
  error = false;
  categories: ICakeCategory[] = [];
  flavours: IFlavour[] = [];
  shops: IShop[] = [];
  @ViewChild('tagInput') tagInputRef!: ElementRef;
  tags: string[] = [];

  @Input('id') cakeId = '';

  productForm = new FormGroup({
    name: new FormControl('', Validators.required),
    category_id: new FormControl('', Validators.required),
    shop_id: new FormControl('', Validators.required),
    price: new FormControl('', [
      Validators.required,
      Validators.pattern('^[0-9]*$'),
    ]),
    // imageUrl: new FormControl('', Validators.required),
    flavour_id: new FormControl('', Validators.required),
    photo: new FormControl('', Validators.required),
    description: new FormControl('', Validators.required),
    specification: new FormControl('', Validators.required),
    tags: new FormControl(''),
  });
  constructor(private fireService: FireService, private router: Router) {}

  async ngOnInit() {
    console.log(this.cakeId);
    try {
      if (this.cakeId) {
        this.loadData();
      }

      LoadingHelper.show();
      this.categories = await this.fireService.getCategories();
      this.flavours = await this.fireService.getFlavours();
      this.shops = await this.fireService.getShops();
      LoadingHelper.hide();
    } catch (error) {
      console.error(error);
    }
  }

  get productFormControl() {
    return this.productForm.controls;
  }

  async loadData() {
    LoadingHelper.show();
    const cake: ICakeItem = await this.fireService.getCakesById(this.cakeId);
    this.productFormControl.name.patchValue(cake.name!);
    this.productFormControl.category_id.patchValue(cake.category_id!);
    this.productFormControl.shop_id.patchValue(cake.shop_id!);
    this.productFormControl.price.patchValue(cake.price?.toString()!);
    this.productFormControl.flavour_id.patchValue(cake.flavour_id!);
    this.productFormControl.description.patchValue(cake.description!);
    this.productFormControl.specification.patchValue(cake.specification!);
    this.productFormControl.photo.patchValue(cake.photo!);
    this.tags = cake?.tags ?? [];
    LoadingHelper.hide();
  }

  async saveData() {
    this.error = false;
    this.productForm.markAllAsTouched();

    if (this.productForm.valid) {
      try {
        LoadingHelper.show();
        const formValue = this.productForm.value;
        const data: ICakeItem = {
          category_id: formValue.category_id!,
          flavour_id: formValue.flavour_id!,
          name: formValue.name!,
          price: +formValue.price!,
          shop_id: formValue.shop_id!,
          photo: formValue.photo!,
          description: formValue.description!,
          specification: formValue.specification!,
          tags: this.tags,
        };
        if (this.cakeId != '' && this.cakeId != undefined) {
          data.id = this.cakeId;
        }

        const result = await this.fireService.saveItem(data);

        LoadingHelper.hide();
        this.router.navigateByUrl('/app/items');
      } catch (error) {
        console.log('err---');
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

  focusTagInput(): void {
    this.tagInputRef.nativeElement.focus();
  }

  onKeyDown(event: KeyboardEvent): void {
    if (event.code === 'Enter') {
      event.preventDefault();
    }
  }

  onKeyUp(event: KeyboardEvent): void {
    const inputValue: any = this.productFormControl.tags.value;
    if (event.code === 'Backspace' && !inputValue) {
      this.removeTag();
      return;
    } else {
      if (event.code === 'Comma' || event.code === 'Enter') {
        this.addTag(inputValue);
        this.productFormControl.tags.patchValue('');
      }
    }
  }

  addTag(tag: string): void {
    if (tag[tag.length - 1] === ',' || tag[tag.length - 1] === ' ') {
      tag = tag.slice(0, -1);
    }
    if (tag.length > 0 && !find(this.tags, tag)) {
      this.tags.push(tag);
    }
  }

  removeTag(tag?: string): void {
    if (!!tag) {
      pull(this.tags, tag);
    } else {
      this.tags.splice(-1);
    }
  }
}
