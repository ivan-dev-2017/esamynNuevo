import { Component, OnInit } from '@angular/core';
import { CoreesamynService } from '../../service/coreesamyn.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-foesamn',
  templateUrl: './foesamn.component.html',
  styleUrls: ['./foesamn.component.css']
})
export class FoesamnComponent implements OnInit {

  preguntas=[];
  preguntacero={};
  encuesta={};
  distrito="";
  establecimientoSaludVar=[];
  responsable="";
  cargo="";
  unicode="";
  evaluador="";
  fecha="";
  parametro={
    "idform":null,
    "idEncuesta":null
  };
  constructor( private coreesamynService:CoreesamynService,private route: ActivatedRoute ) {
      this.getPreguntas();
    //   this.coreesamynService.getEncuestauna().subscribe(data=>{
    //     console.log("se suscribio"+JSON.stringify(data));
    //     this.encuesta=data;
    //
    // });
  }
  ngOnInit() {
    this.route.params.subscribe(
            (params=> {
              console.log("55555555555555"+JSON.stringify(params["id"]));
               // cast to number
               this.parametro.idform=params["id['idForm']"];
               console.log(JSON.stringify(this.parametro));
            }
        ));
    this.coreesamynService.getPreguntasFormulario(this.parametro.toString()).subscribe(data=>{
      this.preguntas=data;
      console.log(this.parametro);
    })

this.coreesamynService.getPreguntasFormulario(this.parametro.toString()).subscribe(data=>{
  //console.log("retorno preguntas servicio " + JSON.stringify(data));
  this.preguntas=data.pregunta;
  //console.log("elemento 0 " + this.preguntas[0].texto);
  //this.preguntacero= this.preguntas[0];
  //console.log("preguntas--------------"+JSON.stringify(this.preguntacero));
});

  }
  public getPreguntas(){
      //this.coreesamynService.getPreguntasList().subscribe(data=>{


  }

  public saveEncuesta(){

      console.log("enviando preguntas " + JSON.stringify( this.preguntas));

  }


}
