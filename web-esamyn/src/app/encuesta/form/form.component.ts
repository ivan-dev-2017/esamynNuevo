import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CoreesamynService } from '../../service/coreesamyn.service';


@Component( {
    selector: 'encuesta-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.css']
} )
export class EncuestaFormComponent implements OnInit {
    encuesta = {
        "codigo": null,
        "responsable": null,
        "cargo": null,
        "establecimientoSalud": null
    };
    idForm = "";
    usuario = [];
    evaluacion = [];
    establecimientosSalud = {};
    loadingIndicator: boolean = true;
    reorderable: boolean = true;
    establecimientoSelected = { "codigo": null, "nombre": null, "unicodigo": null, "direccion": "" };

    constructor( private coreesamynService: CoreesamynService, private route: ActivatedRoute,
        private router: Router ) {

    }

    ngOnInit() {
        this.route.params.subscribe( params => {
            this.idForm = params["id"];
            this.establecimientoSelected = JSON.parse( localStorage.getItem( "establecimientoSalud" ) );
            console.log( "===>>init" + JSON.stringify( this.establecimientoSelected ) );
        } );
    }

    save() {
        if ( this.establecimientoSelected ) {
            this.encuesta.establecimientoSalud = this.establecimientoSelected.codigo;
        }
        this.coreesamynService.createEncuesta( this.encuesta ).subscribe( data => {
            let parametro = {
                "idFormulario": this.idForm,
                "idEncuesta": data.objeto.codigo
            };
            this.router.navigate( ['foesambyid', { id: parametro }] );
        } );
    }

}
