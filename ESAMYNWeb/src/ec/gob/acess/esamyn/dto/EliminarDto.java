package ec.gob.acess.esamyn.dto;

import java.io.Serializable;

/**
 * 
 * Clase: EliminarDto.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
public class EliminarDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2562720911264435L;
	private Long codigo;

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

}
