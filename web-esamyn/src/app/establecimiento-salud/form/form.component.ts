import { Component, OnInit } from '@angular/core';
import { FormBuilder,Validators,FormControl,FormGroup } from '@angular/forms';
import {  CoreesamynService } from '../../service/coreesamyn.service';
import { MessageComponent } from '../../comp/message/message.component';



@Component( {
    selector: 'establecimiento-salud-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.css']
} )
export class EstablecimientoSaludComponent implements OnInit {
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
        console.log( "<<<<< ENTRO EN ESTABLECIMIENTO SALUD  >>>>>" );
        this.failures.push( "InvalidoArray" );
        this.coreesamyn.getCantonesList(1).subscribe(
            data => {
                console.log( "<<<<<  retorno: " + JSON.stringify( data ) );
                this.cantones = data.objeto;
                setTimeout(() => { this.loadingIndicator = false; }, 1500 );
            } );
        this.coreesamyn.getPersonaJuridicaList().subscribe(
            data => {
                console.log( "<<<<< RETORNO PERSONAS JURIDICAS " + JSON.stringify( data ) );
                this.personasJuridicas = data.objeto;
                setTimeout(() => { this.loadingIndicator = false; }, 1500 );
            } );
    }

    ngOnInit() {
    }

    save() {

        console.log( "establecimiento a crear "+JSON.stringify( this.establecimientoSalud ) );
        this.coreesamyn.createEstablecimientoSalud(this.establecimientoSalud).subscribe(data=>{
          console.log("establecimiento creado"+JSON.stringify(data.objeto));
        });
    }

    cambiarCantones() {
        //OBTENER CANTONES DESDE JSON

    }

    clear() {
        this.standardForm.reset();
  }


}
