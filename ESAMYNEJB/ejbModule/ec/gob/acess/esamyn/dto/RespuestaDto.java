package ec.gob.acess.esamyn.dto;

import java.io.Serializable;

public class RespuestaDto  implements Serializable{
    
    private static final long serialVersionUID = 3485911875089509698L;

    private Long idRespuesta;
    
    private String unicodigo;
    
    private Long secuencial;
    
    private String Responsable;
    
    private String cargo;
    
    private String creadoPor;
    
    private String fechaEvaluacion;
    
    private String fechaEncuesta;
    
    private String finalizada;
    
    private String respuesta;
    
    private Long idPregunta;

    /**
     * @return the unicodigo
     */
    public String getUnicodigo() {
        return unicodigo;
    }

    /**
     * @param unicodigo the unicodigo to set
     */
    public void setUnicodigo(String unicodigo) {
        this.unicodigo = unicodigo;
    }

    /**
     * @return the secuencial
     */
    public Long getSecuencial() {
        return secuencial;
    }

    /**
     * @param secuencial the secuencial to set
     */
    public void setSecuencial(Long secuencial) {
        this.secuencial = secuencial;
    }

    /**
     * @return the responsable
     */
    public String getResponsable() {
        return Responsable;
    }

    /**
     * @param responsable the responsable to set
     */
    public void setResponsable(String responsable) {
        Responsable = responsable;
    }

    /**
     * @return the cargo
     */
    public String getCargo() {
        return cargo;
    }

    /**
     * @param cargo the cargo to set
     */
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }


    /**
     * @return the creadoPor
     */
    public String getCreadoPor() {
        return creadoPor;
    }

    /**
     * @param creadoPor the creadoPor to set
     */
    public void setCreadoPor(String creadoPor) {
        this.creadoPor = creadoPor;
    }

    /**
     * @return the fechaEvaluacion
     */
    public String getFechaEvaluacion() {
        return fechaEvaluacion;
    }

    /**
     * @param fechaEvaluacion the fechaEvaluacion to set
     */
    public void setFechaEvaluacion(String fechaEvaluacion) {
        this.fechaEvaluacion = fechaEvaluacion;
    }

    /**
     * @return the fechaEncuesta
     */
    public String getFechaEncuesta() {
        return fechaEncuesta;
    }

    /**
     * @param fechaEncuesta the fechaEncuesta to set
     */
    public void setFechaEncuesta(String fechaEncuesta) {
        this.fechaEncuesta = fechaEncuesta;
    }

    /**
     * @return the finalizada
     */
    public String getFinalizada() {
        return finalizada;
    }

    /**
     * @param finalizada the finalizada to set
     */
    public void setFinalizada(String finalizada) {
        this.finalizada = finalizada;
    }

    /**
     * @return the respuesta
     */
    public String getRespuesta() {
        return respuesta;
    }

    /**
     * @param respuesta the respuesta to set
     */
    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    /**
     * @return the idPregunta
     */
    public Long getIdPregunta() {
        return idPregunta;
    }

    /**
     * @param idPregunta the idPregunta to set
     */
    public void setIdPregunta(Long idPregunta) {
        this.idPregunta = idPregunta;
    }

    public Long getIdRespuesta() {
	return idRespuesta;
    }

    public void setIdRespuesta(Long idRespuesta) {
	this.idRespuesta = idRespuesta;
    }
    
    

}
