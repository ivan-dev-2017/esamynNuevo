package ec.gob.acess.esamyn.dto;

import java.io.Serializable;

public class EcuenstaFiltro implements Serializable {

    private static final long serialVersionUID = 1467813458013444585L;

    private Long codigoFormulario;

    private Long codigoEstablesimiento;

    /**
     * @return the codigoFormulario
     */
    public Long getCodigoFormulario() {
	return codigoFormulario;
    }

    /**
     * @param codigoFormulario
     *            the codigoFormulario to set
     */
    public void setCodigoFormulario(Long codigoFormulario) {
	this.codigoFormulario = codigoFormulario;
    }

    /**
     * @return the codigoEstablesimiento
     */
    public Long getCodigoEstablesimiento() {
	return codigoEstablesimiento;
    }

    /**
     * @param codigoEstablesimiento
     *            the codigoEstablesimiento to set
     */
    public void setCodigoEstablesimiento(Long codigoEstablesimiento) {
	this.codigoEstablesimiento = codigoEstablesimiento;
    }

}
