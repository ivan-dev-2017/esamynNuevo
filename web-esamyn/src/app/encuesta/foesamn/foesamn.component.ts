import { Component, OnInit } from '@angular/core';
import { CoreesamynService } from '../../service/coreesamyn.service';

@Component({
  selector: 'app-foesamn',
  templateUrl: './foesamn.component.html',
  styleUrls: ['./foesamn.component.css']
})
export class FoesamnComponent implements OnInit {
    
  preguntas=[];
  preguntacero={};
    
  constructor( private coreesamynService:CoreesamynService ) { 
      
      this.getPreguntas();
  }

  ngOnInit() {
      
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
