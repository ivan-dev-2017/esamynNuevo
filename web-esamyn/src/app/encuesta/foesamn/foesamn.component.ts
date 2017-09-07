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
    observaciones = {
            "codigo": null,
            "texto": null,
            "ayuda": null,
            "prefijo": null,
            "subfijo": null,
            "validacion": null,
            "orden": null,
            "codigoTipoPregunta": null,
            "etiquetaTipoPregunta": null,
            "codigoRespuesta": null,
            "codigoEncuesta": null,
            "valorNumero": null,
            "valorTexto": null,
            "valorFecha": null,
            "valorBooleano": null,
            "preguntaLista": []};
    documentos = {
            "codigo": null,
            "texto": null,
            "ayuda": null,
            "prefijo": null,
            "subfijo": null,
            "validacion": null,
            "orden": null,
            "codigoTipoPregunta": null,
            "etiquetaTipoPregunta": null,
            "codigoRespuesta": null,
            "codigoEncuesta": null,
            "valorNumero": null,
            "valorTexto": null,
            "valorFecha": null,
            "valorBooleano": null,
            "preguntaLista": []};
    preguntacero = {};
    encuesta = {
            "codigo": null,
            "responsable": null,
            "cargo": null,
            "extra": null,
            "establecimientoSalud": null,
            "personaJuridica": null,
            "evaluacionList": null
          };
    distrito = "";
    establecimientoSalud =  {
            "codigo": null,
            "unicodigo": null,
            "direccion": null,
            "latitud": null,
            "longitud": null,
            "telefono": null,
            "correoElectronico": null,
            "nombreResponsable": null,
            "zona": null,
            "distrito": null,
            "canton":null
            };
    responsable = "";
    cargo = "";
    unicode = "";
    evaluador = "";
    fecha = "";
    parametro = {
            "idFormulario":null,
            "idEncuesta": null
        };
    dateObj = null;
    month = null; //months from 1-12
    day = null;
    year = null;

    constructor( private coreesamynService: CoreesamynService, private route: ActivatedRoute ) {
        this.dateObj = new Date();
        this.month = this.dateObj.getUTCMonth() + 1; //months from 1-12
        this.day = this.dateObj.getUTCDate();
        this.year = this.dateObj.getUTCFullYear();
        this.getEncuestaAndPreguntas();
    }

    ngOnInit() {

    }

    public getEncuestaAndPreguntas() {
        console.log( "==getPreguntas Routa con parametros ");
        this.route.queryParams.subscribe(params => {
            console.log("===> ingresa a route queryparams con parametros: " + JSON.stringify(params) );
            this.parametro.idFormulario = +params['idFormulario'];
            console.log("===> kleyo id firmlario: "  );
            this.parametro.idEncuesta = +params['idEncuesta'];
            console.log("===> kleyo id encuesta: "  );
        });
        console.log( "==lleno parametros:   " + JSON.stringify(this.parametro));
        this.coreesamynService.getEncuestabyId(this.parametro.idEncuesta).subscribe(data=>{
            console.log( "==obtvo enceusta:   " + JSON.stringify(data));
            this.encuesta=data.objeto;
            if( this.encuesta && this.encuesta.establecimientoSalud){
                this.establecimientoSalud=this.encuesta.establecimientoSalud;
            } else if(  localStorage.getItem("establecimientoSalud") ){
                console.log("foesam ingresa a tomar el establecimiento dememoria " + localStorage.getItem("establecimientoSalud"))
                this.establecimientoSalud= JSON.parse( localStorage.getItem("establecimientoSalud") );
            }
        });

        this.coreesamynService.getEncuestaByFormularioAndEncuesta(this.parametro ).subscribe( data => {
            //console.log( "PREGUNTAS CONSULTADAS: " + JSON.stringify(data ) );
            this.preguntas = data.objeto.pregunta;

            console.log( "PREGUNTAS CONSULTADAS: " + JSON.stringify(this.preguntas ) );

            if( this.preguntas && this.preguntas.length>2 ){
                this.observaciones=this.preguntas[2];
                console.log( "observaciones CONSULTADAS aness: " + JSON.stringify(this.observaciones ) );
                this.observaciones.preguntaLista=this.observaciones.preguntaLista.filter(item => item.codigoTipoPregunta === 1);
                console.log( "observaciones CONSULTADAS despyues: " + JSON.stringify(this.observaciones ) );
                this.documentos=this.preguntas[3];
                console.log( "observaciones CONSULTADAS: " + JSON.stringify(this.observaciones ) );
                console.log( "documentos CONSULTADAS: " + JSON.stringify(this.documentos ) );
            }

        } );



    }

    public saveEncuesta() {

        console.log( "enviando preguntas " + JSON.stringify( this.preguntas ) );

    }


}
