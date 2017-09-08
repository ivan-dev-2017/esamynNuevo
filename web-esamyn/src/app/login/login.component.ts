import { Component, OnInit } from '@angular/core';
import {Md5} from 'ts-md5/dist/md5';
import { Router, ActivatedRoute } from '@angular/router';
import { DialogService } from "ng2-bootstrap-modal";

import { AlertService, AuthenticationService } from '../service/index';
import { GlobaleventsmanagerService } from '../service/globaleventsmanager.service';
import { User,Login } from '../model/index';

import {ForgetpasswordComponent} from "../login/forgetpassword/forgetpassword.component";


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

	model: Login = new Login();
    loading = false;
    returnUrl: string=null;
    usuario: User;
    constructor(
        private route: ActivatedRoute,
        private router: Router,
        private authenticationService: AuthenticationService,
        private alertService: AlertService,
        private globaleventsmanagerService: GlobaleventsmanagerService,
        private dialogService:DialogService) { }

    ngOnInit() {
        // reset login status
    	if( this.model.usuario != null ){
    		this.model.usuario.loggedIn=false;
    		this.authenticationService.logout(this.model.usuario);
    	}
        // get return url from route parameters or default to '/'
    	if( this.returnUrl == null ){
    		this.returnUrl = "/login";
    	} else {
    		this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
    	}
    }

    login() {
    	if( this.model ){
    	    this.model.password=Md5.hashStr(this.model.password)  as string ;
    	}
        this.authenticationService.login(this.model)
            .subscribe(
                data => {
                	this.model.loggedIn=true;
                	this.model.role= ""+data.rol.codigo;
                	this.model.roleDescripcion=data.rol.descripcion;
                	this.globaleventsmanagerService.showNavBar(this.model);
                    this.returnUrl="/home";
                    this.router.navigate([this.returnUrl]);
                    this.returnUrl = null;
                },
                error => {
                    this.alertService.error(error._body);
                    this.loading = false;
                });
    }
    
    showPrompt() {
        let userLoc = new User(); 
        this.dialogService.addDialog(ForgetpasswordComponent, {
          title:'RECUPERACION CONTRASENA USUARIO',
          usuario:userLoc })
          .subscribe((usuarioRet)=>{
            this.usuario = usuarioRet;
          });
      }

}
