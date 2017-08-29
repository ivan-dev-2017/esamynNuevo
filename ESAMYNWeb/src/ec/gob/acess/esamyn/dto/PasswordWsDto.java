package ec.gob.acess.esamyn.dto;

import java.io.Serializable;
/**
 * 
 * Clase: PasswordWsDto.java
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
public class PasswordWsDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8201448609212098389L;

	private Long codigoUsuario;

	private String passwordAntiguo;

	private String passwordNuevo;

	public Long getCodigoUsuario() {
		return codigoUsuario;
	}

	public void setCodigoUsuario(Long codigoUsuario) {
		this.codigoUsuario = codigoUsuario;
	}

	public String getPasswordAntiguo() {
		return passwordAntiguo;
	}

	public void setPasswordAntiguo(String passwordAntiguo) {
		this.passwordAntiguo = passwordAntiguo;
	}

	public String getPasswordNuevo() {
		return passwordNuevo;
	}

	public void setPasswordNuevo(String passwordNuevo) {
		this.passwordNuevo = passwordNuevo;
	}

}
