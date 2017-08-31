import { Injectable } from '@angular/core';
import { Http, Headers, Response,RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import { User,Login } from '../model/index';


import { AppConfig } from '../app.config';
import { GlobaleventsmanagerService } from './globaleventsmanager.service';

@Injectable()
export class AuthenticationService {
    
    
    private headers:Headers;
    private options: RequestOptions;

    constructor(private http: Http, private config: AppConfig,
    		private globaleventsmanagerService: GlobaleventsmanagerService) { }

    login(usuarioAuth: Login) {
    	console.log("=====.AuthenticationService ingresa a login " + JSON.stringify(usuarioAuth));
    	this.headers = new Headers({ 'Content-Type': 'application/json','Accept':'application/json','Authorization': 'login'+ this.config.keyFirstLogin });
    	let usuarioesamyn={usuario:usuarioAuth.name,password:usuarioAuth.password};
    	//let usuarioesamyn={usuario:"1716187206",password:"81dc9bdb52d04dc20036dbd8313ed055"};
    	return this.http.post(  this.config.apiUrl+ 'rest/usuario',
    	        usuarioesamyn)
        		.map((response: Response) => {
        			console.log("===>respondiod ");
        			let loginWrapper = response.json();
        			console.log("===>retorno login wrapper "+ JSON.stringify(loginWrapper));
        			let user = loginWrapper.objeto;
        			if (user && user.token) {
        			    let usuario= new User();
        			    usuario.nombreUsuario=user.username;
        		        usuario.password=user.password;
        		        usuario.loggedIn=true;
        				localStorage.setItem('currentUser', JSON.stringify(usuario));
						//localStorage.setItem('menu', JSON.stringify(loginWrapper.menuWrapper.panelMenuAppList));
						localStorage.setItem('defaultPageSize', loginWrapper.defaultPageSize);
						localStorage.setItem('services', JSON.stringify(this.config.servicios ));
        			}
        			return user;
        		});
    	
    	
    }

    logout(usuarioAuth: User) {
    	let headersLoc = new Headers({ 'Authorization': 'Bearer' + usuarioAuth.token});
    	usuarioAuth.loggedIn=false;
    	let services = JSON.parse( localStorage.getItem('services'));
    	console.log("===> servicio logout " + services["security.logout"] );
        return this.http.post(services["security.logout"],
        		              {usuario:usuarioAuth},
        		              new RequestOptions({ headers: headersLoc }))
        .map((response: Response) => {
			console.log("===>respondiod " + JSON.stringify(response.json()));
			let loginWrapper = response.json();
			console.log("===>rlogin wrapper "+ JSON.stringify(loginWrapper));
			let user = loginWrapper.usuario;
			loginWrapper.usuario =usuarioAuth;
			if (user && user.token) {
				localStorage.removeItem('currentUser');
		        localStorage.removeItem('menu');
			}
			return loginWrapper;
		});
    }
}