import { AbstractControl, ValidatorFn, Validator } from '@angular/forms';

export class CustomValidator{
	
	

	static emailValidator(control) {
        // RFC 2822 compliant regex
		var EMAIL_REGEXP = /^[a-z0-9!#$%&'*+\/=?^_`{|}~.-]+@[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z0-9]([a-z0-9-]*[a-z0-9])?)*$/i;
		return EMAIL_REGEXP.test(control.value) ?null: { 'invalidEmailAddress': true };
    }
	
	static passwordValidator(control) {
		var PASSWORD_REGEXP =/^(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,100}$/;
		return PASSWORD_REGEXP.test(control.value) ?null: { 'invalidPassword': true };
    }
	
	static numberValidator(control ) {
		var NUMBER_REGEXP = /^[0-9]+(\.[0-9]*){0,1}$/g;
		return NUMBER_REGEXP.test(control.value) ?null: { 'invalidNumber': true };
    }
	
	static validateEmailFactory(control: AbstractControl ) : {[validator: string]: string} {
	    const EMAIL_REGEXP = /^[a-z0-9!#$%&'*+\/=?^_`{|}~.-]+@[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z0-9]([a-z0-9-]*[a-z0-9])?)*$/i;
	    if (!control.value) { 
	      return null;
	    }
	    const value = control.value.trim();
	    if (EMAIL_REGEXP.test(value)) {
	      return null;
	    }
	    return {invalidEmailAddress: 'Email no es valido'};
	}
	
	static validateNumberFactory(control: AbstractControl ) : {[validator: string]: string} {
		var NUMBER_REGEXP = /^[0-9]+(\.[0-9]*){0,1}$/g;
		if (!control.value) { 
	      return null;
	    }
	    const value = control.value.trim();
	    if (NUMBER_REGEXP.test(value)) {
	      return null;
	    }
	    return {invalidNumber: 'Numero no es valido'};
    }
	
	static validatePasswordFactory() : ValidatorFn {
		return (control: AbstractControl) => {
			var PASSWORD_REGEXP =/^(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,100}$/;
			return PASSWORD_REGEXP.test(control.value) ?null: { 'invalidPassword': true };
		}
	}
	
	static validateDropdownFactory(): ValidatorFn {
	    return (c: AbstractControl) => {
	    	
	        let isValid = c.value !== null && c.value.codigo!="";

	        if (isValid) {
	            return null;
	        }
	        else {
	            return {
	                'dropdownRequired': true
	            };
	        }
	    }
	}

}
