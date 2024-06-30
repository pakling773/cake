import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ItemsRoutingModule } from './items-routing.module';
import { provideFirestore } from '@angular/fire/firestore';
import { getFirestore } from 'firebase/firestore';
import { getStorage } from 'firebase/storage';
import { provideStorage } from '@angular/fire/storage';

@NgModule({
  declarations: [],
  imports: [CommonModule, ItemsRoutingModule],
})
export class ItemsModule {}
