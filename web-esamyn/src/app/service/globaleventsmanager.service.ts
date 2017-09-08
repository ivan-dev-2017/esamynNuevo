import { Injectable } from '@angular/core';
import { BehaviorSubject } from "rxjs/BehaviorSubject";
import { Observable } from "rxjs/Observable";
import { User,Login } from '../model/index';

@Injectable()
export class GlobaleventsmanagerService {
	private _showNavBar: BehaviorSubject<Login> = new BehaviorSubject<Login>(null);
    public showNavBarEmitter: Observable<Login> = this._showNavBar.asObservable();

    private _selectedEtablecimiento: BehaviorSubject<any> = new BehaviorSubject<any>(null);
    public selectedEtablecimientoEmitter: Observable<any> = this._selectedEtablecimiento.asObservable();

  constructor() { }
  
  showNavBar(user: Login) {
      this._showNavBar.next(user);
      return user;
      
  }
  
  selectedEtablecimiento(establecimiento: any) {
      this._selectedEtablecimiento.next(establecimiento);
      return establecimiento;
      
  }

}
