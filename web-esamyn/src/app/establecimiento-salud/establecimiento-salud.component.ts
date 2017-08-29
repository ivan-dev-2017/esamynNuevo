import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-establecimiento-salud',
  templateUrl: './establecimiento-salud.component.html',
  styleUrls: ['./establecimiento-salud.component.css']
})
export class EstablecimientoSaludComponent implements OnInit {

  establecimientoSalud={
          "ess_id":null,
          "ess_creado":null,
          "ess_modificado":null,
          "ess_canton":null,
          "ess_persona_juridica":null,
          "ess_nombre":null,
          "ess_unicodigo":null,
          "ess_direccion":null,
          "ess_latitud":null,
          "ess_longitud":null,
          "ess_telefono":null,
          "ess_correo_electronico":null,
          "ess_nombre_responsable":null,
          "ess_zona":null,
          "ess_distrito":null
  };
  constructor() { }

  ngOnInit() {
  }

}
