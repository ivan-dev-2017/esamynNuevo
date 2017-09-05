/**
 * New typescript file
 */
import { ModuleWithProviders }  from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { EstablecimientoSaludComponent } from './establecimiento-salud/establecimiento-salud.component';
import { FoesamnComponent } from './encuesta/foesamn/foesamn.component';
import { AuthGuard } from './guard/index';
import{FormComponent} from './encuesta/form/form.component';
import {FormularioListComponent}from './formulario/list/list.component';
import {EvaluacionlistComponent} from './evaluacion/evaluacionlist/evaluacionlist.component';
import {EvaluacionformComponent} from './evaluacion/evaluacionform/evaluacionform.component';


export const appRoutes: Routes = [
	//{ path: '', component: HomeComponent, canActivate: [AuthGuard] },
    { path: 'establecimientoSalud', component: EstablecimientoSaludComponent },
	{ path: 'login', component: LoginComponent },
	{ path: 'home', component: HomeComponent },
  { path: 'foesamn', component: FoesamnComponent },
	{ path: 'foesamn/:id', component: FoesamnComponent },
    // otherwise redirect to home
	{ path: 'form_component', component: FormComponent },
  { path: 'form_component/:id', component: FormComponent },
	{ path: 'formulario_list', component: FoesamnComponent },
	{ path: 'formularioListComponent', component: FormularioListComponent },
	{ path: 'evaluacionList', component: EvaluacionlistComponent },
	{ path: 'evaluacionForm/:idEvaluacion', component: EvaluacionformComponent },
    { path: '**', redirectTo: '/login' }
];

export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);
