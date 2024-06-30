import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { AddSlidesItemComponent } from "./add-item/add-item.component";
import { SlidesComponent } from "./slides.component";

const routes: Routes = [
  {
    path: "",
    component: SlidesComponent,
  },
  {
    path: "add",
    component: AddSlidesItemComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class SlidesRoutingModule {}
