import { Component, Input } from '@angular/core';
import { IShop, IAddress } from '../../../models/product.items';
import { DatePipe } from '@angular/common';

import {
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { FireService } from '../../../services/fire.service';
import loadingHelper from '../../../helpers/loading.helper';
import { getDownloadURL, getStorage, uploadBytes } from 'firebase/storage';
import { ref } from '@angular/fire/storage';
import { Router, RouterModule } from '@angular/router';
import { SharedModule } from '../../../shared/shared.module';

@Component({
  selector: 'app-add-shop',
  standalone: true,
  imports: [ReactiveFormsModule, RouterModule, SharedModule],
  providers: [DatePipe],
  templateUrl: './add-shop.component.html',
  styleUrl: './add-shop.component.scss',
})
export class AddShopComponent {
  error = false;

  shops: IShop = {};
  @Input('id') shopId = '';

  shopForm = new FormGroup({
    name: new FormControl('', Validators.required),
    logo: new FormControl('', Validators.required),
    address: new FormControl('', Validators.required),
    address2: new FormControl('', Validators.required),
    latitude: new FormControl('', Validators.required),
    longitude: new FormControl('', Validators.required),
    phone: new FormControl('', Validators.required),
    opening_hour: new FormControl('', Validators.required),
    closing_hour: new FormControl('', Validators.required),
  });
  constructor(
    private fireService: FireService,
    private router: Router,
    private datePipe: DatePipe
  ) {}

  async ngOnInit() {
    try {
      if (this.shopId) {
        this.loadData();
      }
    } catch (error) {
      console.error(error);
    }
  }

  get shopFormControl() {
    return this.shopForm.controls;
  }

  async loadData() {
    try {
      const shop: IShop = await this.fireService.getShopById(this.shopId);
      this.shops = shop;

      // var opening = '1970-01-01T' + shop.openingHour + ':00.000';
      // console.log(opening);
      // console.log(open);
      this.shopFormControl.name.patchValue(shop.name!);

      this.shopFormControl.address2.patchValue(shop.address2!);

      this.shopFormControl.address.patchValue(shop.address1?.address!);
      this.shopFormControl.latitude.patchValue(
        shop.address1?.latitude?.toString()!
      );
      this.shopFormControl.longitude.patchValue(
        shop.address1?.longitude?.toString()!
      );

      this.shopFormControl.phone.patchValue(shop.phone_number!);
      this.shopFormControl.opening_hour.patchValue(shop.openingHour!);
      this.shopFormControl.closing_hour.patchValue(shop.closingHour!);
      this.shopFormControl.logo.patchValue(shop.logo!);
    } catch (error) {
      loadingHelper.hide();
      console.error(error);
    } finally {
      loadingHelper.hide();
    }
  }

  addTimeToToday(timeString: string): Date {
    const [hours, minutes] = timeString.split(':').map(Number);

    const today = new Date();
    const year = today.getFullYear();
    const month = today.getMonth();
    const day = today.getDate();

    const combinedDateTime = new Date(year, month, day, hours, minutes);

    return combinedDateTime;
  }

  async saveData() {
    this.error = false;
    this.shopForm.markAllAsTouched();
    if (this.shopForm.valid) {
      try {
        // loadingHelper.show();
        var opening = '';
        var closing = '';

        const formValue = this.shopForm.value;
        if (
          formValue.opening_hour != this.shops.openingHour ||
          this.shops.openingHour == undefined
        ) {
          opening = '1970-01-01T' + formValue.opening_hour + ':00.000';
        } else {
          opening = formValue.opening_hour!;
        }

        if (formValue.closing_hour != this.shops.closingHour) {
          closing = '1970-01-01T' + formValue.closing_hour + ':00.000';
        } else {
          closing = formValue.closing_hour!;
        }

        // var closing = '1970-01-01T' + formValue.closing_hour + ':00.000';
        // // "1970-01-01T20:46:00.000"

        const data: IShop = {
          name: formValue.name!,
          logo: formValue.logo!,
          phone_number: formValue.phone!,
          address1: {
            address: formValue.address!,
            latitude: Number(formValue.latitude!),
            longitude: Number(formValue.longitude!),
          },
          address2: formValue.address2!,
          openingHour: opening,
          closingHour: closing,
        };
        if (this.shopId != '' && this.shopId != undefined) {
          data.id = this.shopId;
        }
        // const start = this.addTimeToToday(data.openingHour!);

        const result = await this.fireService.saveShop(data);

        loadingHelper.hide();
        this.router.navigateByUrl('/app/shops');
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
          this.shopForm.controls['logo'].patchValue(downloadURL);
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

  getAddress(place: any) {
    this.shopFormControl.address.patchValue(place?.formatted_address);
    this.shopFormControl.latitude.patchValue(place.geometry.location.lat());
    this.shopFormControl.longitude.patchValue(place.geometry.location.lng());
    // console.info(place);
  }
}
