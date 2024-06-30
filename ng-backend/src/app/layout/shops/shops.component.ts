import { Component, OnInit } from '@angular/core';
import { FireService } from '../../services/fire.service';
import { IShop } from '../../models/product.items';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-shops',
  standalone: true,
  imports: [RouterModule],

  templateUrl: './shops.component.html',
  styleUrl: './shops.component.scss',
})
export class ShopsComponent implements OnInit {
  shops: IShop[] = [];

  constructor(private fireService: FireService) {}
  async ngOnInit() {
    this.shops = await this.fireService.getShops();
  }

  async getNearBy() {
    // var data = await this.fireService.getNearestShops(
    //   40.351136,
    //   -75.373408,
    //   100
    // );
    // console.info(data);
  }
}
