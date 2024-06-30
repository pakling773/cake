import { Component, inject } from '@angular/core';

import { Firestore } from '@angular/fire/firestore';
import { RouterModule } from '@angular/router';
import { findIndex } from 'lodash';
import loadingHelper from '../../helpers/loading.helper';
import { IFlavour } from '../../models/product.items';
import { FireService } from '../../services/fire.service';

@Component({
  selector: 'app-slides',
  standalone: true,
  imports: [RouterModule],
  templateUrl: './slides.component.html',
  styleUrl: './slides.component.scss',
})
export class SlidesComponent {
  slides: IFlavour[] = [];

  firestore: Firestore = inject(Firestore);

  constructor(private fireService: FireService) {
    this.loadData();
  }

  async loadData() {
    loadingHelper.show();
    this.slides = await this.fireService.getSlides();
    console.log(this.slides);
    loadingHelper.hide();
  }

  async featureItem(event: any, id: string) {
    loadingHelper.show();
    const ischecked: boolean = event.currentTarget.checked;
    await this.fireService.featureSlideItem(id, ischecked);
    loadingHelper.hide();
  }

  async deleteItem(id: string) {
    loadingHelper.show();

    const key = findIndex(this.slides, { id: id });

    await this.fireService.deleteSlideItem(id);
    this.slides[key].deleted = true;
    loadingHelper.hide();
  }
}
