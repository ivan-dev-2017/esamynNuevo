/**
 * New typescript file
 */
import { ModuleWithProviders }  from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { EstablecimientoSaludComponent } from './establecimiento-salud/establecimiento-salud.component';
import { AuthGuard } from './guard/index';

export const appRoutes: Routes = [
	//{ path: '', component: HomeComponent, canActivate: [AuthGuard] },
//	{ path: 'login', component: LoginComponent },
//	{ path: 'home', component: HomeComponent },
//    // otherwise redirect to home
//    { path: '**', redirectTo: '/login' }
	
	{ path: 'establecimientoSalud', component: EstablecimientoSaludComponent },
	{ path: '**', redirectTo: '/' }
];

export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);