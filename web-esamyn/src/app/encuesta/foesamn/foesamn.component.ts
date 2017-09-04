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
  encuesta=[];
  id_encuesta="";
  zona:String;
  distrito="";
  establecimiento_saludVar=[];
  responsable="";
  cargo="";
  unicode="";
  evaluador="";
  fecha="";
  constructor( private coreesamynService:CoreesamynService,private route: ActivatedRoute ) {
      this.getPreguntas();
    //   this.coreesamynService.getEncuestauna().subscribe(data=>{
    //     console.log("se suscribio"+JSON.stringify(data));
    //     this.encuesta=data;
    //
    // });
  }
  ngOnInit() {
    console.log("-----------------");
    this.route.params.subscribe(params => {
            const _id = params["id"].toString();
            this.id_encuesta= params["id"].toString();
            this.coreesamynService.getEncuestabyId(params["id"]).subscribe(data=>{
              this.encuesta=data;
              console.log("a buscar "+JSON.stringify(data));
})
          });
console.log(this.id_encuesta);
  }
  public getPreguntas(){
      this.coreesamynService.getPreguntasList().subscribe(data=>{
          //console.log("retorno preguntas servicio " + JSON.stringify(data));
          this.preguntas=data.pregunta;
          //console.log("elemento 0 " + this.preguntas[0].texto);
          this.preguntacero= this.preguntas[0];
      });

  }

  public saveEncuesta(){
      console.log("entrassdd " );
      console.log("enviando preguntas " + JSON.stringify( this.preguntas));

  }


}
