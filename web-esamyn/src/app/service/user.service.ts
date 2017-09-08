import { Injectable } from '@angular/core';
import {Observable} from "rxjs";
import {WebApiObservableService} from "./abstractwebapi.service";

import { Http, Headers, RequestOptions, Response,URLSearchParams } from '@angular/http';

import { AppConfig } from '../app.config';
import { BaseService } from '../util/index';
import { User, Page,PaginatedList } from '../model/index';

@Injectable()
export class UserService extends BaseService{
	//headers: Headers;
	//options: RequestOptions;

    constructor(private _http: Http, private _config: AppConfig, private webApi:WebApiObservableService) { 
        super();
        this.http=this._http;
        this.config =this._config;
    }
    
    
    
    

    paginatedList:PaginatedList<User>;
    
    getAll( ) {
        return this.http.get(this.config.apiUrl + '/users', this.jwt()).map((response: Response) => response.json());
    }
    
    getAllPaginated(page:Page ) {
    	return this.http.get("./app/mock/userdata.json")
    	.map((response: Response) => {
    				let paginatedListx = response.json();
    				return paginatedListx;
    			} );
    }
    
    
    
    private getPagedData(page: Page): PaginatedList<User>{
    	let pageLoc=new PaginatedList<User>();
    	
        return pageLoc;
    }

    getById(id: string) {
        return this.http.get(this.config.apiUrl + '/users/' + id, this.jwt()).map((response: Response) => response.json());
    }

    create(user: User) {
    	return this.http.post( this.config.apiUrl +this.services["usuario.crud.create"],
	              {usuario:user},new RequestOptions({ headers: this.headers }))
				  .map( (response: Response) => {
						let usuarioWrapper = response.json();
						return usuarioWrapper;
					} );
    }

    update(user: User) {
        return this.http.put(this.config.apiUrl + '/users/' + user.id, user, this.jwt());
    }

    delete(id: string) {
        this.params = new URLSearchParams();
        this.params.append("nombreUsuario",id); 
        this.options = new RequestOptions({ headers: this.headers, search:this.params });
        return this.http.get(this.services["usuario.crud.delete"],this.options).map( (response: Response) => {
        } );
    }

    // private helper methods

    private jwt() {
        // create authorization header with jwt token
        let currentUser = JSON.parse(localStorage.getItem('currentUser'));
        if (currentUser && currentUser.token) {
            let headers = new Headers({ 'Authorization': 'Bearer ' + currentUser.token });
            return new RequestOptions({ headers: headers });
        }
    }
}