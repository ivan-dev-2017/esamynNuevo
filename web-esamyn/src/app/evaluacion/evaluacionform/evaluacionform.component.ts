import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { Subscription } from 'rxjs/Subscription';
import { CoreesamynService } from '../../service/coreesamyn.service';

@Component({
  selector: 'app-evaluacionform',
  templateUrl: './evaluacionform.component.html',
  styleUrls: ['./evaluacionform.component.css']
})
export class EvaluacionformComponent implements OnInit, OnDestroy {

  evaluacion={"id":null, "encuestaList":[]};
  preguntas=[];
  private id:number= null;
  private route$:Subscription;
  checkSi1:boolean = false;
  checkSi2:boolean = false;
  private idFormularioEstablecimiento = 1;
  
  constructor(private coreesamynService:CoreesamynService, private route:ActivatedRoute) {
  }

  ngOnInit() {
      this.route$ = this.route.params.subscribe(
        (params:Params) => {
            this.id = +params["idEvaluacion"];
        }
      );
      console.log( "==Entra en evaluacion evento con id: "+this.id );
      this.coreesamynService.getEvaluacionPorId(this.id).subscribe( data=>{
          console.log("==retorno: " + JSON.stringify(data));
      this.evaluacion=data[0];});
      this.coreesamynService.getPreguntasPorFormularioList().subscribe( data=>{
          console.log("==retorno: " + JSON.stringify(data));
      this.preguntas=data.pregunta;});
  }
    
  ngOnDestroy() {
      if(this.route$) this.route$.unsubscribe();
  }

}
