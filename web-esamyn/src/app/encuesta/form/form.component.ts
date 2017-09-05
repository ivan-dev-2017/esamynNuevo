import { Component, OnInit } from '@angular/core';
import { CoreesamynService } from '../../service/coreesamyn.service';
import { ActivatedRoute } from '@angular/router';

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
    idForm="";
    usuario=[];
    evaluacion=[];
    establecimientosSalud=[];
    loadingIndicator: boolean = true;
    reorderable: boolean = true;
  constructor(private coreesamynService:CoreesamynService, private route: ActivatedRoute) {
      this.coreesamynService.getEstablecimientoSaludList().subscribe(data=>{
        this.establecimientosSalud=data;
        console.log(JSON.stringify(this.establecimientosSalud));
      })


  }

  ngOnInit() {
    console.log("-----------------");
    this.route.params.subscribe(params => {
            const _id = params["id"].toString();
            this.idForm= params["id"].toString();
            });
  console.log(this.idForm);


  }

  save(){
    console.log("encuesta a crear"+JSON.stringify(this.encuesta));
    this.coreesamynService.createEncuesta(this.encuesta);
    let parametro ={
      "idFormulario":this.idForm,
      "idEncuesta": this.encuesta.codigo
};
console.log(parametro);
  }

}
