import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response,URLSearchParams } from '@angular/http';
import { BaseService } from '../util/base.service';
import { Observable } from 'rxjs/Observable';
import { AppConfig } from '../app.config';

@Injectable()
export class CoreesamynService extends BaseService {


  constructor(private _http: Http, private _config: AppConfig) {
      super();
      this.http=this._http;
      this.config =this._config;
  }

  getFormulariosList(){
      console.log( "==Entra en CoreesamynService getFormulariosList" );
      //return this.getAllPaginated(null, 'formulario.crud.findall');
      return this.http.get('./app/mock/formularios.json').map((response) =>{
          console.log("==>despues de for,ulario " + JSON.stringify(response));
          let paginatedListx = response.json();
          console.log("==>despues de for,ulario " + JSON.stringify(paginatedListx.objeto));
          return paginatedListx.objeto;
          },
          error => {
              console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
              return error;
          }
       );
  }

  getPreguntasList(){
      console.log( "==Entra en CoreesamynService getFormulariosList" );
      //return this.getAllPaginated(null, 'formulario.crud.findall');
      return this.http.get('./app/mock/preguntas.json').map((response) =>{
          let paginatedListx = response.json();
          return paginatedListx.objeto;
          },
          error => {
              console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
              return error;
          }
       );
  }

  getProvinciasList(){
      console.log( "==Entra en CoreesamynService getProvinciasList" );
      //return this.getAllPaginated(null, 'formulario.crud.findall');
      return this.http.get('./app/mock/provincias.json').map((response) =>{
          let paginatedListx = response.json();
          return paginatedListx.objeto;
          },
          error => {
              console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
              return error;
          }
       );
  }

  getCantonesList(idProvincia:number){
      console.log( "==Entra en CoreesamynService getCantonesList" );
      //return this.getAllPaginated(null, 'formulario.crud.findall');
      return this.http.get('./app/mock/cantones.json').map((response) =>{
          let paginatedListx = response.json();
          let x = paginatedListx.objeto;
          return x.filter(canton => canton.provincia.id == idProvincia);
          },
          error => {
              console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
              return error;
          }
       );
  }

  getPersonaJuridicaList(){
      console.log( "==Entra en CoreesamynService getPersonaJuridicaList" );
      //return this.getAllPaginated(null, 'formulario.crud.findall');
      return this.http.get('./app/mock/personaJuridica.json').map((response) =>{
          let paginatedListx = response.json();
          return paginatedListx.objeto;
          },
          error => {
              console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
              return error;
          }
       );
  }


  getEstablecimientoSaludList(){
      console.log( "==Entra en CoreesamynService getEstablecimientoSaludList" );
      //return this.getAllPaginated(null, 'formulario.crud.findall');
      return this.http.get('./app/mock/establecimientoSalud.json').map((response) =>{
          let paginatedListx = response.json();
          return paginatedListx.objeto;
          },
          error => {
              console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
              return error;
          }
       );
  }

  getEncuestasPorFormularioList(codigoFormulario:number){
      console.log( "==Entra en CoreesamynService getEncuestaPorFormularioList" );
      //return this.getAllPaginated(null, 'formulario.crud.findall');
      return this.http.get('./app/mock/encuestas.json').map((response) =>{
          let paginatedListx = response.json();
          let x = paginatedListx.objeto;
          console.log("entro: "+codigoFormulario);
          return x.filter(encuestas => encuestas.formulario.codigo == codigoFormulario);
          },
          error => {
              console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
              return error;
          }
       );
  }

  getEncuesta(){
      console.log( "==Entra en CoreesamynService getEncuesta" );
      //return this.getAllPaginated(null, 'formulario.crud.findall');
      return this.http.get('./app/mock/encuesta.json').map((response) =>{
          let paginatedListx = response.json();
          return paginatedListx.objeto;
          },
          error => {
              console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
              return error;
          }
       );
    }

    getUsuarios(){
      console.log( "==Entra en CoreesamynService getUsuario" );
      return this.getAllPaginated(null, 'formulario.crud.findall');
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

    getEvaluacion(){
      return this.http.get('./app/mock/evaluacion.json').map((response)=>{
        let paginatedListx=response.json();
        return paginatedListx.objeto;
      });
    }

    getEstablecimientoSalud(){
      return this.http.get('./app/mock/establecimiento_salud.json').map((response)=>{
        let paginatedListx=response.json();
        return paginatedListx.objeto;
      });
    }

    getEncuestaVacia(){
        return this.http.get('./app/mock/encuestavacia.json').map((response)=>{
          let paginatedListx=response.json();
          return paginatedListx.objeto;
        });
    }

    getEncuestauna(){
        return this.http.get('./app/mock/encuestauna.json').map((response)=>{
          let paginatedListx=response.json();
          return paginatedListx.objeto;
        });
    }

    
    createEncuesta( entidad ){
        return this.manageWithMessage(entidad, "encuesta.crud.create", "CREACION DE ENCUESTA");
    }
    
    
}
