import { Component, OnInit } from '@angular/core';
import { CoreesamynService } from '../../service/coreesamyn.service';

@Component({
  selector: 'encuesta-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class FormComponent implements OnInit {
    encuesta={
            "error": false,
            "mensaje": "",
            "objeto": {
              "codigo": null,
              "responsable": null,
              "cargo": null,
              "extra": null,
              "establecimientoSalud": {
                "codigo": null,
                "unicodigo": "22222",
                "direccion": "Direccion",
                "latitud": "12",
                "longitud": "12",
                "telefono": "222333",
                "correoElectronico": "ccc@correo.com",
                "nombreResponsable": "responsable 2",
                "zona": "CENTRO",
                "distrito": "Distrito",
                "canton": {
                  "codigo": 1,
                  "nombre": "QUITO",
                  "codigoINEN": "UIO",
                  "provincia": {
                    "codigo": 1,
                    "nombre": "PICHINCHA",
                    "codigoInen": "PHC"
                  }
                },
                "personaJuridica": {
                  "codigo": 1,
                  "ruc": "17654798001"
                },
                "evaluacionList": null
              },
              "formulario": {
                "codigo": 1,
                "titulo": "Formulario de InformaciÃ³n del Establecimiento",
                "subtitulo": null,
                "ayuda": null,
                "clave": "1",
                "contestadosLista": null
              }
            }
          };
    formulario=[];
    usuario=[];
    evaluacion=[];
    establecimientosSalud=[];
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
        this.establecimientosSalud=data;})
        this.coreesamynService.getEvaluacion().subscribe(data=>{
          this.evaluacion=data;});
  }
  
  ngOnInit() {
  }

  save(){
      console.log(JSON.stringify(this.encuesta));
      this.coreesamynService.createEncuesta(this.encuesta).subscribe(data=>{
          this.evaluacion=data;});
  }
}
