import { Component, OnInit } from '@angular/core';
import { FormBuilder,Validators,FormControl,FormGroup } from '@angular/forms';
import {  CoreesamynService } from '../../service/coreesamyn.service';
import { MessageComponent } from '../../comp/message/message.component';



@Component( {
    selector: 'establecimiento-salud-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.css']
} )
export class EstablecimientoSaludFormComponent implements OnInit {
    failures: Array<string> = new Array;
    standardForm: FormGroup;
    messages: string = "Invalido";
    personasJuridicas =[];
    cantones = [];
    establecimientoSalud = {
    	"codigo": null,
      "nombre":null,
    	"unicodigo": null,
    	"direccion": null,
    	"latitud": null,
    	"longitud": null,
    	"telefono": null,
    	"correoElectronico": null,
    	"nombreResponsable": null,
    	"zona": null,
    	"distrito": null,
    	"canton":null,
    	"personaJuridica": null
    };
    loadingIndicator: boolean = true;

    constructor( private coreesamyn: CoreesamynService ) {
        this.failures.push( "InvalidoArray" );
        this.coreesamyn.getCantonesList(1).subscribe(
            data => {
                this.cantones = data.objeto;
                setTimeout(() => { this.loadingIndicator = false; }, 1500 );
            } );
        this.coreesamyn.getPersonaJuridicaList().subscribe(
            data => {
                this.personasJuridicas = data.objeto;
                setTimeout(() => { this.loadingIndicator = false; }, 1500 );
            } );
    }

    ngOnInit() {
    }

    save() {
        this.coreesamyn.createEstablecimientoSalud(this.establecimientoSalud).subscribe(data=>{
            let establecimientoCreado=data;
            console.log(JSON.stringify(establecimientoCreado));
        });
    }

    cambiarCantones() {
        //OBTENER CANTONES DESDE JSON

    }

    clear() {
        this.standardForm.reset();
  }


}
