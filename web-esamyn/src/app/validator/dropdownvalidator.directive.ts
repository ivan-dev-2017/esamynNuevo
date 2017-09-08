import { Directive, forwardRef } from '@angular/core';
import { NG_VALIDATORS, AbstractControl, ValidatorFn, Validator,FormControl } from '@angular/forms';
import { CustomValidator } from './customvalidator';

@Directive({
  selector: '[requiredDropdownValidator][ngModel]',
  providers: [
              { provide: NG_VALIDATORS, useExisting: DropdownvalidatorDirective, multi: true }
            ]
})
export class DropdownvalidatorDirective implements Validator {
	  validator: ValidatorFn;
      
		constructor() {
		  this.validator = CustomValidator.validateDropdownFactory();
		}
		
		validate(c: FormControl) {
		  return this.validator(c);
		}

}
