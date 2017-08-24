import { Injectable } from '@angular/core';
import {Observable} from "rxjs";

import { Http, Headers, RequestOptions, Response } from '@angular/http';

import { AppConfig } from '../app.config';
import { User, Page,PaginatedList } from '../model/index';

var userData =[{nombre:"luis"},{nombre:"maricela"},{nombre:"rosalyn"},{nombre:"paula"},{nombre:"dorys"}];

@Injectable()
export class UserServiceMock {
    constructor() { }

    
    
    getAllPaginated(page:PaginatedList<User> ):  Observable<PaginatedList<User>> {
    	//return this.getPagedData(page);
    	console.log("===>entra a getAllPaginated");
    	return Observable.of(userData).map(data => this.getPagedData(page));
    }
    
    
    private getPagedData(page: Page): PaginatedList<User> {
        let pagedData = new PaginatedList<User>();
        //pagedData.setPageData(page) ;
        pagedData.totalElements = userData.length;
        pagedData.totalPages = page.totalElements / page.size;
        //let start = page.pageNumber * page.size;
        //let end = Math.min((start + page.size), page.totalElements);
        for (let i = pagedData.start; i < pagedData.end; i++){
            let jsonObj = userData[i];
            let usuario = new User();
            usuario.nombre =jsonObj.nombre;
            //let employee = new CorporateEmployee(jsonObj.nombre, jsonObj.gender, jsonObj.company, jsonObj.age);
            pagedData.list.push(usuario);
        }
        
        return pagedData;
    }

   /* private getPagedData(page: Page): PaginatedList<User>{
    	let pageLoc=new PaginatedList<User>();
    	let luis = new User();
    	luis.usernombre="Luis tamayo";
    	let mary = new User();
    	mary.usernombre="maricela bacerra";
    	let rows = new Array<User>(luis,mary);
    	console.log( "arreglo generado " + JSON.stringify(rows) );
    	pageLoc.data=rows;
        return pageLoc;
    }*/

    
}