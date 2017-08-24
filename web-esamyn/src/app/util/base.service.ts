import { Http, Headers, Response,RequestOptions,URLSearchParams } from '@angular/http';
import { Page,PaginatedList } from '../model/index';
import { AppConfig } from '../app.config';

export class BaseService {
	
	public headers:Headers;
	public options: RequestOptions;
	public services:any;
    public params: URLSearchParams;
	public http:Http;
	public config: AppConfig;

	constructor( ){
		this.params = new URLSearchParams();
		if( localStorage.getItem('currentUser') ){
			console.log("===ingresa si esta logeado");
			let u = JSON.parse( localStorage.getItem('currentUser') );
			this.headers= new Headers({ 'Content-Type': 'application/json','Accept':'application/json', 'Authorization': 'Bearer' + u.token });
		}
		console.log("===previo a valdar servicios");
		if( localStorage.getItem('services') ){
			console.log("===ingresa si existe servicios " + JSON.stringify( localStorage.getItem('services') ));
			this.services= JSON.parse( localStorage.getItem('services'));
		}
		
	}
	
	setSearchParams(page:Page){
	    this.params = new URLSearchParams();
		this.params.append("pageNumber", ""+page.pageNumber);
		this.params.append("pageSize", ""+page.size);
		this.params.append("sortFields", page.sortFields);
		this.params.append("sortDirections", page.sortDirections);
		this.params.append("isPaginated", page.isPaginated);
	}
	
	getAllPaginated(page:Page, serviceName:string ) {
	  	
	  	let x= this.services[serviceName];
	  	this.setSearchParams( page );  
	      console.log("==> parametros obtenidos " +  this.params.toString() );
	      this.options = new RequestOptions({ headers: this.headers, search:this.params });
	      return this.http.get(this.config.apiUrl + x, this.options)
	          .map((response: Response) => {
					let paginatedListx = response.json();
					return paginatedListx;
				},
	          error => {
	          	console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
	          	return error;
	          });
	  }
	
	findByPk(id:string, serviceName:string ) {
	    this.params = new URLSearchParams();
        this.params.append("id", id);
          console.log("==> parametros obtenidos " +  this.params.toString() );
          this.options = new RequestOptions({ headers: this.headers, search:this.params });
          return this.http.get(this.config.apiUrl +this.services[serviceName], this.options)
              .map((response: Response) => {
                    let entidad = response.json();
                    return entidad;
                },
              error => {
                console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
                return error;
              });
      }
	
	manage(entidad, serviceName:string ) {
          console.log("==> parametros obtenidos " +  this.params.toString() );
          this.options = new RequestOptions({ headers: this.headers });
          return this.http.post(this.config.apiUrl + this.services[serviceName], 
                  {"entidad":entidad}
                  ,this.options)
              .map((response: Response) => {
                    let entidad = response.json();
                    return entidad;
                },
              error => {
                console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
                return error;
              });
      }
	
}