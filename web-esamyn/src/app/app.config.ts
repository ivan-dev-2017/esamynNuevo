export class AppConfig {
    //public readonly apiUrl = 'http://localhost:8080/core-general-web/';
    public readonly apiUrl = 'http://45.55.147.66:8080/esamyn/';
    public readonly keyFirstLogin = 'xxxx.xxxx';
    public readonly servicios = {'formulario.crud.findall':'rest/formulario/lista/',
                                  'encuesta.crud.findall':'rest/encuesta/todos',
                                  'encuesta.crud.create':'rest/catalogo/guardar',
                                  'encuesta.crud.update':'rest/catalogo/guardar',
                                  'encuesta.crud.read':'rest/encuesta/buscar/'};
};