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
  tablas = [];
  tablaB:string ="";
  tablaC:string ="";
  tablaD:string ="";
  tablaE:string ="";
  banPaso:boolean = false;
  banDirec:boolean = false;
  preguntas=[];
  private id:number= null;
  private route$:Subscription;
  private idFormularioEstablecimiento = 1;

  constructor(private coreesamynService:CoreesamynService, private route:ActivatedRoute) {
      this.coreesamynService.getGruposFormularioEvaluacionList().subscribe( data=>{
          console.log("==retorno: " + JSON.stringify(data));
      this.tablas=data;
      //construccion de la tabla B
      /*for(let tabla of this.tablas[0].hijos){
          this.banPaso=false;
          for(let tabla2 of tabla.hijos){
              this.banDirec=false;
              for(let tabla3 of tabla2.hijos){
                  this.tablaB = this.tablaB.concat("<tr _ngcontent-c5>");
                  this.tablaB = this.tablaB.concat("<td _ngcontent-c5></td>");
                  if(!this.banPaso){
                      this.tablaB = this.tablaB.concat('<td _ngcontent-c5 rowspan="'+tabla.hijos.length+'"></td>');
                      this.banPaso = true;
                  }
                  if(!this.banDirec){
                      this.tablaB = this.tablaB.concat('<td _ngcontent-c5  contenteditable="true" rowspan="'+tabla2.hijos.length+'"></td>');
                      this.banDirec = true;
                  }
                  this.tablaB = this.tablaB.concat("<td _ngcontent-c5></td>");
                  this.tablaB = this.tablaB.concat('<td _ngcontent-c5><input _ngcontent-c5 type="checkbox"   class="margenesPeq" /></td>');
                  this.tablaB = this.tablaB.concat('<td _ngcontent-c5><input type="checkbox"   class="margenesPeq" /></td>');
                  this.tablaB = this.tablaB.concat("<td _ngcontent-c5></td>");
                  this.tablaB = this.tablaB.concat("</tr>");
              }
          }
      }
      this.tablaB = this.tablaB.concat('<tr _ngcontent-c5><td _ngcontent-c5 colspan="6">TOTAL GENERAL (4 verificadores)</td><td _ngcontent-c5><input type="text" class="form-control" style="width: 20% !important;padding: 0px !important;"/><label class="subTitulos" >/10</label></td></tr>');*/
      });


  }

  construirTablaB():string{
      console.log("empezo la construccion");
      console.log(this.tablaB);
      for(let tabla of this.tablas[0].hijos){
          //for(let tabla2 of tabla.hijos){
        //      for(let tabla3 of tabla2.hijos){
                  this.tablaB = this.tablaB.concat("<tr>");
                  this.tablaB = this.tablaB.concat("</tr>");
        //      }
        //  }
      }

      return this.tablaB;
  }

  ngOnInit() {
      this.route$ = this.route.params.subscribe(
        (params:Params) => {
            this.id = +params["idEvaluacion"];
        }
      );
      console.log( "==Entra en evaluacion evento con id: "+this.id );
      this.coreesamynService.getEvaluacionById(this.id).subscribe( data=>{
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
