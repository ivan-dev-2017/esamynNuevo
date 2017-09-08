import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { Subscription } from 'rxjs/Subscription';
import { CoreesamynService } from '../../service/coreesamyn.service';

@Component( {
    selector: 'evaluacion-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.css']
} )
export class EvaluacionformComponent implements OnInit, OnDestroy {

    evaluacion = { "id": null, "encuestaList": [] };
    tablas = [];
    tablaB: string = "";
    tablaC: string = "";
    tablaD: string = "";
    tablaE: string = "";
    banPaso: boolean = false;
    banDirec: boolean = false;
    preguntas = [];
    private id: number = null;
    private route$: Subscription;
    private idFormularioEstablecimiento = 1;

    constructor( private coreesamynService: CoreesamynService, private route: ActivatedRoute ) {
        this.coreesamynService.getGruposFormularioEvaluacionList().subscribe( data => {
            this.tablas = data;
        } );


    }

    construirTablaB(): string {
        for ( let tabla of this.tablas[0].hijos ) {
            this.tablaB = this.tablaB.concat( "<tr>" );
            this.tablaB = this.tablaB.concat( "</tr>" );
        }

        return this.tablaB;
    }

    ngOnInit() {
        this.route$ = this.route.params.subscribe(
            ( params: Params ) => {
                this.id = +params["idEvaluacion"];
            }
        );
        this.coreesamynService.getEvaluacionById( this.id ).subscribe( data => {
            this.evaluacion = data[0];
        } );
        this.coreesamynService.getPreguntasPorFormularioList().subscribe( data => {
            this.preguntas = data.pregunta;
        } );
    }

    ngOnDestroy() {
        if ( this.route$ ) this.route$.unsubscribe();
  }

}
