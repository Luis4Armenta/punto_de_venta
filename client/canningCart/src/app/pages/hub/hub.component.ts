import { Component, OnInit } from '@angular/core';
import { faCashRegister, faCookieBite, faList, faMoneyBillAlt, faShoppingCart, faUsers, faUserTag, faUserTie } from '@fortawesome/free-solid-svg-icons';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-hub',
  templateUrl: './hub.component.html',
  styleUrls: ['./hub.component.css']
})
export class HubComponent implements OnInit {
  faCashRegister = faCashRegister;
  faUsers = faUsers;
  faUserTie = faUserTie;
  faList = faList;
  faUserTag = faUserTag;
  faShoppingCart = faShoppingCart;
  faMoneyBillAlt = faMoneyBillAlt;
  faCookieBite = faCookieBite;

  roll: string;

  
  constructor(public authService: AuthService) {
    this.authService.getUserType().subscribe(res => this.roll = res.roll, err => console.log);
   }

  ngOnInit(): void {
  }

}
