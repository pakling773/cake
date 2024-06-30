import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LayoutRoutingModule } from './layout-routing.module';
import { SharedModule } from '../shared/shared.module';
import { RouterOutlet } from '@angular/router';

@NgModule({
  declarations: [],
  imports: [CommonModule, SharedModule, RouterOutlet, LayoutRoutingModule],
})
export class LayoutModule {}
