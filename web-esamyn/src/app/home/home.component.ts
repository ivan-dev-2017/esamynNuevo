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

  constructor(		  private globalEventsManager: GlobaleventsmanagerService, 
	      private alertService: AlertService,
	      private dialogService:DialogService) { 
	  this.page.pageNumber = 0;
	  this.page.size = 3;
	  this.globalEventsManager.showNavBarEmitter.subscribe((mode)=>{
	        // mode will be null the first time it is created, so you need to igonore it when null
	    	console.log("==>entra en subscriber HomeComponent: "   );
	        if (mode !== null) {
	          //console.log("==>en home menu: " + localStorage.getItem('menu'));
	          //this.panelMenuAppList = JSON.parse(localStorage.getItem('menu'));
	        } else {
	        	//console.log("==>no cambio usuaerio: ");
	        	
	        }
	    },
	    error => {
	    	console.log("==>despues de menu error  " + JSON.stringify(error));
	    	this.alertService.error(error._body);
	    });
  }

  ngOnInit() {
	  //console.log("===> ingresa a inicializar home");
	  this.setPage({ offset: 1 });
  }
  
  /**
   * Populate the table with new data based on the page number
   * @param page The page to select
   */
  setPage(pageInfo){
    this.page.pageNumber = pageInfo.offset;
    /*this.userService.getAllPaginated(this.page).subscribe(pagedData => {
      this.page = pagedData;
      this.rows = pagedData.list;
    });*/
    //console.log( "termino de cargar home " + JSON.stringify(this.page) );
  }
  
  showPrompt() {
    this.dialogService.addDialog(ModalpromptComponent, {
      title:'MODAL PRUEBA',
      question:'What is your name?: '})
      .subscribe((message)=>{
        //We get dialog result
        this.promptMessage = message;
      });
  }
    
   recibeBandera(event){
       this.bandera=event;
   }
}
