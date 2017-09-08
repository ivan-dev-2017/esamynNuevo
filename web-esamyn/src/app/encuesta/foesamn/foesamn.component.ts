import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CoreesamynService } from '../../service/coreesamyn.service';


@Component( {
    selector: 'app-foesamn',
    templateUrl: './foesamn.component.html',
    styleUrls: ['./foesamn.component.css']
} )
export class FoesamnComponent implements OnInit {

    objetoGlobal={"idEncuesta": null,
            "idFormulario": null,
            "responsable": null,
            "cargo": null,
            "extra": null,
            "pregunta":[]};
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

    /**
     * Metodo que obtiene la informacion de encuesta y preguntas asociadas
     * 1. Obtiene lis parametros enviados desde la ruta
     * 2. Obtiene la encuesta por id de encuesta
     * 3. Obtiene las preguntas asociadas a la encuesta y el formulario
     */
    public getEncuestaAndPreguntas() {
        this.route.queryParams.subscribe(params => {
            this.parametro.idFormulario = +params['idFormulario'];
            this.parametro.idEncuesta = +params['idEncuesta'];
        });
        this.coreesamynService.getEncuestabyId(this.parametro.idEncuesta).subscribe(data=>{
            this.encuesta=data.objeto;
            if( this.encuesta && this.encuesta.establecimientoSalud){
                this.establecimientoSalud=this.encuesta.establecimientoSalud;
            } else if(  localStorage.getItem("establecimientoSalud") ){
                this.establecimientoSalud= JSON.parse( localStorage.getItem("establecimientoSalud") );
            }
        });

        this.coreesamynService.getEncuestaByFormularioAndEncuesta(this.parametro ).subscribe( data => {
            this.objetoGlobal=data.objeto;
            this.preguntas = data.objeto.pregunta;

            if( this.preguntas && this.preguntas.length>2 ){
                this.observaciones=this.preguntas[2];
                this.documentos=this.preguntas[3];
            }

        } );
    }

    public saveEncuesta() {
        this.objetoGlobal.idEncuesta=this.parametro.idEncuesta;
        this.objetoGlobal.idFormulario=this.parametro.idFormulario;
        this.preguntas[2]=this.observaciones;
        this.preguntas[3]=this.documentos;
        this.objetoGlobal.pregunta=this.preguntas;
        this.coreesamynService.saveEncuesta(this.objetoGlobal);
    }
    
    public endEncuesta(){
        this.objetoGlobal.idEncuesta=this.parametro.idEncuesta;
        this.objetoGlobal.idFormulario=this.parametro.idFormulario;
        this.preguntas[2]=this.observaciones;
        this.preguntas[3]=this.documentos;
        this.objetoGlobal.pregunta=this.preguntas;
        this.coreesamynService.endEncuesta(this.objetoGlobal);
    }


}
