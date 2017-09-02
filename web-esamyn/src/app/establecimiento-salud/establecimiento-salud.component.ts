import { Component, OnInit } from '@angular/core';
import {  CoreesamynService } from '../service/coreesamyn.service';
import { FormBuilder,Validators,FormControl,FormGroup } from '@angular/forms';
import { MessageComponent } from '../comp/message/message.component';



@Component({
  selector: 'app-establecimiento-salud',
  templateUrl: './establecimiento-salud.component.html',
  styleUrls: ['./establecimiento-salud.component.css']
})
export class EstablecimientoSaludComponent implements OnInit {

  failures:Array<string> = new Array;
  personasJuridicas = [];
  provincias = [];
  cantones = [];
  establecimientoSalud = {};
  provincia={"id":null,"codigo":null,"nombre":null,"cantonList":null};
  loadingIndicator: boolean = true;
    
  constructor(private coreesamyn:CoreesamynService) { 
    console.log("<<<<< ENTRO EN ESTABLECIMIENTO SALUD  >>>>>");
    this.failures.push("InvalidoArray");
    //OBTENER PROVINCIAS DESDE JSON
    this.coreesamyn.getProvinciasList().subscribe(
    data=>{
        console.log("<<<<<  retorno: "+JSON.stringify(data));
        this.provincias=data;
        setTimeout(() => {this.loadingIndicator = false; }, 1500);
    });
      
    //OBTENER PERSONAS JURIDICAS DESDE JSON
    this.coreesamyn.getPersonaJuridicaList().subscribe(
    data=>{
        console.log("<<<<<  retorno: "+JSON.stringify(data));
        this.personasJuridicas=data;
        setTimeout(() => {this.loadingIndicator = false; }, 1500);
    });
      
    //OBTENER FORMULARIO DE ESTABLECIMIENTO SALUD DESDE JSON
    this.coreesamyn.getEstablecimientoSaludList().subscribe(
    data=>{
        console.log("<<<<<  retorno: "+JSON.stringify(data));
        this.establecimientoSalud=data;
        setTimeout(() => {this.loadingIndicator = false; }, 1500);
    });
  }

  ngOnInit() {
  }
    
  save(){
      console.log(JSON.stringify(this.establecimientoSalud));
  }
    
  cambiarCantones(){
      //OBTENER CANTONES DESDE JSON
      this.coreesamyn.getCantonesList(this.provincia.id).subscribe(
      data=>{
          console.log("<<<<<  retorno: "+JSON.stringify(data));
          this.cantones=data;
          setTimeout(() => {this.loadingIndicator = false; }, 1500);
      });
  }

}
