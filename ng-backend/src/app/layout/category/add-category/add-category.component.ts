import { Component, OnInit, inject } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { FormControl } from '@angular/forms';
import { FirebaseApp } from 'firebase/app';
declare var $: any;
import { serverTimestamp } from 'firebase/firestore';

import {
  Firestore,
  collectionData,
  collection,
  getFirestore,
  updateDoc,
} from '@angular/fire/firestore';
import { addDoc, doc, setDoc } from 'firebase/firestore';
import { ActivatedRoute, Router } from '@angular/router';
import { ModuleType } from '../../../services/fire.service';

@Component({
  selector: 'app-add-category',
  standalone: true,
  imports: [ReactiveFormsModule],
  templateUrl: './add-category.component.html',
  styleUrl: './add-category.component.scss',
})
export class AddCategoryComponent implements OnInit {
  cat_id: string = '';
  cat_name: string = '';
  constructor(
    private fs: Firestore,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  input = new FormControl('');

  ngOnInit() {
    this.route.params.subscribe((params) => {
      this.cat_id = params['id'];
      this.cat_name = params['name'];
      if (this.cat_name !== '') {
        this.input.setValue(this.cat_name);
      }
    });
  }

  async saveCategory() {
    console.log(this.cat_id);
    if (this.cat_id != '' && this.cat_id != undefined) {
      console.log('update');
      updateDoc(doc(this.fs, ModuleType.CATEGORY, this.cat_id), {
        name: this.input.value,
      });
      this.notify(this.cat_id, 'updated');
    } else {
      console.log('save');
      if (this.input.value !== '') {
        const docRef = await addDoc(collection(this.fs, ModuleType.CATEGORY), {
          name: this.input.value,
          // created: serverTimestamp(),
        });
        this.input.reset();
        this.notify(docRef.id, 'added');
      }
    }
    this.router.navigateByUrl('/app/category');
  }

  async createRobot(name: string, color: string, age: string) {
    const docRef = await addDoc(collection(this.fs, 'robots'), {
      name: name,
      color: color,
      age: age,
    });
    console.log('Document written with ID: ', docRef.id);
  }

  cancel() {
    this.input.reset();
  }

  notify(id: string, status: string) {
    $.notify(
      {
        icon: 'la la-bell',
        title: 'Category ' + status + '. ID ' + id,
        message: 'Category ' + status + ' successfully',
      },
      {
        type: 'success',
        placement: {
          from: 'bottom',
          align: 'right',
        },
        time: 500,
      }
    );
  }
}
