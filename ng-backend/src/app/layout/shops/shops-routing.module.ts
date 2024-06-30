import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ShopsComponent } from './shops.component';
import { AddShopComponent } from './add-shop/add-shop.component';

const routes: Routes = [
  {
    path: '',
    component: ShopsComponent,
  },
  {
    path: 'add',
    component: AddShopComponent,
  },
  {
    path: 'edit/:id',
    component: AddShopComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ShopsRoutingModule {}
