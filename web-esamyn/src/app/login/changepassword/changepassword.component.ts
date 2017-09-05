import { Component, OnInit } from '@angular/core';
import { DialogComponent, DialogService } from "ng2-bootstrap-modal";
import { User } from "../../model/index";
import { AuthenticationService } from "../../service/authentication.service";
import { Router, ActivatedRoute } from '@angular/router';

export interface PromptUserModel {
    title:string;
    usuario:User;
  }

@Component({
    selector: 'app-changepassword',
    templateUrl: './changepassword.component.html',
    styleUrls: ['./changepassword.component.css']
  })
export class ChangepasswordComponent extends DialogComponent<PromptUserModel, User> implements PromptUserModel{
    title: string="CAMBIAR SU CONTRASE&Ntilde;A";
    usuario: User;
    mensaje: string;
    disableButton: boolean;
    returnUrl: string=null;
    
    constructor(private route: ActivatedRoute,
            private router: Router,
            dialogService: DialogService, 
            private authenticationService:AuthenticationService){
        super(dialogService);
        this.disableButton=false;
        console.log("====> entra en cl ocntructor de usuari ocomponente");
    }

  ngOnInit() {
  }
  
  apply(){
      this.authenticationService.recoverPassword(this.usuario.nombre);
      this.mensaje="PASSWORD ACTUALIZADO";
      this.returnUrl="/login";
      this.router.navigate([this.returnUrl]);
  }

}