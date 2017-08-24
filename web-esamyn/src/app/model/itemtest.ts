export class ItemTest {
	public nombre: string;
public code:string;
public selected:boolean;
public show:boolean;

public codigo:string;
public descripcion:string;
public estado:string;

	
	constructor( pnombre: string,pcode:string,pselected:boolean,pshow:boolean ) { 
		this.nombre=pnombre;
		this.code=pcode;
		this.selected=pselected;
		this.show=pshow;
			
	}
}