import { Component } from '@angular/core';
import { SidebarComponent } from './components/sidebar/sidebar.component';
import AppConfig from '../config';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-layout',
  standalone: true,
  imports: [SidebarComponent, RouterOutlet],
  templateUrl: './layout.component.html',
  styleUrl: './layout.component.scss',
})
export class LayoutComponent {
  AppConfig = AppConfig;
}
