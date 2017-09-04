import { Component, OnInit } from '@angular/core';
import { CoreesamynService } from '../../service/coreesamyn.service';

@Component({
  selector: 'encuesta-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class FormComponent implements OnInit {
    encuesta= {
      "codigo": null,
      "responsable": null,
       "cargo": null,
        "establecimientoSalud": null
};
    formulario=[];
    usuario=[];
    evaluacion=[];
    establecimientosSalud=[];
    loadingIndicator: boolean = true;
    reorderable: boolean = true;
  constructor(private coreesamynService:CoreesamynService) {
      this.coreesamynService.getEstablecimientoSaludList().subscribe(data=>{
        this.establecimientosSalud=data;
      })


  }

  ngOnInit() {
  }

  save(){
      // console.log(JSON.stringify(this.encuesta));
      // this.coreesamynService.createEncuesta(this.encuesta).subscribe(data=>{
      //     this.evaluacion=data;});
  }
  createEncuesta(){
    console.log("encuesta a crear"+JSON.stringify(this.encuesta));
    this.coreesamynService.createEncuesta(this.encuesta);

  }

}
