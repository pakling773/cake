import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(private router: Router, private authService: AuthService) {}

  async canActivate(): Promise<boolean> {
    const log = this.authService.IsLoggedIn();
    if (log) {
      return true;
    } else {
      this.router.navigate(['/auth']); // Redirect to login if not authenticated
      return false; // Prevent access to the route
    }
  }
}
