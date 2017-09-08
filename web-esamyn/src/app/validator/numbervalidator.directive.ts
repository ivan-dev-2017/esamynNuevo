import { Directive, forwardRef } from '@angular/core';
import { NG_VALIDATORS, AbstractControl, ValidatorFn, Validator,FormControl } from '@angular/forms';
import { CustomValidator } from './customvalidator';

@Directive({
  selector: '[invalidNumber][ngModel]',
  providers: [
              { provide: NG_VALIDATORS, useExisting: NumbervalidatorDirective, multi: true }
            ]
})
export class  NumbervalidatorDirective implements Validator {
	  validator: ValidatorFn;
      
		constructor() {
		  //this.validator = CustomValidator.validateNumberFactory();
		}
		
		validate(c: AbstractControl) {
		  return  CustomValidator.validateNumberFactory(c);
		}

}
