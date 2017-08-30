import { Component, OnInit } from '@angular/core';
import { CoreesamynService } from '../../service/coreesamyn.service';

@Component({
  selector: 'encuesta-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class FormComponent implements OnInit {

    encuesta=[];
    formulario=[];
    usuario=[];
    evaluacion=[];
    establecimiento_salud=[];
    loadingIndicator: boolean = true;
    reorderable: boolean = true;


  constructor(private coreesamynService:CoreesamynService) {
      this.coreesamynService.getEstablecimientoSalud().subscribe(data=>{
        this.establecimiento_salud=data;})
        this.coreesamynService.getEvaluacion().subscribe(data=>{
          this.evaluacion=data;})
      this.coreesamynService.getEncuestaVacia().subscribe(data=>{
        this.encuesta=data;})

  }
  ngOnInit() {
  }

  save(){
      console.log(JSON.stringify(this.encuesta));

  }



}
