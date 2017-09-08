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
	        if (mode !== null && mode.loggedIn) {
	          this.usuario = JSON.parse( localStorage.getItem('currentUser'));
	          this.loginWrapper=mode;
	        } else {
	        	this.loginWrapper.loggedIn=false;
	        	this.usuario.loggedIn=false;
	        }
	    },
        error => {
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
