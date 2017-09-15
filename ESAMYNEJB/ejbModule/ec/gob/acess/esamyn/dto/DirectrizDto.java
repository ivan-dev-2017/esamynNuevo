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
@XmlType(name = "directrizDto")
public class DirectrizDto implements Serializable {

    private static final long serialVersionUID = -1757183699694167044L;

    private Long codigoGrupo;

    private String directriz;

    @XmlTransient
    private GrupoParametro grupoPadre;

    private List<ParametroDto> hijos;

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
     * @return the directriz
     */
    public String getDirectriz() {
	return directriz;
    }

    /**
     * @param directriz
     *            the directriz to set
     */
    public void setDirectriz(String directriz) {
	this.directriz = directriz;
    }

    /**
     * @return the hijos
     */
    public List<ParametroDto> getHijos() {
	return hijos;
    }

    /**
     * @param hijos
     *            the hijos to set
     */
    public void setHijos(List<ParametroDto> hijos) {
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
