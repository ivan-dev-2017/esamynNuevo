package ec.gob.acess.esamyn.dto;

import java.io.Serializable;

public class ParametroDto implements Serializable {

    private static final long serialVersionUID = 362059852979732524L;

    private String parametro;

    private String verificador;

    private boolean noAplica;

    private boolean obligatorio;

    private Integer puntaje;

    private Long codigoParametro;

    /**
     * @return the parametro
     */
    public String getParametro() {
	return parametro;
    }

    /**
     * @param parametro
     *            the parametro to set
     */
    public void setParametro(String parametro) {
	this.parametro = parametro;
    }

    /**
     * @return the verificador
     */
    public String getVerificador() {
	return verificador;
    }

    /**
     * @param verificador
     *            the verificador to set
     */
    public void setVerificador(String verificador) {
	this.verificador = verificador;
    }

    /**
     * @return the noAplica
     */
    public boolean isNoAplica() {
	return noAplica;
    }

    /**
     * @param noAplica
     *            the noAplica to set
     */
    public void setNoAplica(boolean noAplica) {
	this.noAplica = noAplica;
    }

   

    /**
     * @return the obligatorio
     */
    public boolean isObligatorio() {
        return obligatorio;
    }

    /**
     * @param obligatorio the obligatorio to set
     */
    public void setObligatorio(boolean obligatorio) {
        this.obligatorio = obligatorio;
    }

    /**
     * @param codigoParametro the codigoParametro to set
     */
    public void setCodigoParametro(Long codigoParametro) {
        this.codigoParametro = codigoParametro;
    }

    /**
     * @return the puntaje
     */
    public Integer getPuntaje() {
	return puntaje;
    }

    /**
     * @param puntaje
     *            the puntaje to set
     */
    public void setPuntaje(Integer puntaje) {
	this.puntaje = puntaje;
    }

    /**
     * @return the codigoParametro
     */
    public Long getCodigoParametro() {
	return codigoParametro;
    }


}
