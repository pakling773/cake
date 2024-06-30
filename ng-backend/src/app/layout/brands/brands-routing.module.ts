import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddBrandsItemComponent } from './add-item/add-item.component';
import { BrandsComponent } from './brands.component';

const routes: Routes = [
  {
    path: '',
    component: BrandsComponent,
  },
  {
    path: 'add',
    component: AddBrandsItemComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class BrandsRoutingModule {}
