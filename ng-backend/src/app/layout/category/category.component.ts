import { Component, OnInit } from '@angular/core';
import { Firestore, collectionData } from '@angular/fire/firestore';
import { RouterModule } from '@angular/router';
import { query } from 'express';
import { findKey } from 'lodash';
import { collection, doc, getDocs, deleteDoc } from 'firebase/firestore';
import { Observable } from 'rxjs';
import { DatePipe } from '@angular/common';
import { FireService } from '../../services/fire.service';
import { ICakeCategory } from '../../models/product.items';
// interface ICategory {
//   name: string;
//   id: string;
//   created: any;
// }
@Component({
  selector: 'app-category',
  standalone: true,
  imports: [RouterModule, DatePipe],
  templateUrl: './category.component.html',
  styleUrl: './category.component.scss',
})
export class CategoryComponent implements OnInit {
  categories: ICakeCategory[] = [];
  constructor(private fs: Firestore, private fireService: FireService) {}

  async ngOnInit() {
    this.getData();
    this.categories = await this.fireService.getCategories();
  }

  async getData() {
    // const itemCollection = collection(this.fs, 'category');
    // const get = (await getDocs(itemCollection)).docs.map((row) => {
    //   const item: ICategory = {
    //     id: row.id,
    //     created: row.data()['created'],
    //     name: row.data()['name'],
    //   };
    //   this.categories.push(item);
    // });
    // console.log(this.categories[0].created.seconds);
    // this.categories.sort(function compare(a, b) {
    //   var dateA: any = new Date(a.created.seconds);
    //   var dateB: any = new Date(b.created.seconds);
    //   return dateA - dateB;
    // });
  }

  async getDocument(docId: string) {}

  async delete(e: any, category_id: string) {
    e.preventDefault();

    try {
      const key: any = findKey(this.categories, { id: category_id });
      console.log(this.categories);
      const del = await deleteDoc(doc(this.fs, 'category', category_id));
      this.categories.splice(key, 1);
    } catch (ex) {
      console.log(ex);
    }
  }
}
