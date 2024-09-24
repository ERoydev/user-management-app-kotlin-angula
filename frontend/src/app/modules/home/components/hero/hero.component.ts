import { Component } from '@angular/core';

@Component({
  selector: 'app-hero',
  templateUrl: './hero.component.html',
  styleUrls: ['./hero.component.css']
})
export class HeroComponent {
  buttonText: string = 'API Docs - Springdoc';
  buttonFontSize: string = '1.3rem';


  buttonClickHandler() {
    window.location.href = "http://localhost:8080/swagger-ui/index.html#/"
  }
}
