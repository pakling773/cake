import { Component } from '@angular/core';

import { inject } from '@angular/core';
import { Firestore, collectionData, collection } from '@angular/fire/firestore';
import { Observable } from 'rxjs';
import { CommonModule } from '@angular/common';
import {
  getAuth,
  createUserWithEmailAndPassword,
  signInWithPopup,
  GoogleAuthProvider,
  IdTokenResult,
} from 'firebase/auth';
import { AuthService } from '../../services/auth.service';

import { RouterModule, Router } from '@angular/router';

interface Item {
  name: string;
}

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss',
})
export class LoginComponent {
  router: Router = inject(Router);
  item$!: Observable<Item[]>;
  firestore: Firestore = inject(Firestore);
  auth = getAuth();

  constructor(private authService: AuthService) {
    const itemCollection: any = collection(this.firestore, 'products');
    this.item$ = collectionData<Item>(itemCollection);
  }

  register() {
    createUserWithEmailAndPassword(
      this.auth,
      'developersnepal@gmail.com',
      'password'
    )
      .then((userCredential) => {
        // Signed up
        const user = userCredential.user;
        // ...
      })
      .catch((error) => {
        const errorCode = error.code;
        const errorMessage = error.message;

        console.log(errorCode);
        console.log(errorMessage);
        // ..
      });
  }
  async login() {
    try {
      const provider = new GoogleAuthProvider();
      provider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      var result = await signInWithPopup(this.auth, provider);
      // const idtoken = await this.auth.currentUser?.getIdToken();
      // console.log(idtoken);
      var tokenResult: IdTokenResult | undefined =
        await this.auth.currentUser?.getIdTokenResult();

      if (tokenResult) {
        console.log(tokenResult);
        this.authService.setUserData(tokenResult);
        this.router.navigateByUrl('/app');
      } else {
        console.error('something went wrong');
      }
    } catch (error) {
      console.log(error);
    }
  }
}
