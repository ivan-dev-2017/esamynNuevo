import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { Http, Headers, RequestOptions, Response, URLSearchParams } from '@angular/http';
import { BaseService } from '../util/base.service';
import { AppConfig } from '../app.config';

@Injectable()
export class CoreesamynService extends BaseService {


    constructor( private _http: Http, private _config: AppConfig ) {
        super();
        console.log( "inicializa eCoreesamynService" );
        this.http = this._http;
        this.config = this._config;
    }

    /**
     * Obtiene el listado de formularios parametrizado para un establecimiento en especifico.
     * @param codigoEstablecimiento codigo del establecimiento para el cual se carga el listado de formularios
     */
    getFormulariosList( codigoEstablecimiento: string ) {
        console.log( "==Entra en CoreesamynService getFormulariosList" );
        return this.findByPkUrl( codigoEstablecimiento, 'formulario.crud.findall' );
        /*return this.http.get('./app/mock/formularios.json').map((response) =>{
            //console.log("==>despues
             de for,ulario " + JSON.stringify(response));
            let paginatedListx = response.json();
            //console.log("==>despues de for,ulario " + JSON.stringify(paginatedListx.objeto));
            return paginatedListx.objeto;
            },
            error => {
                console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
                return error;
            }
         );*/
    }

    /**
     * Metodo dummy para presentacion de datos de preguntas de formulario mock
     */
    getPreguntasList() {
        console.log( "==Entra en CoreesamynService getFormulariosList" );
        //return this.getAllPaginated(null, 'formulario.crud.findall');
        return this.http.get( './app/mock/preguntas.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        },
            error => {
                console.log( "==>despues de buscar usuario error  " + JSON.stringify( error ) );
                return error;
            }
        );
    }

    /**
     * Metodo dummy para presentacion de datos de preguntas de formulario mock
     */
    getPreguntasPorFormularioList() {
        console.log( "==Entra en CoreesamynService getFormulariosList" );
        //return this.getAllPaginated(formulario, 'pregunta.crud.findall');
        return this.http.get( './app/mock/preguntasEstablecimientoSalud.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        },
            error => {
                console.log( "==>despues de buscar usuario error  " + JSON.stringify( error ) );
                return error;
            }
        );
    }

    /**
     * Metodo dummy para presentacion de datos de evaluaciones de encuestas mock
     */
    getGruposFormularioEvaluacionList() {
        console.log( "==Entra en CoreesamynService getGruposFormularioEvaluacionList" );
        //return this.getAllPaginated(null, 'evaluacion.crud.findall');
        return this.http.get( './app/mock/evaluaciongenerada.json' ).map(( response ) => {
            let paginatedListx = response.json();
            console.log( JSON.stringify( paginatedListx ) );
            return paginatedListx;
        },
            error => {
                console.log( "==>despues de buscar usuario error  " + JSON.stringify( error ) );
                return error;
            }
        );
    }

    /**
     * Metodo que obtiene las provincias parametrizadas
     */
    getProvinciasList() {
        console.log( "==Entra en CoreesamynService getProvinciasList" );
        //return this.getAllPaginated(null, 'formulario.crud.findall');
        return this.http.get( './app/mock/provincias.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        },
            error => {
                console.log( "==>despues de buscar usuario error  " + JSON.stringify( error ) );
                return error;
            }
        );
    }

    /**
     * Metodo que obtiene los cantones asociados a una provincia.
     * @param idProvincia
     */
    getCantonesList( idProvincia: number ) {
        console.log( "==Entra en CoreesamynService getCantonesList" );
        //return this.getAllPaginated(null, 'formulario.crud.findall');
        return this.http.get( './app/mock/cantones.json' ).map(( response ) => {
            let paginatedListx = response.json();
            let x = paginatedListx.objeto;
            return x.filter( canton => canton.provincia.id == idProvincia );
        },
            error => {
                console.log( "==>despues de buscar usuario error  " + JSON.stringify( error ) );
                return error;
            }
        );
    }

    /**
     * Metodo que obtiene el listado de personas juridacas parametrizadas
     */
    getPersonaJuridicaList() {
        console.log( "==Entra en CoreesamynService getPersonaJuridicaList" );
        //return this.getAllPaginated(null, 'formulario.crud.findall');
        return this.http.get( './app/mock/personaJuridica.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        },
            error => {
                console.log( "==>despues de buscar usuario error  " + JSON.stringify( error ) );
                return error;
            }
        );
    }


    /**
     * Metodo que lista los establecimientos de salud parametrizados
     */
    getEstablecimientoSaludById( id:string ) {
        console.log( "==Entra en CoreesamynService getEstablecimientoSaludList" );
        return this.findByPkUrl(id, 'establecimientoSalud.crud.read' );
        /*return this.http.get('./app/mock/establecimientoSalud.json').map((response) =>{
            let paginatedListx = response.json();
            return paginatedListx.objeto;
            },
            error => {
                console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
                return error;
            }
         );*/
    }

