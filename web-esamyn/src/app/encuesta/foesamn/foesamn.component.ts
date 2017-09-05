import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CoreesamynService } from '../../service/coreesamyn.service';


@Component( {
    selector: 'app-foesamn',
    templateUrl: './foesamn.component.html',
    styleUrls: ['./foesamn.component.css']
} )
export class FoesamnComponent implements OnInit {

    preguntas = [];
    preguntacero = {};
    encuesta = {};
    distrito = "";
    establecimientoSaludVar = [];
    responsable = "";
    cargo = "";
    unicode = "";
    evaluador = "";
    fecha = "";
    parametro = {
            "idFormulario":null,
            "idEncuesta": null
        };
    constructor( private coreesamynService: CoreesamynService, private route: ActivatedRoute ) {
        
    }


    ngOnInit() {
        this.getPreguntas();
    }

    public getPreguntas() {
        if ( this.route )
            console.log( "==Routa con parametros " + JSON.stringify( this.route ) );
        this.route.queryParams.subscribe(params => {
            console.log("===> ingresa a route queryparams con parametros: " + JSON.stringify(params) );
            this.parametro.idFormulario = params['idFormulario'];
            this.parametro.idEncuesta = params['idEncuesta'];
        });
        this.coreesamynService.getEncuestaByFormularioAndEncuesta(this.parametro ).subscribe( data => {
            this.preguntas = data.pregunta;
            console.log( "PREGUNTAS CONSULTADAS: " + JSON.stringify(this.preguntas ) );
        } )

    }

    public saveEncuesta() {

        console.log( "enviando preguntas " + JSON.stringify( this.preguntas ) );

    }


}
