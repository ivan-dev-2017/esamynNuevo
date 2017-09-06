export class AppConfig {
    //public readonly apiUrl = 'http://localhost:8080/core-general-web/';
    public readonly apiUrl = 'http://localhost:8080/esamyn/';
    public readonly keyFirstLogin = 'xxxx.xxxx';
    public readonly servicios = {'formulario.crud.findall':'rest/formulario/lista/',
                                  'encuesta.crud.findall':'rest/encuesta/todos',
                                  'encuesta.crud.create':'rest/encuesta/guardar',
                                  'encuesta.crud.update':'rest/encuesta/guardar',
                                  'encuesta.crud.read':'rest/encuesta/buscar/',
                                  'encuesta.crud.finalizar':'rest/encuesta/finalizar',
                                  'pregunta.crud.create':'rest/pregunta/guardar',
                                  'pregunta.crud.read':'rest/pregunta/buscar/',
                                  'pregunta.crud.update':'rest/pregunta/editar/',
                                  'pregunta.crud.findall':'rest/pregunta/',
                                  'establecimientoSalud.crud.findall':'rest/establecimientoSalud/todos',
                                  'establecimientoSalud.crud.update':'rest/establecimientoSalud/guardar',
                                  'establecimientoSalud.crud.read':'rest/establecimientoSalud/buscar/',
                                  'establecimientoSalud.crud.delete':'rest/establecimientoSalud/eliminar',
                                  'evaluacion.crud.findall':'rest/evaluacion/todos',
                                  'evaluacion.crud.read':'rest/evaluacion/buscar/',
                                  'personaJuridica.crud.findall':'rest/personaJuridica/todos',
                                  'canton.crud.findall':'rest/canton/todos',
                                  'canton.crud.update':'rest/canton/guardar',
                                  'canton.crud.read':'rest/canton/buscar/2',
                                  'canton.crud.delete':'rest/canton/eliminar/'};
};
