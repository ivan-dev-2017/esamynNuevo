import { Component, OnInit, trigger, state, style, transition, animate } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import {  User,Login } from '../../model/index';
import {GlobaleventsmanagerService,AlertService,AuthenticationService} from "../../service/index";

import {ChangepasswordComponent} from "../../login/changepassword/changepassword.component";
import { DialogService } from "ng2-bootstrap-modal";

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
  animations: [
    trigger('slideInOut', [
      state('in', style({
        transform: 'translate3d(0, 0, 0)'
      })),
      state('out', style({
        transform: 'translate3d(100%, 0, 0)'
      })),
      transition('in => out', animate('400ms ease-in-out')),
      transition('out => in', animate('400ms ease-in-out'))
    ]),
  ]
})

export class HeaderComponent implements OnInit {

	usuario:User= new User();
	returnUrl:string;
	
	 menuState:string = 'in';

    private LOGO:string = "../../img/user.jpg";

  constructor(private globalEventsManager: GlobaleventsmanagerService, 
		      private alertService: AlertService,
		      private authenticationService: AuthenticationService,
		      private route: ActivatedRoute,
		      private router: Router,
		      private dialogService:DialogService) { 
	  
	  this.globalEventsManager.showNavBarEmitter.subscribe((mode)=>{
	        // mode will be null the first time it is created, so you need to igonore it when null
	    	console.log("==>entra en subscriber HeaderComponent: "    );
	        if (mode !== null && mode.loggedIn) {
	          console.log("==>cambio usuaerio: " + localStorage.getItem('currentUser'));
	          this.usuario = JSON.parse(localStorage.getItem('currentUser'));
	          if( this.usuario && this.usuario.loggedIn==false ){
	          	console.log("==>cdesloge y oculta hamburger ");
	          	this.menuState='in';
	          } else if( !this.usuario  ){
	          	console.log("==>cdesloge y oculta hamburger cuando null usuario");
	          	this.menuState='in';
	          }
	        } else {
	        	//console.log("==>no cambio usuaerio: ");
	        	this.usuario.loggedIn=false;
	        	this.menuState='in';
	        }
	    },
      error => {
      	console.log("==>despues de menu error  " + JSON.stringify(error));
      	this.alertService.error(error._body);
      });
  }

  ngOnInit() {
  }
  
  logOut() {
	  console.log("==>entra en logoutt con usuario: "  +JSON.stringify(this.usuario)  );
	  this.usuario.loggedIn=false;
      let loginWrapper = new Login(); 
      loginWrapper.usuario=this.usuario;
      this.globalEventsManager.showNavBar(loginWrapper);
      localStorage.removeItem('currentUser');
      localStorage.removeItem('menu');
      this.returnUrl="/login";
      this.router.navigate([this.returnUrl]);
      this.returnUrl = null;
      
      /*this.authenticationService.logout(this.usuario)
          .subscribe(
              data => {
            	  this.usuario.loggedIn=false;
            	  let loginWrapper = new Login(); 
            	  loginWrapper.usuario=this.usuario;
              	this.globalEventsManager.showNavBar(loginWrapper);
                  this.returnUrl="/login";
                  this.router.navigate([this.returnUrl]);
                  this.returnUrl = null;
              },
              error => {
              	console.log("==>despues de login error  " + JSON.stringify(error));
                  this.alertService.error(error._body);
              });*/
  }
  
  toggleMenu() {
  console.log("cambia estado");
    this.menuState = this.menuState === 'out' ? 'in' : 'out';
  }
  
  
  showPrompt() {
      let userLoc = new User(); 
      console.log("====> showPrompt");
      this.dialogService.addDialog(ChangepasswordComponent, {
        title:'RECUPERACION CONTRASENA USUARIO',
        usuario:userLoc })
        .subscribe((usuarioRet)=>{
          this.usuario = usuarioRet;
        });
    }

}
