import { Component, inject } from '@angular/core';
import { Firestore, collectionData } from '@angular/fire/firestore';
import { RouterModule } from '@angular/router';

import { ICakeItem } from '../../models/product.items';
import { FireService } from '../../services/fire.service';
import { findIndex } from 'lodash';
import loadingHelper from '../../helpers/loading.helper';
@Component({
  selector: 'app-items',
  standalone: true,
  imports: [RouterModule],
  templateUrl: './items.component.html',
  styleUrl: './items.component.scss',
})
export class ItemsComponent {
  cakes: ICakeItem[] = [];

  firestore: Firestore = inject(Firestore);

  constructor(private fireService: FireService) {
    this.loadData();
  }

  async loadData() {
    loadingHelper.show();
    this.cakes = await this.fireService.getCakes();
    console.log(this.cakes);
    loadingHelper.hide();
  }

  async featureItem(event: any, id: string) {
    loadingHelper.show();
    const ischecked: boolean = event.currentTarget.checked;
    await this.fireService.featureItem(id, ischecked);
    loadingHelper.hide();
    // if (ischecked) {
    // } else {
    // }
  }

  async deleteItem(id: string) {
    loadingHelper.show();

    const key = findIndex(this.cakes, { id: id });

    await this.fireService.deleteItem(id);
    this.cakes[key].deleted = true;
    loadingHelper.hide();
  }
}
