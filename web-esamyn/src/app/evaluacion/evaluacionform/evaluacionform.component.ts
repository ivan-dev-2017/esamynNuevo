import { Component, OnInit } from '@angular/core';
import { CoreesamynService } from '../../service/coreesamyn.service';

@Component({
  selector: 'app-evaluacionform',
  templateUrl: './evaluacionform.component.html',
  styleUrls: ['./evaluacionform.component.css']
})
export class EvaluacionformComponent implements OnInit {
evaluacion=[];
id="";
  constructor(private coreesamynService:CoreesamynService) {
      console.log( "==Entra en evaluacion evento" );
      this.coreesamynService.getEvaluacion().subscribe( data=>{
          console.log("==retorno: " + JSON.stringify(data));
        this.evaluacion=data;})

  }

  ngOnInit() {
  }

}
