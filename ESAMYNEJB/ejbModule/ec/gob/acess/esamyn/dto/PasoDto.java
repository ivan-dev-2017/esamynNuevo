/**
 * 
 */
package ec.gob.acess.esamyn.dto;

import java.io.Serializable;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

import ec.gob.acess.esamyn.modelo.GrupoParametro;

/**
 * 
 * Clase: EvaluacionDto.java
 * 
 * @author Juan Ochoa
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "pasoDto")
public class PasoDto implements Serializable {

    private static final long serialVersionUID = -1757183699694167044L;

    private Long codigoGrupo;

    private String paso;

    @XmlTransient
    private GrupoParametro grupoPadre;

    private List<DirectrizDto> hijos;

    /**
     * @return the codigoGrupo
     */
    public Long getCodigoGrupo() {
	return codigoGrupo;
    }

    /**
     * @param codigoGrupo
     *            the codigoGrupo to set
     */
    public void setCodigoGrupo(Long codigoGrupo) {
	this.codigoGrupo = codigoGrupo;
    }

    /**
     * @return the paso
     */
    public String getPaso() {
	return paso;
    }

    /**
     * @param paso
     *            the paso to set
     */
    public void setPaso(String paso) {
	this.paso = paso;
    }


    /**
     * @return the hijos
     */
    public List<DirectrizDto> getHijos() {
        return hijos;
    }

    /**
     * @param hijos the hijos to set
     */
    public void setHijos(List<DirectrizDto> hijos) {
        this.hijos = hijos;
    }

    /**
     * @return the grupoPadre
     */
    public GrupoParametro getGrupoPadre() {
        return grupoPadre;
    }

    /**
     * @param grupoPadre the grupoPadre to set
     */
    public void setGrupoPadre(GrupoParametro grupoPadre) {
        this.grupoPadre = grupoPadre;
    }

    
    

}
