import {User, Menu} from "./index";

export class Login {
    usuario:User;
	user:string;
	name:string;
	identificador:string;
	cargo:string;
	password:string;
	newPassword:string;
	role:string;
	roleDescripcion:string;
	sessionId:string;
	captcha:string;
	captchaPublicKey:string;
	loggedIn:boolean;
	
	menuWrapper:Menu;
	firstLogin:boolean;
	servicios:any[];
    defaultPageNumber:number;
}