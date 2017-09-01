import { Injectable } from '@angular/core';
import { BehaviorSubject } from "rxjs/BehaviorSubject";
import { Observable } from "rxjs/Observable";
import { User,Login } from '../model/index';

@Injectable()
export class GlobaleventsmanagerService {
	private _showNavBar: BehaviorSubject<Login> = new BehaviorSubject<Login>(null);
    public showNavBarEmitter: Observable<Login> = this._showNavBar.asObservable();

  constructor() { }
  
  showNavBar(user: Login) {
	  console.log("===> observable " +JSON.stringify(user));
      this._showNavBar.next(user);
      return user;
  }

}
