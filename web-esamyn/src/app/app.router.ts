/**
 * New typescript file
 */
import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { EstablecimientoSaludComponent } from './establecimiento-salud/form/form.component';
import { FoesamnComponent } from './encuesta/foesamn/foesamn.component';
import { AuthGuard } from './guard/index';
import { EncuestaFormComponent } from './encuesta/form/form.component';
import { FormularioListComponent } from './formulario/list/list.component';
import { EvaluacionlistComponent } from './evaluacion/list/list.component';
import { EvaluacionformComponent } from './evaluacion/form/form.component';


export const appRoutes: Routes = [
    //{ path: '', component: HomeComponent, canActivate: [AuthGuard] },
    { path: 'establecimientoSalud', component: EstablecimientoSaludComponent },
    { path: 'login',component: LoginComponent },
    { path: 'home', component: HomeComponent },
    { path: 'foesamn', component: FoesamnComponent },
    { path: 'foesamn/:id', component: FoesamnComponent },
    { path: 'encuestaformcomponent', component: EncuestaFormComponent },
    { path: 'encuestaformcomponent/:id', component: EncuestaFormComponent },
    { path: 'foesamlist', component: FoesamnComponent },
    { path: 'formulariolist',component: FormularioListComponent },
    { path: 'evaluacionlist', component: EvaluacionlistComponent },
    { path: 'evaluacionform/:idEvaluacion', component: EvaluacionformComponent },
    // otherwise redirect to login
    { path: '**', redirectTo: '/login' }
];

export const routing: ModuleWithProviders = RouterModule.forRoot( appRoutes );
