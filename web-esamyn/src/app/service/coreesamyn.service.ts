import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response,URLSearchParams } from '@angular/http';
import { BaseService } from '../util/base.service';
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
    //return this.getAllPaginated(null, 'formulario.crud.findall');
    return this.http.get('./app/mock/userdata.json').map((response) =>{
        let paginatedListx = response.json();
        return paginatedListx.list;
        },
        error => {
            console.log("==>despues de buscar usuario error  " + JSON.stringify(error));
            return error;
        }
     );

  }

  getEvaluacion(){
    return this.http.get('./app/mock/evaluacion.json').map((response)=>{
      let paginatedListx=response.json();
      return paginatedListx.objeto;
    })
  }
  getEstablecimientoSalud(){
    return this.http.get('./app/mock/establecimiento_salud.json').map((response)=>{
      let paginatedListx=response.json();
      return paginatedListx.objeto;
    })
  }
getEncuestaVacia(data){
  return this.http.get('./app/mock/encuestavacia.json').map((response)=>{
    let paginatedListx=response.json();
    return paginatedListx.objeto;
})
}
}
