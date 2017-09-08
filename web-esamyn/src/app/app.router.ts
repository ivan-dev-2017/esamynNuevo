/**
 * New typescript file
 */
import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { EstablecimientoSaludFormComponent } from './establecimiento-salud/form/form.component';
import { EstablecimientoSaludListComponent } from './establecimiento-salud/list/list.component';
import { EstablecimientoSaludComponent } from './establecimiento-salud/establecimiento-salud.component';

import { FoesamnComponent } from './encuesta/foesamn/foesamn.component';
import { AuthGuard } from './guard/index';
import { EncuestaFormComponent } from './encuesta/form/form.component';
import { FormularioListComponent } from './formulario/list/list.component';
import { EvaluacionlistComponent } from './evaluacion/list/list.component';
import { EvaluacionformComponent } from './evaluacion/form/form.component';


export const appRoutes: Routes = [
    //{ path: '', component: HomeComponent, canActivate: [AuthGuard] },
    { path: 'establecimientoSaludForm', component: EstablecimientoSaludFormComponent, canActivate: [AuthGuard] },
    { path: 'establecimientoSaludList', component: EstablecimientoSaludListComponent, canActivate: [AuthGuard] },
    { path: 'establecimientoSalud', component: EstablecimientoSaludComponent, canActivate: [AuthGuard] },
    { path: 'login',component: LoginComponent, canActivate: [AuthGuard] },
    { path: 'home', component: HomeComponent, canActivate: [AuthGuard] },
    { path: 'foesamn', component: FoesamnComponent, canActivate: [AuthGuard] },
    { path: 'foesambyid/:id', component: FoesamnComponent, canActivate: [AuthGuard] },
    { path: 'encuestaformcomponent', component: EncuestaFormComponent, canActivate: [AuthGuard] },
    { path: 'encuestaformcomponent/:id', component: EncuestaFormComponent, canActivate: [AuthGuard] },
    { path: 'foesamlist', component: FoesamnComponent, canActivate: [AuthGuard] },
    { path: 'formulariolist',component: FormularioListComponent, canActivate: [AuthGuard] },
    { path: 'evaluacionlist', component: EvaluacionlistComponent, canActivate: [AuthGuard] },
    { path: 'evaluacionform/:idEvaluacion', component: EvaluacionformComponent, canActivate: [AuthGuard] },
    // otherwise redirect to login
    { path: '**', redirectTo: '/login' }
];

export const routing: ModuleWithProviders = RouterModule.forRoot( appRoutes );
