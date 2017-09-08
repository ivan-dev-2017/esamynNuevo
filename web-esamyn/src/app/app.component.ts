import { Component,OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs/Subscription';
import { GlobaleventsmanagerService,AlertService,MessageService, GlobalService } from './service/index';
import { User } from './model/user';
import {AlertModule} from 'ngx-bootstrap';
import { HeaderComponent } from './layout/header/header.component';

declare var $:any;


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnDestroy{
  title = 'STANDAR APP';
  message: any;
  subscription: Subscription;
  private usuario:User;
  public disabled: boolean = false;
  
  constructor(private globalEventsManager: GlobaleventsmanagerService,
		      private messageService: MessageService,
		      private alertService: AlertService) {
	  //this.subscription = this.messageService.getMessage().subscribe(message => { this.message = message; });
	  this.globalEventsManager.showNavBarEmitter.subscribe((mode)=>{
	        if (mode !== null) {
	        	this.usuario = JSON.parse(localStorage.getItem('currentUser'));
	        } else {
	            this.usuario= new User();
	        	this.usuario.loggedIn=false;
	        }
	    },
    error => {
    	this.alertService.error(error._body);
    });
  }
  
  ngOnDestroy() {
      // unsubscribe to ensure no memory leaks
      this.subscription.unsubscribe();
  }
}
