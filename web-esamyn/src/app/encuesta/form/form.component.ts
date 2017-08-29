import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'encuesta-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class FormComponent implements OnInit {

    encuesta={"formulario":null, "usuario":null, "evaluacion":null, "finalizada":0 };
  constructor() { }

  ngOnInit() {
  }

}
