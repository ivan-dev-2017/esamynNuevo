import { Component, OnInit, EventEmitter, Input, Output} from '@angular/core';
import {  CoreesamynService } from '../../service/coreesamyn.service';

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
    @Output() bandera:EventEmitter<boolean> = new EventEmitter();
    
  constructor( private coreesamyn:CoreesamynService ) { 
      console.log( "==Entra en FormularioListComponent" );
      this.coreesamyn.getFormulariosList().subscribe( data=>{
          console.log("==retorno: " + JSON.stringify(data));
          this.rows=data;
          setTimeout(() => { this.loadingIndicator = false; }, 1500);
      } );
      
  }
  
  
  ngOnInit() {
      
  }
  
  onSelect({ selected }) {
      console.log('Select Event', selected[0].codigo);
      this.coreesamyn.getEncuestasPorFormularioList(selected[0].codigo).subscribe( data=>{
          console.log("==retorno: " + JSON.stringify(data));
          this.encuestas=data;
          if(this.encuestas.length){
             this.bandera.emit(true);
          }else{
             this.bandera.emit(false);
          }
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
