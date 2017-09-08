import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { Http, Headers, RequestOptions, Response, URLSearchParams } from '@angular/http';
import { BaseService } from '../util/base.service';
import { AppConfig } from '../app.config';

@Injectable()
export class CoreesamynService extends BaseService {


    constructor( private _http: Http, private _config: AppConfig ) {
        super();
        this.http = this._http;
        this.config = this._config;
    }

    /**
     * Obtiene el listado de formularios parametrizado para un establecimiento en especifico.
     * @param codigoEstablecimiento codigo del establecimiento para el cual se carga el listado de formularios
     */
    getFormulariosList( codigoEstablecimiento: string ) {
        return this.findByPkUrl( codigoEstablecimiento, 'formulario.crud.findall' );
    }

    /**
     * Metodo dummy para presentacion de datos de preguntas de formulario mock
     */
    getPreguntasList() {
        return this.http.get( './app/mock/preguntas.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        },
            error => {
                return error;
            }
        );
    }

    /**
     * Metodo dummy para presentacion de datos de preguntas de formulario mock
     */
    getPreguntasPorFormularioList() {
        return this.http.get( './app/mock/preguntasEstablecimientoSalud.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        },
            error => {
                return error;
            }
        );
    }

    /**
     * Metodo dummy para presentacion de datos de evaluaciones de encuestas mock
     */
    getGruposFormularioEvaluacionList() {
        return this.http.get( './app/mock/evaluaciongenerada.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx;
        },
            error => {
                return error;
            }
        );
    }

    /**
     * Metodo que obtiene las provincias dummy
     */
    getProvinciasList() {
        return this.http.get( './app/mock/provincias.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        },
            error => {
                return error;
            }
        );
    }

    /**
     * Metodo que obtiene los cantones asociados a una provincia.
     * @param idProvincia
     */
    getCantonesList( idProvincia: number ) {
        return this.getAllPaginated(null, 'canton.crud.findall');
    }

    /**
     * Metodo que obtiene el listado de personas juridacas parametrizadas
     */
    getPersonaJuridicaList() {
        return this.getAllPaginated(null, 'personaJuridica.crud.findall');
    }


    /**
     * Metodo que lista los establecimientos de salud parametrizados
     */
    getEstablecimientoSaludById( id:string ) {
        return this.findByPkUrl(id, 'establecimientoSalud.crud.read' );
    }

    /**
     * Metodo que lista las encuentas generadas para un formulario especifico
     * @param codigoFormulario codigo de formulario del cual se obtiene las encuentas
     */
    getEncuestasPorFormularioAndEstablecimientoList( codigoFormulario: number, codigoEstablecimiento: string ) {
        return this.getAllPaginated(null, 'encuesta.crud.findall');
    }

    /**
     * Metodo que lista todas las encuentas mock
     */
    getEncuestaList() {
        return this.getAllPaginated(null,'encuesta.crud.findall').map((response) =>{
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        },
            error => {
                return error;
            }
        );
    }

    /**
     * Metodo que carga la encuenta por su id
     * @param idEncuesta id de la encuesta
     */
    getEncuestabyId( idEncuesta: number ) {
        return this.findByPkUrl(idEncuesta.toString(),'encuesta.crud.read');
    }

    /**
     * Metodo que carga la informacion de preguntas por id
     * @param codigoPregunta
     */
    getPreguntaById( codigoPregunta: number ) {
        return this.http.get( './app/mock/encuestas.json' ).map(( response ) => {
            let paginatedListx = response.json();
            let x = paginatedListx.objeto;
            return x.filter( pregunta => pregunta.codigo == codigoPregunta );
        },
            error => {
                return error;
            }
        );
    }

    /**
     * Metodo que trae el usuario logeado
     */
    getUsuarios() {
        return this.getAllPaginated( null, 'formulario.crud.findall' );

    }

    /**
     * Metodo que lista las evaluaciones mock
     */
    getEvaluacionList() {
      return this.getAllPaginated(null,'evaluacion.crud.findall').map(( response ) => {
        //return this.http.get( './app/mock/evaluacion.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        } );
    }

    /**
     * Metodo que obtiene la evaluacion por identificador
     * @param id id de la evaluacion
     */
    getEvaluacionById(id:number){

        return this.findByPkUrl(id.toString(),'evaluacion.crud.read').map((response)=>{

        //return this.http.get('./app/mock/evaluacion.json').map((response)=>{

          let paginatedListx=response.json();

          let x = paginatedListx.objeto;

          return x.filter(evaluacion => evaluacion.id == id);

        });

      }

    /**
     * Metodo que obtiene los establecimientos de salud
     */
    getEstablecimientoSaludList() {
        if ( !this.headers ) {
            this.instaceHeader();
        } else {
        }
        return this.getAllPaginated( null, 'establecimientoSalud.crud.findall');
    }

    /**
     * Metodo que registra la encuesta
     * @param entidad a guardar
     */
    createEncuesta( entidad ) {
        return this.manageWithMessage( entidad, 'encuesta.crud.create', "CREACION DE ENCUESTA" );
    }

    /**
     * Metodo que trae la informacion de las preguntas asociados a un formulario y encuesta.
     * Si se envia el formulario sin encuesta, se trata de un nueva encuesta. Si se envia los dos parametros es una encuensta
     * existente
     * @param idFormulario formulario asociado
     * @param idEncuesta encuesta asociada
     */
    getEncuestaByFormularioAndEncuesta( parametro ) {
        return this.findByParams(parametro,'pregunta.crud.findall');
    }
    
    saveEncuesta( tree ){
        return this.manage(tree, "pregunta.crud.create"); 
    }
    
    endEncuesta( tree ){
        return this.manage(tree, "encuesta.crud.finalizare"); 
    }

    /**
     * Metodo que registra el establecimiento salud
     * @param entidad entidad a gaurdar
     */
    createEstablecimientoSalud( entidad ){
      return this.manageWithMessage(entidad,'establecimientoSalud.crud.create',"CREACION ESTABLECIMIENTO SALUD");
    }

}
