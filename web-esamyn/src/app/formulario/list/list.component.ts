import { Component, OnInit, EventEmitter, Input, Output} from '@angular/core';
import {  CoreesamynService,GlobaleventsmanagerService } from '../../service/index';

@Component({
  selector: 'formulario-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css'],
})
export class FormularioListComponent implements OnInit {

    rows=[];
    selected = [];
    encuestas = [];
    loadingIndicator: boolean = true;
    loadingIndicatorEncuesta: boolean = true;
    reorderable: boolean = true;
    establecimientoSelected={"codigo": null,"unicodigo": null,"direccion": ""};
    
  constructor( private coreesamyn:CoreesamynService, private globalEventsManager:GlobaleventsmanagerService ) { 
      console.log( "==Entra en FormularioListComponent" );
      this.globalEventsManager.selectedEtablecimientoEmitter.subscribe((mode)=>{
          console.log("==>en formulario list  selectedEtablecimientoEmitter " + JSON.stringify(mode));
          this.establecimientoSelected=mode;
          console.log("==>EXISTE ETABLECIMIENTO SLECCIONADO?  " + JSON.stringify(this.establecimientoSelected));
          if( this.establecimientoSelected && this.establecimientoSelected.codigo  ){
              this.coreesamyn.getFormulariosList(this.establecimientoSelected.codigo).subscribe( data=>{
                  this.rows=data.objeto;
                  setTimeout(() => { this.loadingIndicator = false; }, 1500);
              } );
          } else {
              this.rows=[];
          }
      },error => {
          console.log("==>despues de menu error  " + JSON.stringify(error));
      });
      
      
  }
  
  
  ngOnInit() {
      
  }
  
  onSelect({ selected }) {
      console.log('Select Event', selected[0].codigo);
      this.coreesamyn.getEncuestasPorFormularioList(selected[0].codigo).subscribe( data=>{
          console.log("==retorno: " + JSON.stringify(data));
          this.encuestas=data;
          setTimeout(() => { this.loadingIndicatorEncuesta = false; }, 1500);
      } );
    }
  
  onActivate(event) {
      //console.log('Activate Event', event);
    }
    
  onSelectEncuesta({ selected }) {
      console.log('Select Event Encuesta', selected[0].codigo);
   }
  
  onActivateEncuesta(event) {
      //console.log('Activate Event', event);
    }
  
  selectItem(item){
      console.log('eliminar item dato ', item);
      
  }
    
  nuevaEncuesta(){
      console.log("nueva encuesta");
  }
    
  modificarEncuesta(){
      console.log("modificar encuesta");
  }

}
