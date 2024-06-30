import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ItemsComponent } from './items.component';
import { AddItemComponent } from './add-item/add-item.component';

const routes: Routes = [
  {
    path: '',
    component: ItemsComponent,
  },
  {
    path: 'add',
    component: AddItemComponent,
  },
  {
    path: 'edit/:id',
    component: AddItemComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ItemsRoutingModule {}
