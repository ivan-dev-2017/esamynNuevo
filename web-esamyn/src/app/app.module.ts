/**
 * MODULOS DEL ANGULAR2
 */
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule} from '@angular/core';
import { FormsModule,ReactiveFormsModule  } from '@angular/forms';
import { HttpModule } from '@angular/http';

/**
 * MODULOS BASE DE LA SOLUCION
 */
import { AppComponent } from './app.component';
import { routing } from './app.router';
import { AppConfig } from './app.config';

/**
 * MODULOS THIRD PARTY
 */
import { NgxDatatableModule } from '@swimlane/ngx-datatable';
import { BootstrapModalModule } from 'ng2-bootstrap-modal';
import { AlertModule } from 'ngx-bootstrap';
import 'hammerjs';

/**
 * MODULOS PROPIOS DE LA SOLUCION
 */
import { AuthGuard } from './guard/index';
import { AlertService, AuthenticationService,UserService,GlobalService, MessageService,GlobaleventsmanagerService,
	     WebApiObservableService,SecurityService,CoreesamynService} from './service/index';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { HeaderComponent } from './layout/header/header.component';
import { LeftpanelComponent } from './layout/leftpanel/leftpanel.component';
import { FooterComponent } from './layout/footer/footer.component';
import { MenuComponent } from './layout/menu/menu.component';
import { EmailvalidatorDirective,NumbervalidatorDirective,DropdownvalidatorDirective } from './validator/index';
import { FormularioListComponent } from './formulario/list/list.component';
import { EstablecimientoSaludFormComponent } from './establecimiento-salud/form/form.component';
import { EstablecimientoSaludListComponent } from './establecimiento-salud/list/list.component';
import { EstablecimientoSaludComponent } from './establecimiento-salud/establecimiento-salud.component';
import { FoesamnComponent } from './encuesta/foesamn/foesamn.component';
import { ForgetpasswordComponent } from './login/forgetpassword/forgetpassword.component';
import { ChangepasswordComponent } from './login/changepassword/changepassword.component';
import {EncuestaFormComponent} from './encuesta/form/form.component';


/**
 * COMPONENTES DE LA SOLUCION
 */
import { AlertComponent } from './comp/alert/alert.component';
import {SafeHtmlPipe} from "./comp/pipe/safehtml.pipe";
import { ModalpromptComponent } from './comp/modalprompt/modalprompt.component';
import { MessageComponent } from './comp/message/message.component';
import { EvaluacionlistComponent } from './evaluacion/list/list.component';
import { EvaluacionformComponent } from './evaluacion/form/form.component';



@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    AlertComponent,
    HeaderComponent,
    LeftpanelComponent,
    MenuComponent,
    FooterComponent,
    SafeHtmlPipe,
    ModalpromptComponent,
    EmailvalidatorDirective,
    NumbervalidatorDirective,
		DropdownvalidatorDirective,
    MessageComponent,
    FormularioListComponent,
    EstablecimientoSaludFormComponent,
    EstablecimientoSaludListComponent,
    EstablecimientoSaludComponent,
    FoesamnComponent,
    EncuestaFormComponent,
    EvaluacionlistComponent,
    EvaluacionformComponent,
    ForgetpasswordComponent,
    ChangepasswordComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    ReactiveFormsModule ,
    HttpModule,
    routing,
    NgxDatatableModule,
    BootstrapModalModule,
    AlertModule.forRoot()
  ],
  providers: [
		AppConfig,
		AuthGuard,
		AlertService,
		AuthenticationService,
		UserService,
		GlobalService,
		GlobaleventsmanagerService,
		MessageService,
		WebApiObservableService,
		SecurityService,
		CoreesamynService
              ],
  entryComponents: [
                    ModalpromptComponent,ForgetpasswordComponent,ChangepasswordComponent
                  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
