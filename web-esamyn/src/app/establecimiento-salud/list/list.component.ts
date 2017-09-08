import { Component, OnInit } from '@angular/core';
import { CoreesamynService } from '../../service/coreesamyn.service';

@Component({
  selector: 'establecimiento-salud-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class EstablecimientoSaludListComponent implements OnInit {
  rows=[];
  selected = [];
  loadingIndicator: boolean = true;
  reorderable: boolean = true;
  constructor(private coreesamynService:CoreesamynService) {
    this.coreesamynService.getEstablecimientoSaludList().subscribe( data=>{
      this.rows=data;});
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
