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
    evaluacionvar="";
    fecha_inicial="";
    fecha_final="";
    establecimiento_saludvar="";
    responsable="";
    cargo="";
    extra="";
    id="";
  constructor(private coreesamynService:CoreesamynService) {
      this.coreesamynService.getEstablecimientoSalud().subscribe(data=>{
        this.establecimiento_salud=data;})
        this.coreesamynService.getEvaluacion().subscribe(data=>{
          this.evaluacion=data;})
      this.coreesamynService.getEncuestaVacia().subscribe(data=>{
        this.encuesta=data;})
        this.establecimiento_saludvar;
  }
  ngOnInit() {
  }

  save(){
    this.encuesta["id"]=this.id;
    this.encuesta["creado"]=null;
    this.encuesta["modificado"]=null;
    this.encuesta["creado_por"]=null;
    this.encuesta["modificado_por"]=null;
    this.encuesta["formulario"]=null;
    this.encuesta["usuario"]=null;
    this.encuesta["evalacion"]=null;
    this.encuesta["finalizada"]=null;
    this.encuesta["fecha_inicial"]=this.fecha_inicial;
    this.encuesta["fecha_final"]=this.fecha_final;
    this.encuesta["establecimiento_salud"]=this.establecimiento_saludvar;
    this.encuesta["responsable"]=this.responsable;
    this.encuesta["cargo"]=this.cargo;
    this.encuesta["extra"]=this.extra;
    console.log(this.encuesta);
       console.log(JSON.stringify(this.encuesta));

  }

  ejemplo(cargo){
    console.log(cargo);
  }
}
