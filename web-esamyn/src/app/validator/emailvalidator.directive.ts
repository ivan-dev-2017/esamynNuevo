import { Directive, forwardRef } from '@angular/core';
import { NG_VALIDATORS, AbstractControl, ValidatorFn, Validator,FormControl } from '@angular/forms';
import { CustomValidator } from './customvalidator';

@Directive({
  selector: '[invalidEmailAddress][ngModel]',
  providers: [
              { provide: NG_VALIDATORS, useExisting: EmailvalidatorDirective, multi: true }
            ]
})
export class EmailvalidatorDirective implements Validator {
	  validator: ValidatorFn;
      
		constructor() {
		  //this.validator = CustomValidator.validateEmailFactory();
		}
		
		validate(control: AbstractControl) {
		  return CustomValidator.validateEmailFactory(control);
		}

		/*validate(control: AbstractControl): {[validator: string]: string} {
		    const expression = /^[a-z0-9!#$%&'*+\/=?^_`{|}~.-]+@[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z0-9]([a-z0-9-]*[a-z0-9])?)*$/i;
		    if (!control.value) { // the [required] validator will check presence, not us
		      return null;
		    }


		    const value = control.value.trim();
		    if (expression.test(value)) {
		      return null;
		    }


		    return {invalidEmailAddress: 'Email no es valido'};
		  }*/
}
