import { Component, OnInit } from '@angular/core';
import {  CoreesamynService } from '../../service/coreesamyn.service';

@Component({
  selector: 'formulario-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class FormularioListComponent implements OnInit {

    rows=[];
    selected = [];
    loadingIndicator: boolean = true;
    reorderable: boolean = true;
    
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
      console.log('Select Event', JSON.stringify(selected));
    }
  
  onActivate(event) {
      //console.log('Activate Event', event);
    }
  
  selectItem(item){
      console.log('eliminar item dato ', item);
      
  }

}
