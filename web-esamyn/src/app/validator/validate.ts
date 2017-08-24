import {
  AbstractControl,
  AsyncValidatorFn,
  Validator,
  Validators,
  ValidatorFn,
} from '@angular/forms';

import {Observable} from 'rxjs';

export type ValidationResult = {[validator: string]: string | boolean};

export type AsyncValidatorArray = Array<Validator | AsyncValidatorFn>;

export type ValidatorArray = Array<Validator | ValidatorFn>;

const normalizeValidator =
    (validator: Validator | ValidatorFn): ValidatorFn | AsyncValidatorFn => {
  const func = (validator as Validator).validate.bind(validator);
  if (typeof func === 'function') {
    return (c: AbstractControl) => func(c);
  } else {
    return <ValidatorFn | AsyncValidatorFn> validator;
  }
};

export const composeValidators =
    (validators: ValidatorArray): AsyncValidatorFn | ValidatorFn => {
  if (validators == null || validators.length === 0) {
    return null;
  }
  return Validators.compose(validators.map(normalizeValidator));
};

export const validate =
    (validators: ValidatorArray, asyncValidators: AsyncValidatorArray) => {
  return (control: AbstractControl) => {
    const synchronousValid = () => composeValidators(validators)(control);

    if (asyncValidators) {
      const asyncValidator = composeValidators(asyncValidators);

      return asyncValidator(control).map(v => {
        const secondary = synchronousValid();
        if (secondary || v) { // compose async and sync validator results
          return Object.assign({}, secondary, v);
        }
      });
    }

    if (validators) {
      return Observable.of(synchronousValid());
    }

    return Observable.of(null);
  };
};

export const message = (validator: ValidationResult, key: string): string => {
	let val=null;
	
  switch (key) {
    case 'required':
      return 'Campo es requerido';
    case 'pattern':
      return 'El valor no concuerda con el patron';
    case 'minlength':
    	val = JSON.parse( JSON.stringify(validator));
    	return 'El campo debe tener minimo ' + val.minlength.requiredLength + ' caracteres';
    case 'maxlength':
    	val = JSON.parse( JSON.stringify(validator));
    	return 'El campo debe tener maximo '  + val.maxlength.requiredLength + ' caracteres';
  }

  switch (typeof validator[key]) {
    case 'string':
      return <string> validator[key];
    default:
      return `Validation failed: ${key}`;
  }
};