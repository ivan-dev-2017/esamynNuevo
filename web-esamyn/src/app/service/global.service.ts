import { Injectable,EventEmitter,Output } from '@angular/core';
import { User } from '../model/user';

@Injectable()
export class GlobalService {

	data: User;    
	@Output() dataChangeObserver: EventEmitter<User>=new EventEmitter<User>();

  	constructor() {
  	};

  	setData(data:User) {
  		this.data = data;
  		this.dataChangeObserver.emit(this.data); 
  		return this.dataChangeObserver;
  	}; 
  	
  	getData(){
  		return this.data;
  	}
  	
}
