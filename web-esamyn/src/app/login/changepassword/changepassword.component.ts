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
    }

  ngOnInit() {
  }
  
  apply(){
      if( this.usuario.contrasenia && this.usuario.passwordConfirm ){
          this.authenticationService.changePassword(this.usuario).subscribe(data=>{
              this.disableButton=false;
              this.mensaje="CONTRASE&Ntilde;A ACTUALIZADA";
              this.returnUrl="/login";
              this.router.navigate([this.returnUrl]);
          });
          //this.result = this.usuario;
          //this.close();
          
          
      } else {
          if( !this.usuario.passwordConfirm || !this.usuario.contrasenia   ){
              this.mensaje="INGRESE CONTRASE&Ntilde;A";
          } 
      }
      
      
  }

}