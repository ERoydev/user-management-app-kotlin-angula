import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PrimaryButtonComponent } from './components/primary-button/primary-button.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { FooterComponent } from './components/footer/footer.component';
import { RouterModule } from '@angular/router';
import { PaginationComponent } from './components/pagination/pagination.component';
import { ErrorPageComponent } from './components/error-page/error-page.component';
import { NotAllowedComponent } from './components/not-allowed/not-allowed.component';
import { BannerComponent } from './components/banner/banner.component';
// Here i export and declare are the reusable components and i IMPORT this module in main app.modules


/* 
Note:
When i want to have reusable components in all application
1. I Declare them
2. I Export them
3. When other models import SharedModules they will have access to these components.
*/
@NgModule({
  declarations: [
    PrimaryButtonComponent,
    NavbarComponent,
    FooterComponent,
    ErrorPageComponent,
    NotAllowedComponent,
    BannerComponent,
  ],
  imports: [
    CommonModule,
    RouterModule
  ],
  exports: [
    PrimaryButtonComponent,
    NavbarComponent,
    FooterComponent,
    BannerComponent,
  ]
})
export class SharedModule { }
