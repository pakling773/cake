import { Component, inject } from '@angular/core';
import { Firestore } from '@angular/fire/firestore';
import { RouterModule } from '@angular/router';

import { findIndex } from 'lodash';
import loadingHelper from '../../helpers/loading.helper';
import { IUser } from '../../models/product.items';
import { FireService } from '../../services/fire.service';

@Component({
  selector: 'app-users',
  standalone: true,
  imports: [RouterModule],
  templateUrl: './users.component.html',
  styleUrl: './users.component.scss',
})
export class UsersComponent {
  users: IUser[] = [];

  firestore: Firestore = inject(Firestore);

  constructor(private fireService: FireService) {
    this.loadData();
  }

  async loadData() {
    loadingHelper.show();
    this.users = await this.fireService.getUsers();
    console.log(this.users);
    loadingHelper.hide();
  }

  async deleteItem(id: string) {
    loadingHelper.show();

    const key = findIndex(this.users, { id: id });

    await this.fireService.deleteUser(id);
    this.users[key].deleted = true;
    loadingHelper.hide();
  }
}
