import { Component, OnInit } from '@angular/core';
import { DialogComponent, DialogService } from "ng2-bootstrap-modal";

export interface PromptModel {
	  title:string;
	  question:string;
	}


@Component({
  selector: 'app-modalprompt',
  templateUrl: './modalprompt.component.html',
  styleUrls: ['./modalprompt.component.css']
})
export class ModalpromptComponent extends DialogComponent<PromptModel, string> implements PromptModel {
	title: string;
	question: string;
	message: string = '';

	constructor(dialogService: DialogService) {
	  super(dialogService);
	}
	
	apply() {
	  this.result = this.message;
	  this.close();
	}
}