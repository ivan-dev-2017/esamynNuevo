import { Component, OnInit, EventEmitter, Input, Output } from '@angular/core';
import { Router,NavigationExtras } from '@angular/router';
import { CoreesamynService, GlobaleventsmanagerService } from '../../service/index';

@Component( {
    selector: 'formulario-list',
    templateUrl: './list.component.html',
    styleUrls: ['./list.component.css'],
} )
export class FormularioListComponent implements OnInit {

    rows = [];
    selected = [];
    encuestas = [];
    idFormulario:number;
    loadingIndicator: boolean = true;
    loadingIndicatorEncuesta: boolean = true;
    reorderable: boolean = true;
    establecimientoSelected = { "codigo": null, "unicodigo": null, "direccion": "" };
    parametroLocal = {}
    @Output() bandera: EventEmitter<boolean> = new EventEmitter();

    constructor( private coreesamyn: CoreesamynService, private globalEventsManager: GlobaleventsmanagerService,
            private router: Router ) {

        this.globalEventsManager.selectedEtablecimientoEmitter.subscribe(( mode ) => {
            this.establecimientoSelected = mode;
            if ( this.establecimientoSelected && this.establecimientoSelected.codigo ) {
                this.coreesamyn.getFormulariosList( this.establecimientoSelected.codigo ).subscribe( data => {
                    this.rows = data.objeto;
                    setTimeout(() => { this.loadingIndicator = false; }, 1500 );
                } );
            } else {
                this.rows = [];
            }
        }, error => {
        } );
        

    }


    ngOnInit() {
        if( localStorage.getItem("establecimientoSalud") ){
            this.establecimientoSelected = JSON.parse(localStorage.getItem("establecimientoSalud"));
            this.coreesamyn.getFormulariosList( this.establecimientoSelected.codigo ).subscribe( data => {
                this.rows = data.objeto;
            } );
        }
    }

    onSelect( { selected } ) {
        let establecimiento = JSON.parse(localStorage.getItem("establecimientoSalud"));
        this.idFormulario=selected[0].codigo;
        this.coreesamyn.getEncuestasPorFormularioAndEstablecimientoList( selected[0].codigo,establecimiento.codigo ).subscribe( data => {
            this.encuestas = data.objeto;
            if ( this.encuestas.length ) {
                this.bandera.emit( true );
            } else {
                this.bandera.emit( false );
            }
            setTimeout(() => { this.loadingIndicatorEncuesta = false; }, 1500 );
        } );
    }

    onActivate( event ) {
    }

    onSelectEncuesta( { selected } ) {
    }

    onActivateEncuesta( event ) {
    }

    selectItem( item ) {

    }

    nuevaEncuesta() {
    }

    modificarEncuesta() {
        let parametro = {
            "idFormulario": this.idFormulario,
            "idEncuesta": this.encuestas[0].codigo
        };
        let navigationExtras: NavigationExtras = {
                queryParams: {
                    "idFormulario": this.idFormulario,
                    "idEncuesta": this.encuestas[0].codigo
                }
            };
        this.router.navigate(['/foesamn'],navigationExtras);
    }

}
