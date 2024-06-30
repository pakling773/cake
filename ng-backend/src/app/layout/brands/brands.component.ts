import { Component, inject } from '@angular/core';

import { Firestore } from '@angular/fire/firestore';
import { RouterModule } from '@angular/router';
import { findIndex } from 'lodash';
import loadingHelper from '../../helpers/loading.helper';
import { IFlavour } from '../../models/product.items';
import { FireService } from '../../services/fire.service';

@Component({
  selector: 'app-brands',
  standalone: true,
  imports: [RouterModule],
  templateUrl: './brands.component.html',
  styleUrl: './brands.component.scss',
})
export class BrandsComponent {
  brands: IFlavour[] = [];

  firestore: Firestore = inject(Firestore);

  constructor(private fireService: FireService) {
    this.loadData();
  }

  async loadData() {
    loadingHelper.show();
    this.brands = await this.fireService.getFlavours();
    console.log(this.brands);
    loadingHelper.hide();
  }

  async featureItem(event: any, id: string) {
    loadingHelper.show();
    const ischecked: boolean = event.currentTarget.checked;
    await this.fireService.featureFlavourItem(id, ischecked);
    loadingHelper.hide();
  }

  async deleteItem(id: string) {
    loadingHelper.show();

    const key = findIndex(this.brands, { id: id });

    await this.fireService.deleteFlavourItem(id);
    this.brands[key].deleted = true;
    loadingHelper.hide();
  }
}
