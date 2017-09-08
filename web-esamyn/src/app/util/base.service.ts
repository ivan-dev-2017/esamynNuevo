import { Http, Headers, Response, RequestOptions, URLSearchParams } from '@angular/http';
import 'rxjs/add/operator/map';
import { Page, PaginatedList } from '../model/index';
import { AppConfig } from '../app.config';

export class BaseService {

    public headers: Headers;
    public options: RequestOptions;
    public services: any;
    public params: URLSearchParams;
    public http: Http;
    public config: AppConfig;

    constructor() {
        this.params = new URLSearchParams();
        this.instaceHeader()
        if ( localStorage.getItem( 'services' ) ) {
            this.services = JSON.parse( localStorage.getItem( 'services' ) );

        }

    }

    protected instaceHeader() {
        if ( localStorage.getItem( 'currentUser' ) ) {
            let u = JSON.parse( localStorage.getItem( 'currentUser' ) );
            this.headers = new Headers( { 'Content-Type': 'application/json', 'Accept': 'application/json', 'ApiToken': u.token } );
        }
    }


    setSearchParams( page: Page ) {
        this.params = new URLSearchParams();
        this.params.append( "pageNumber", "" + page.pageNumber );
        this.params.append( "pageSize", "" + page.size );
        this.params.append( "sortFields", page.sortFields );
        this.params.append( "sortDirections", page.sortDirections );
        this.params.append( "isPaginated", page.isPaginated );
    }

    getAllPaginated( page: Page, serviceName: string ) {
        let x = this.services[serviceName];
        if ( page != null ) {
            this.setSearchParams( page );
            this.options = new RequestOptions( { headers: this.headers, search: this.params } );
        } else {
            this.options = new RequestOptions( { headers: this.headers } );
        }
        return this.http.get( this.config.apiUrl + x, this.options )
            .map(( response: Response ) => {
                let paginatedListx = response.json();
                return paginatedListx;
            },
            error => {
                return error;
            } );
    }

    findByPk( id: string, serviceName: string ) {
        this.params = new URLSearchParams();
        this.params.append( "id", id );
        this.options = new RequestOptions( { headers: this.headers, search: this.params } );
        return this.http.get( this.config.apiUrl + this.services[serviceName], this.options )
            .map(( response: Response ) => {
                let entidad = response.json();
                return entidad;
            },
            error => {
                return error;
            } );
    }

    findByPkUrl( id: string, serviceName: string ) {
        this.options = new RequestOptions( { headers: this.headers } );
        return this.http.get( this.config.apiUrl + this.services[serviceName] + id, this.options )
            .map(( response: Response ) => {
                let entidad = response.json();
                return entidad;
            },
            error => {
                return error;
            } );
    }

   /**
    * Metodo que realiza la busqueda por parametrsoe enviados como json usando post
    * @param params objeto json de parametros
    * @param serviceName nombre del servicio a consumir
    */
    findByParams( params, serviceName: string ) {
        this.options = new RequestOptions( { headers: this.headers } );
        return this.http.post( this.config.apiUrl + this.services[serviceName],
                params, this.options ).map(( response: Response ) => {
                let entidad = response.json();
                return entidad;
            },
            error => {
                return error;
            } );
    }

    manage( entidad, serviceName: string ) {
        this.options = new RequestOptions( { headers: this.headers } );
        let wrapper = { "error": false, "mensaje": "Actualiza Objeto", "objeto": entidad };
        return this.http.post( this.config.apiUrl + this.services[serviceName],
            { "entidad": entidad }
            , this.options )
            .map(( response: Response ) => {
                let entidad = response.json();
                return entidad;
            },
            error => {
                return error;
            } );
    }

    manageWithMessageWrapper( entidad, serviceName: string, mensaje: string ) {
        this.options = new RequestOptions( { headers: this.headers } );
        let wrapper = { "error": false, "mensaje": mensaje, "objeto": entidad };
        return this.http.post( this.config.apiUrl + this.services[serviceName],
            wrapper
            , this.options )
            .map(( response: Response ) => {
                let entidad = response.json();
                return entidad;
            },
            error => {
                return error;
            } );
    }

    manageWithMessage ( entidad, serviceName: string, mensaje: string ) {
        this.options = new RequestOptions( { headers: this.headers } );
        let wrapper = { "error": false, "mensaje": mensaje, "objeto": entidad };
        return this.http.post( this.config.apiUrl + this.services[serviceName],
            entidad
            , this.options )
            .map(( response: Response ) => {
                let entidad = response.json();
                return entidad;
            },
            error => {
                return error;
            } );
    }

}
