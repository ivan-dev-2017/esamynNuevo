/**
 * 
 */
package ec.gob.acess.esamyn.dto;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * Clase: EvaluacionDto.java
 * 
 * @author Juan Ochoa
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
public class EvaluacionDto implements Serializable {

    private static final long serialVersionUID = -1757183699694167044L;

    private Long codigoGrupo;

    private String grupo;

    private List<PasoDto> hijos;

    /**
     * @return the codigoGrupo
     */
    public Long getCodigoGrupo() {
        return codigoGrupo;
    }

    /**
     * @param codigoGrupo the codigoGrupo to set
     */
    public void setCodigoGrupo(Long codigoGrupo) {
        this.codigoGrupo = codigoGrupo;
    }

    /**
     * @return the grupo
     */
    public String getGrupo() {
        return grupo;
    }

    /**
     * @param grupo the grupo to set
     */
    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    /**
     * @return the hijos
     */
    public List<PasoDto> getHijos() {
        return hijos;
    }

    /**
     * @param hijos the hijos to set
     */
    public void setHijos(List<PasoDto> hijos) {
        this.hijos = hijos;
    }

    
}
