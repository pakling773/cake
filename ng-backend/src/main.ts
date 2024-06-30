import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { AppComponent } from './app/app.component';
import { initializeApp } from 'firebase/app';
import AppConfig from './app/config';

bootstrapApplication(AppComponent, appConfig).catch((err) =>
  console.error(err)
);

const app = initializeApp(AppConfig.firebase);
