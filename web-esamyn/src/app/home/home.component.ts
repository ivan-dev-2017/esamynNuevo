import { Component, OnInit } from '@angular/core';
import { DialogService } from "ng2-bootstrap-modal";
import {PaginatedList, User,ItemMenu} from "../model/index";
import {UserService,GlobaleventsmanagerService,AlertService} from "../service/index";
import {ModalpromptComponent} from "../comp/modalprompt/modalprompt.component";


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
	
	private page = new PaginatedList<User>();
	private rows = new Array<User>();
    bandera:boolean = false;
	panelMenuAppList:ItemMenu[];
	
	confirmResult:boolean = null;
	promptMessage:string = "";

  constructor(private globalEventsManager: GlobaleventsmanagerService, 
	      private alertService: AlertService,
	      private dialogService:DialogService) { 
	  this.page.pageNumber = 0;
	  this.page.size = 3;
	  this.globalEventsManager.showNavBarEmitter.subscribe((mode)=>{
	        if (mode !== null) {
	        } else {
	        }
	    },
	    error => {
	    	this.alertService.error(error._body);
	    });
  }

  ngOnInit() {
  }
  
  
 
    
   recibeBandera(event){
       this.bandera=event;
   }
}
