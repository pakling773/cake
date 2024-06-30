import { Routes } from '@angular/router';
import { LayoutComponent } from './layout.component';

export const routes: Routes = [
  {
    path: '',
    component: LayoutComponent,
    children: [
      {
        path: '',
        redirectTo: 'dashboard',
        pathMatch: 'full',
      },
      {
        path: 'dashboard',
        loadChildren: () =>
          import('./dashboard/dashboard.module').then((m) => m.DashboardModule),
      },
      {
        path: 'users',
        loadChildren: () =>
          import('./users/users.module').then((m) => m.UsersModule),
      },
      {
        path: 'items',
        loadChildren: () =>
          import('./items/items.module').then((m) => m.ItemsModule),
      },
      {
        path: 'category',
        loadChildren: () =>
          import('./category/category.module').then((m) => m.CategoryModule),
      },
      {
        path: 'brands',
        loadChildren: () =>
          import('./brands/brands.module').then((m) => m.BrandsModule),
      },
      {
        path: 'slides',
        loadChildren: () =>
          import('./slides/slides.module').then((m) => m.SlidesModule),
      },
      {
        path: 'shops',
        loadChildren: () =>
          import('./shops/shops.module').then((m) => m.ShopsModule),
      },
      {
        path: 'orders',
        loadChildren: () =>
          import('./orders/orders.module').then((m) => m.OrdersModule),
      },
    ],
  },
];
