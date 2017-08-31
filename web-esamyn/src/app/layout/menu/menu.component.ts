import { Component, OnInit, Input } from '@angular/core';
import {  User,Login,ItemMenu,Menu } from '../../model/index';
import {GlobaleventsmanagerService,AlertService} from "../../service/index";
import {SafeHtmlPipe} from "../../comp/pipe/safehtml.pipe";

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

	usuario:User= new User();
	loginWrapper: Login=new Login();
	isIn = false;   // store state
	menu:Menu;
	
	htmlMenu:string;
	panelMenuAppList:ItemMenu[];

	constructor(private globalEventsManager: GlobaleventsmanagerService, private alertService: AlertService) { 
		
		
	    this.globalEventsManager.showNavBarEmitter.subscribe((mode)=>{
	        // mode will be null the first time it is created, so you need to igonore it when null
	    	//console.log("==>entra en subscriber menu: " + mode   );
	    	//console.log("==>entra en subscriber menu string : " + JSON.stringify(mode)   );
	        if (mode !== null) {
	          console.log("==>se actualizo el usuario: " );
	          this.usuario = JSON.parse( localStorage.getItem('currentUser'));
	          //console.log("==>usuario logeado: "  +JSON.stringify(this.usuario)  );
	          let menu=JSON.parse(localStorage.getItem('menu'));
	          //console.log("==>va a llenar el inner html: " );
	          //this.htmlMenu=this.generateMenu(menu);
	          this.panelMenuAppList=menu;
	          //console.log("==>menu cargado en storage: "  +JSON.stringify(this.panelMenuAppList)  );
	        } else {
	        	console.log("==>no cambio usuaerio: ");
	        	this.loginWrapper.loggedIn=false;
	        }
	    },
        error => {
        	console.log("==>despues de menu error  " + JSON.stringify(error));
        	this.alertService.error(error._body);
        });
	    
	}
	
	puta(){
		alert("chch");
	}
	
	
	
	/*generateMenu(panelMenuArray:ItemMenu[]):string{
		let defaulIcon="glyphicon glyphicon-pushpin";
		let htmlloc=
		//"      <div  id=\"MainMenu\" class=\"collapse in\">  "+
		"        <div  class=\"list-group panel\"> ";
		if( panelMenuArray != null && panelMenuArray.length>0 ){
			for( let module of panelMenuArray ){
				htmlloc = htmlloc + 
				"          <a href=\"#demo" + module.codigo + "\" class=\"list-group-item list-group-item-success\" data-toggle=\"collapse\" data-parent=\"#sidebar\" aria-expanded=\"false\">" +
				//"<span class=\"" + (module.style!=null?module.style:defaulIcon) + "\"></span>" + module.label
				"<i class=\"" + (module.style!=null?module.style:defaulIcon) + "\"></i><span class=\"hidden-sm-down\">" + module.label + "</span>"
				+ "</a>         "+
				"          <div class=\"collapse\" id=\"demo"+ module.codigo +"\">";
				if( module.childrenArray!= null && module.childrenArray.length>0 ){
					for( let grupos of module.childrenArray ){
						htmlloc = htmlloc + 
					"            <a href=\"#SubMenu" + grupos.codigo + "\" class=\"list-group-item\" data-toggle=\"collapse\" data-parent=\"#SubMenu" + grupos.codigo + "\" aria-expanded=\"false\">" +
					"<span class=\"" + (module.style!=null?module.style:defaulIcon) + "\"></span>"+ grupos.label + " </a>     "+
					"            <div class=\"collapse list-group-submenu\" id=\"SubMenu" + grupos.codigo + "\"> ";
						if( grupos.childrenArray != null && grupos.childrenArray.length>0 ){
							for( let subGrupos of grupos.childrenArray ){
								htmlloc = htmlloc + 
						"              <a href=\"#SubSubMenu" + subGrupos.codigo + "\" class=\"list-group-item\" data-toggle=\"collapse\" data-parent=\"#SubSubMenu" + subGrupos.codigo + "\" aria-expanded=\"false\">"+
						"<span class=\"" + (module.style!=null?module.style:defaulIcon) + "\"></span>" + subGrupos.label + "</a>    "+
						"              <div class=\"collapse list-group-submenu list-group-submenu-" + subGrupos.codigo + "\" id=\"SubSubMenu" + subGrupos.codigo + "\">    ";
								if( subGrupos.childrenArray != null && subGrupos.childrenArray.length>0 ){
									for( let itemMenu of subGrupos.childrenArray ){
										htmlloc = htmlloc + 
							"                <li class=\"list-group-item\" data-parent=\"#SubSubMenu" + subGrupos.codigo + "\" aria-expanded=\"false\">" +
									"<a _ngcontent-c" + subGrupos.codigo + "=\"\" routerlinkactive=\"active\" ng-reflect-router-link=\"#" + itemMenu.link +
							                 "\" ng-reflect-router-link-active=\"active\" href=\"#" + itemMenu.link + 
							                 "\" >"+
							"<span class=\"" + (module.style!=null?module.style:defaulIcon) + "\"></span>" + itemMenu.label + "</a> </li>   ";
									}
								}
								htmlloc = htmlloc + 
						"              </div>  ";
							}
						}
						htmlloc = htmlloc + 
					"            </div>  ";
					}
				}
				htmlloc = htmlloc + 
				"          </div>      ";
			}
		}
			htmlloc = htmlloc + 
		"        </div>         ";
		//"      </div>           ";
		return 	htmlloc;
			
	}*/
	
	
	toggleState() { // click handler
	    let bool = this.isIn;
	    this.isIn = bool === false ? true : false; 
	}
	
  ngOnInit() {
  }

}
