import { Component, Input, OnInit } from '@angular/core';
import { FireService } from '../../../services/fire.service';
import { IOrders } from '../../../models/product.items';

@Component({
  selector: 'app-view',
  standalone: true,
  imports: [],
  templateUrl: './view.component.html',
  styleUrl: './view.component.scss',
})
export class ViewComponent implements OnInit {
  @Input('id') orderId: string = '';
  order: IOrders = {};

  constructor(private fireService: FireService) {}

  ngOnInit(): void {
    this.getDetail();
  }

  async getDetail() {
    this.order = await this.fireService.getOrdersById(this.orderId);
    console.log(this.order);
  }

  async changeOrderStatus() {
    var status = await this.fireService.updateOrderStatus(this.orderId);
    this.order.completed = true;
  }
}
