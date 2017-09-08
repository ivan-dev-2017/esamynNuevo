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

        console.log( "==Entra en FormularioListComponent" );
        this.globalEventsManager.selectedEtablecimientoEmitter.subscribe(( mode ) => {
            console.log( "==>en formulario list  selectedEtablecimientoEmitter " + JSON.stringify( mode ) );
            this.establecimientoSelected = mode;
            
            if ( this.establecimientoSelected && this.establecimientoSelected.codigo ) {
                this.coreesamyn.getFormulariosList( this.establecimientoSelected.codigo ).subscribe( data => {
                    this.rows = data.objeto;
                    console.log( "==>FORMULARIOS" + JSON.stringify( this.rows ) );
                    setTimeout(() => { this.loadingIndicator = false; }, 1500 );
                } );
            } else {
                this.rows = [];
            }
        }, error => {
            console.log( "==>despues de menu error  " + JSON.stringify( error ) );
        } );

    }


    ngOnInit() {

    }

    onSelect( { selected } ) {
        console.log( 'Select Event', selected[0].codigo );
        console.log( 'Establecimiento', localStorage.getItem("establecimientoSalud") );
        let establecimiento = JSON.parse(localStorage.getItem("establecimientoSalud"));
        this.idFormulario=selected[0].codigo;
        this.coreesamyn.getEncuestasPorFormularioAndEstablecimientoList( selected[0].codigo,establecimiento.codigo ).subscribe( data => {
            console.log( "==retorno: " + JSON.stringify( data ) );
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
        //console.log('Activate Event', event);
    }

    onSelectEncuesta( { selected } ) {
        console.log( 'Select Event Encuesta==>>', selected[0].codigo );
    }

    onActivateEncuesta( event ) {
        //console.log('Activate Event', event);
    }

    selectItem( item ) {
        console.log( 'eliminar item dato id formulario ', item );

    }

    nuevaEncuesta() {
        console.log( "nueva encuesta" );
    }

    modificarEncuesta() {
        console.log( "modificar encuesta" );
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
        console.log("parmetro direccion: " + JSON.stringify( navigationExtras ) );
        this.router.navigate(['/foesamn'],navigationExtras);
    }

}
