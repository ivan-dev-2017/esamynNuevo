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
    this.coreesamynService.getEvaluacionList().subscribe( data=>{
      this.rows=data;})
   }

  ngOnInit() {
  }

  onSelect({ selected }) {
    }

  onActivate(event) {
    }

  selectItem(item){
  }

}
