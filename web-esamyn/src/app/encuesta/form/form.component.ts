import { Component, OnInit } from '@angular/core';
import { ActivatedRoute,Router } from '@angular/router';
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
    establecimientoSelected = { "codigo": null,"nombre":null, "unicodigo": null, "direccion": "" };

    constructor( private coreesamynService: CoreesamynService, private route: ActivatedRoute,
            private router: Router) {
        // this.coreesamynService.getEstablecimientoSaludList().subscribe( data => {
        //     this.establecimientosSalud = data;
        //     console.log( JSON.stringify( this.establecimientosSalud ) );
        // } );


    }

    ngOnInit() {
        console.log( "-----------------" );
        this.route.params.subscribe( params => {
            console.log( "==>EncuestaFormComponent enta a router subscriber" );
            this.idForm = params["id"];
            console.log( this.idForm );
            this.establecimientoSelected = JSON.parse(localStorage.getItem("establecimientoSalud"));
            console.log("===>>init"+JSON.stringify(this.establecimientoSelected));
        } );



    }

    save() {
        console.log( "encuesta a crear" + JSON.stringify( this.encuesta ) );
        console.log( "id fomrulario" + this.idForm);
      this.coreesamynService.createEncuesta( this.encuesta ).subscribe(data=>{
        console.log(""+JSON.stringify(data.objeto));
            let parametro = {
                    "idFormulario": this.idForm,
                    "idEncuesta": data.objeto.codigo
                };
                console.log("parametros atrapados "+JSON.stringify(parametro));
            this.router.navigate(['foesambyid', {id: parametro}]);

        });


    }

}
