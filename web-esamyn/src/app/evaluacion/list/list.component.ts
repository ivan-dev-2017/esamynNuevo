import { Component, OnInit } from '@angular/core';
import { CoreesamynService } from '../../service/coreesamyn.service';

@Component({
  selector: 'evaluacion-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class EvaluacionlistComponent implements OnInit {
  rows=[];
  selected = [];
  loadingIndicator: boolean = true;
  reorderable: boolean = true;
  constructor(private coreesamynService:CoreesamynService) {
    console.log( "==Entra en evaluacion evento" );
    this.coreesamynService.getEvaluacionList().subscribe( data=>{
        console.log("==retorno: " + JSON.stringify(data));
      this.rows=data;})
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
      console.log(item);
      console.log(JSON.stringify(item));
  }

}
