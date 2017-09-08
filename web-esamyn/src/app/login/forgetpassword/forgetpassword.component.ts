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
    mensaje: string;
    constructor(dialogService: DialogService, private authenticationService:AuthenticationService){
        super(dialogService);
    }

  ngOnInit() {
  }
  
  apply(){
      if( this.usuario.nombre){
          this.authenticationService.recoverPassword(this.usuario).subscribe(data=>{
          });
          this.mensaje="REVISE SU CORREO ELECTRONICO";
      } else {
          if( !this.usuario.nombre  ){
              this.mensaje="INGRESE SU NOMBRE DE USUARIO";
          } 
      }
  }

}
