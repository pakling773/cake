import { Component, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FireService } from '../../services/fire.service';
import { IOrders } from '../../models/product.items';

@Component({
  selector: 'app-orders',
  standalone: true,
  imports: [RouterModule],
  templateUrl: './orders.component.html',
  styleUrl: './orders.component.scss',
})
export class OrdersComponent implements OnInit {
  orders: IOrders[] = [];
  items = '';
  totalItems = 0;
  totalOrder = 0;
  totalAmount = 0;

  constructor(private fireService: FireService) {
    this.getOrders();
  }
  ngOnInit(): void {}

  async getOrders() {
    this.orders = await this.fireService.getOrdersList();
    console.info(this.orders);
  }

  getItems(item: IOrders) {
    return item.cart?.map((c) => c.cake?.name);
  }
}
