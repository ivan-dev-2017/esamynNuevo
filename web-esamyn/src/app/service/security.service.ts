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
	console.log("====>SecurityService.getUsuariosWithRol " +  codigoRol  );
	console.log("====>called service from server " +  this.services["usuario.custom.findwithrol"]  );
	this.params.append("codigoRol",codigoRol); 
	console.log("==> parametros obtenidos " +  this.params.toString() );
	this.options = new RequestOptions({ headers: this.headers, search:this.params });
	return this.http
	      .get(this.config.apiUrl + this.services["usuario.custom.findwithrol"], this.options)
	  .map((response: Response) => {
			let paginatedListx = response.json();
			return paginatedListx;
		},
	  error => {
	  	console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
	  });
	}
  
  getAuthenticationItems(codigoRol:string, usuario:string ) {
		console.log("====>SecurityService.getAuthenticationItems " +  codigoRol  );
		console.log("====>called service from server " +  this.services["usuario.custom.findwithrol"]  );
		this.params = new URLSearchParams();
		this.params.append("codigoRol",codigoRol); 
		this.params.append("usuario",usuario);
		console.log("==> parametros obtenidos " +  this.params.toString() );
		this.options = new RequestOptions({ headers: this.headers, search:this.params });
		return this.http
		      .get(this.config.apiUrl + this.services["rol.custom.getAuthorizationItems"], this.options)
		  .map((response: Response) => {
				let paginatedListx = response.json();
				return paginatedListx;
			},
		  error => {
		  	console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
		  });
  }
  
  getAllItems(service:string) {
		console.log("====>SecurityService.getAllItems " + service   );
		console.log("====>called service from server " +  this.services[service]  );
		this.options = new RequestOptions({ headers: this.headers, search:this.params });
		return this.http
		      .get(this.config.apiUrl + this.services[service], this.options)
		  .map((response: Response) => {
				let paginatedListx = response.json();
				return paginatedListx;
			},
		  error => {
		  	console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
		  });
  }
  
  actionOnMenu(service:string, codigoRol:string, idLevel:string) {
		console.log("====>SecurityService.actionOnMenu " + service   );
		console.log("====>called service from server " +  this.services[service]  );
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
		  	console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
		  });
}
  
  

}
