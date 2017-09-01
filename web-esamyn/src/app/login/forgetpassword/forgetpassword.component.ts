import { Component, OnInit } from '@angular/core';
import { DialogComponent, DialogService } from "ng2-bootstrap-modal";
import { User } from "../../model/index";
import { AuthenticationService } from "../../service/authentication.service";

export interface PromptUserModel {
    title:string;
    usuario:User;
  }

@Component({
  selector: 'app-forgetpassword',
  templateUrl: './forgetpassword.component.html',
  styleUrls: ['./forgetpassword.component.css']
})
export class ForgetpasswordComponent extends DialogComponent<PromptUserModel, User> implements PromptUserModel{
    title: string="RECUPERAR SU CONTRASE&Ntilde;A";
    usuario: User;
    
    constructor(dialogService: DialogService, private authenticationService:AuthenticationService){
        super(dialogService);
        console.log("====> entra en cl ocntructor de usuari ocomponente");
    }

  ngOnInit() {
  }
  
  apply(){
      this.authenticationService.recoverPassword(this.usuario.nombre);
  }

}
