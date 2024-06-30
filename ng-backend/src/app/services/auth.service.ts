import { Injectable } from '@angular/core';
import { IdTokenResult, UserCredential } from 'firebase/auth';
// import { Auth, getAuth } from 'firebase/auth';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  // auth = getAuth();
  constructor() {}

  setUserData(data: IdTokenResult) {
    localStorage.setItem('user_id', data.claims?.['user_id'] as string);
    localStorage.setItem('email', data.claims?.['email'] as string);
    localStorage.setItem('displayName', data.claims?.['name'] as string);
    localStorage.setItem('picture', data.claims?.['picture'] as string);
    localStorage.setItem('token', data.token);
    localStorage.setItem('auth_time', data.claims?.['auth_time'] as string);
    localStorage.setItem('expiry', '');
  }

  getUserData() {}

  // async IsLoggedInPromise(): Promise<boolean> {
  //   try {
  //     await new Promise((resolve, reject) =>
  //       this.auth.onAuthStateChanged(
  //         (user) => {
  //           if (user) {
  //             // User is signed in.
  //             resolve(user);
  //           } else {
  //             // No user is signed in.
  //             reject('no user logged in');
  //           }
  //         },
  //         // Prevent console error
  //         (error) => reject(error)
  //       )
  //     );
  //     return true;
  //   } catch (error) {
  //     return false;
  //   }
  // }

  IsLoggedIn(): boolean {
    const token = localStorage.getItem('token');
    if (token) {
      return true;
    } else {
      return false;
    }
  }
}
