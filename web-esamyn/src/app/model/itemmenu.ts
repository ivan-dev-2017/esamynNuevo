export class ItemMenu {
	codigo: number;
	label: string;
	link: string;
	accion: boolean;
	style: number;
	classStyle: string;
	//childrenArray: ItemMenu[];

	icon:string;//Icon of the item.
	command:string;//Callback to execute when item is clicked.
	url:string;//External link to navigate when item is clicked.
	routerLink:string[];//RouterLink definition for internal navigation.
	items:ItemMenu[];//An array of children menuitems.
	expanded:boolean;//Visibility of submenu.
	disabled:boolean;//When set as true, disables the menuitem.
	visible:boolean;//Whether the dom element of menuitem is created or not.
	target:string;
}