    /**
     * Metodo que lista las encuentas generadas para un formulario especifico
     * @param codigoFormulario codigo de formulario del cual se obtiene las encuentas
     */
    getEncuestasPorFormularioAndEstablecimientoList( codigoFormulario: number, codigoEstablecimiento: string ) {
        console.log( "==Entra en CoreesamynService getEncuestaPorFormularioList" );
        return this.getAllPaginated(null, 'encuesta.crud.findall');
        /*return this.http.get( './app/mock/encuestas.json' ).map(( response ) => {
            let paginatedListx = response.json();
            let x = paginatedListx.objeto;
            console.log( "entro: " + codigoFormulario );
            return x.filter( encuestas => encuestas.formulario.codigo == codigoFormulario );
        },
            error => {
                console.log( "==>despues de buscar usuario error  " + JSON.stringify( error ) );
                return error;
            }
        );*/
    }

    /**
     * Metodo que lista todas las encuentas mock
     */
    getEncuestaList() {
        console.log( "==Entra en CoreesamynService getEncuesta" );
        //return this.getAllPaginated('encuesta.crud.findall').map((response) =>{
        return this.http.get( './app/mock/encuesta.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        },
            error => {
                console.log( "==>despues de buscar usuario error  " + JSON.stringify( error ) );
                return error;
            }
        );
    }

    /**
     * Metodo que carga la encuenta por su id
     * @param idEncuesta id de la encuesta
     */
    getEncuestabyId( idEncuesta: number ) {
        console.log("==> getEncuestabyId " + idEncuesta );
        return this.findByPkUrl(idEncuesta.toString(),'encuesta.crud.read');
        /*return this.http.get( './app/mock/encuesta.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
            //return encuesta.filter(encuesta=>encuesta.codigo==idEncuesta);
        } );*/
    }

    /**
     * Metodo que carga la informacion de preguntas por id
     * @param codigoPregunta
     */
    getPreguntaById( codigoPregunta: number ) {
        console.log( "==Entra en CoreesamynService findPregunta" );
        //return this.findByPkUrl(codigoPregunta.toString(), 'pregunta.crud.read').map((response) =>{
        //return this.findByPk(codigoFormulario.toString(), 'encuesta.crud.findall').map((response) =>{
        return this.http.get( './app/mock/encuestas.json' ).map(( response ) => {
            let paginatedListx = response.json();
            let x = paginatedListx.objeto;
            console.log( "entro: " + codigoPregunta );
            return x.filter( pregunta => pregunta.codigo == codigoPregunta );
        },
            error => {
                console.log( "==>despues de buscar usuario error  " + JSON.stringify( error ) );
                return error;
            }
        );
    }

    /**
     * Metodo que trae el usuario logeado
     */
    getUsuarios() {
        console.log( "==Entra en CoreesamynService getUsuario" );
        return this.getAllPaginated( null, 'formulario.crud.findall' );
        /*return this.http.get('./app/mock/userdata.json').map((response) =>{
            let paginatedListx = response.json();
            return paginatedListx.list;
            },
            error => {
                console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
                return error;
            }
         );*/

    }

    /**
     * Metodo que lista las evaluaciones mock
     */
    getEvaluacionList() {
        return this.http.get( './app/mock/evaluacion.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        } );
    }
    
    /**
     * Metodo que obtiene la evaluacion por identificador
     * @param id id de la evaluacion
     */
    getEvaluacionById(id:number){

        //return this.findByPkUrl(id.toString(),'evaluacion.crud.read').map((response)=>{

        return this.http.get('./app/mock/evaluacion.json').map((response)=>{

          let paginatedListx=response.json();

          let x = paginatedListx.objeto;

          return x.filter(evaluacion => evaluacion.id == id);

        });

      }

    /**
     * Metodo que obtiene los establecimientos de salud
     */
    getEstablecimientoSaludList() {
        console.log( "==Entra en CoreesamynService getEstablecimientoSaludList header: " + this.headers );
        if ( !this.headers ) {
            this.instaceHeader();
        } else {
            console.log( "==header es: " + JSON.stringify( this.headers ) );
        }
        return this.getAllPaginated( null, "establecimientoSalud.crud.findall" );
        /* return this.http.get('./app/mock/establecimiento_salud.json').map((response)=>{
           let paginatedListx=response.json();
           return paginatedListx;
         });*/
    }

    /**
     * Metodo que registra la encuesta
     * @param entidad
     */
    createEncuesta( entidad ) {
        return this.manageWithMessage( entidad, "encuesta.crud.create", "CREACION DE ENCUESTA" );
    }

    /**
     * Metodo que trae la informacion de las preguntas asociados a un formulario y encuesta.
     * Si se envia el formulario sin encuesta, se trata de un nueva encuesta. Si se envia los dos parametros es una encuensta
     * existente
     * @param idFormulario formulario asociado
     * @param idEncuesta encuesta asociada
     */
    getEncuestaByFormularioAndEncuesta( parametro ) {
        //console.log("x entra a getEncuestaByFormularioAndEncuesta " );
        //console.log("y entra a getEncuestaByFormularioAndEncuesta " + JSON.stringify(parametro));
        return this.findByParams(parametro,'pregunta.crud.findall');
        /*return this.http.get( './app/mock/preguntas.json' ).map(( response ) => {
            let paginatedListx = response.json();
            return paginatedListx.objeto;
        } );*/

    }


}
