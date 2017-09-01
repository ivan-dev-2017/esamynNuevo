import { Component, OnInit, Input } from '@angular/core';
import {  User,Login,ItemMenu,Menu } from '../../model/index';
import {GlobaleventsmanagerService,AlertService} from "../../service/index";
import {SafeHtmlPipe} from "../../comp/pipe/safehtml.pipe";

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

	usuario:User= new User();
	loginWrapper: Login=new Login();
	isIn = false;   // store state
	menu:Menu;

	htmlMenu:string;
	panelMenuAppList:ItemMenu[];

	constructor(private globalEventsManager: GlobaleventsmanagerService, private alertService: AlertService) {


	    this.globalEventsManager.showNavBarEmitter.subscribe((mode)=>{
	        // mode will be null the first time it is created, so you need to igonore it when null
	    	//console.log("==>entra en subscriber menu: " + mode   );
	    	console.log("==>entra en subscriber menu string : " + JSON.stringify(mode)   );
	        if (mode !== null && mode.loggedIn) {
	          this.usuario = JSON.parse( localStorage.getItem('currentUser'));
	          //console.log("==>usuario logeado: "  +JSON.stringify(this.usuario)  );
	          //let menu=JSON.parse(localStorage.getItem('menu'));
	          //this.panelMenuAppList=menu;
	        } else {
	        	console.log("==>no cambio usuaerio: ");
	        	this.loginWrapper.loggedIn=false;
	        	this.usuario.loggedIn=false;
	        }
	    },
        error => {
        	console.log("==>despues de menu error  " + JSON.stringify(error));
        	this.alertService.error(error._body);
        });

	}
	toggleState() { // click handler
	    let bool = this.isIn;
	    this.isIn = bool === false ? true : false;
	}

  ngOnInit() {
  }

}
