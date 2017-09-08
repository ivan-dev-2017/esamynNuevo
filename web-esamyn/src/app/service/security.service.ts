import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response,URLSearchParams } from '@angular/http';
import { AppConfig } from '../app.config';
import { BaseService } from '../util/index';
import { Page,PaginatedList } from '../model/index';

@Injectable()
export class SecurityService extends BaseService{
	

  constructor(private _http: Http, private _config: AppConfig) { 
	  super();
	  this.http=this._http;
	  this.config =this._config;
  }
  
  

  getUsuariosWithRol(codigoRol:string ) {
	this.params.append("codigoRol",codigoRol); 
	this.options = new RequestOptions({ headers: this.headers, search:this.params });
	return this.http
	      .get(this.config.apiUrl + this.services["usuario.custom.findwithrol"], this.options)
	  .map((response: Response) => {
			let paginatedListx = response.json();
			return paginatedListx;
		},
	  error => {
	  });
	}
  
  getAuthenticationItems(codigoRol:string, usuario:string ) {
		this.params = new URLSearchParams();
		this.params.append("codigoRol",codigoRol); 
		this.params.append("usuario",usuario);
		this.options = new RequestOptions({ headers: this.headers, search:this.params });
		return this.http
		      .get(this.config.apiUrl + this.services["rol.custom.getAuthorizationItems"], this.options)
		  .map((response: Response) => {
				let paginatedListx = response.json();
				return paginatedListx;
			},
		  error => {
		  });
  }
  
  getAllItems(service:string) {
		this.options = new RequestOptions({ headers: this.headers, search:this.params });
		return this.http
		      .get(this.config.apiUrl + this.services[service], this.options)
		  .map((response: Response) => {
				let paginatedListx = response.json();
				return paginatedListx;
			},
		  error => {
		  });
  }
  
  actionOnMenu(service:string, codigoRol:string, idLevel:string) {
		this.params.append("codigoRol",codigoRol); 
		this.params.append("idLevel",idLevel);
		this.options = new RequestOptions({ headers: this.headers, search:this.params });
		return this.http
		      .get(this.config.apiUrl + this.services[service], this.options)
		  .map((response: Response) => {
				let paginatedListx = response.json();
				return paginatedListx;
			},
		  error => {
		  });
}
  
  

}
