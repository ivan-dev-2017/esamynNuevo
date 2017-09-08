import { Component, OnInit, trigger, state, style, transition, animate } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { DialogService } from "ng2-bootstrap-modal";
import {  User,Login } from '../../model/index';
import {GlobaleventsmanagerService,AlertService,AuthenticationService,CoreesamynService} from "../../service/index";
import {ChangepasswordComponent} from "../../login/changepassword/changepassword.component";


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
    establecimientosSalud=[];
    establecimientoSelected={"codigo": null,"unicodigo": null,"direccion": "","nombre":null};

	 menuState:string = 'in';

    private LOGO:string = "../../img/user.jpg";

  constructor(private globalEventsManager: GlobaleventsmanagerService,
		      private alertService: AlertService,
		      private authenticationService: AuthenticationService,
		      private coreesamynService: CoreesamynService,
		      private route: ActivatedRoute,
		      private router: Router,
		      private dialogService:DialogService) {

	  this.globalEventsManager.showNavBarEmitter.subscribe((mode)=>{
	        // mode will be null the first time it is created, so you need to igonore it when null
	        if (mode !== null && mode.loggedIn) {
	          this.usuario = JSON.parse(localStorage.getItem('currentUser'));
	          if( this.usuario && this.usuario.loggedIn==false ){
	          	this.menuState='in';
	          } else if( !this.usuario  ){
	          	this.menuState='in';
	          }
	          this.coreesamynService.getEstablecimientoSaludList().subscribe(data=>{
	              this.establecimientosSalud=data.objeto;
	          });
	        } else {
	        	this.usuario.loggedIn=false;
	        	this.menuState='in';
	        }
	    },
      error => {
      	this.alertService.error(error._body);
      });
  }

  ngOnInit() {
  }

  logOut() {
	  this.usuario.loggedIn=false;
      let loginWrapper = new Login();
      loginWrapper.usuario=this.usuario;
      this.globalEventsManager.showNavBar(loginWrapper);
      localStorage.removeItem('currentUser');
      localStorage.removeItem('menu');
      this.returnUrl="/login";
      this.router.navigate([this.returnUrl]);
      this.returnUrl = null;
  }

  toggleMenu() {
    this.menuState = this.menuState === 'out' ? 'in' : 'out';
  }

  onSelectEstablecimiento(){
      if( this.establecimientoSelected ){
          this.globalEventsManager.selectedEtablecimiento(this.establecimientoSelected);
          localStorage.setItem("establecimientoSalud", JSON.stringify( this.establecimientoSelected));
      }
  }


  showPrompt() {
      let userLoc = JSON.parse(localStorage.getItem('currentUser'));
      this.dialogService.addDialog(ChangepasswordComponent, {
        title:'RECUPERACION CONTRASENA USUARIO',
        usuario:userLoc })
        .subscribe((usuarioRet)=>{
          this.usuario = usuarioRet;
        });
    }

}
