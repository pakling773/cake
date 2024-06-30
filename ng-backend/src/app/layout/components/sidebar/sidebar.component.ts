import { Component } from '@angular/core';
import { NavigationStart, RouterModule, RouterOutlet } from '@angular/router';
import { ISidebarItems } from '../../../models/sidebar.items';

import { getAuth, signOut } from 'firebase/auth';

import { Router } from '@angular/router';

// const app = initializeApp(AppConfig.firebase);

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [RouterModule, RouterOutlet],
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.scss',
})
export class SidebarComponent {
  url: string = '';
  ttt = 'Shops';
  constructor(private router: Router) {
    this.url = this.router.url;

    router.events.forEach((event) => {
      if (event instanceof NavigationStart) {
        this.url = event.url;
      }
    });
  }
  auth = getAuth();
  sidebarItems: ISidebarItems[] = [
    // {
    //   icon: 'la la-layout',
    //   title: 'Layout',
    //   id: 1,
    //   link: '/app/dashboard',
    // },
    {
      icon: 'la la-home',
      title: 'Shops',
      id: 1,
      link: '/app/shops',
    },

    {
      icon: 'la la-birthday-cake',
      title: 'Cakes  ',
      id: 2,
      link: '/app/items',
    },
    {
      icon: 'la la-birthday-cake',
      title: 'Categories ',
      id: 3,
      link: '/app/category',
    },
    {
      icon: 'la la-birthday-cake',
      title: 'Brands  ',
      id: 4,
      link: '/app/brands',
    },
    {
      icon: 'la la-birthday-cake',
      title: 'Slides  ',
      id: 5,
      link: '/app/slides',
    },
    {
      icon: 'la la-user',
      title: 'Users',
      id: 6,
      link: '/app/users',
    },
    {
      icon: 'la la-shopping-cart',
      title: 'Orders',
      id: 7,
      link: '/app/orders',
    },
  ];

  async logout(e: any) {
    console.log('-------------logut----------------');
    e.preventDefault();
    try {
      const logout = await signOut(this.auth);
      console.log(logout);
      localStorage.clear();
      this.router.navigateByUrl('/auth');
    } catch (error) {
      console.log(error);
    }
  }
}
