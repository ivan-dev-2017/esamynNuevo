package ec.gob.acess.esamyn.dto;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 * 
 * Clase: AccesoWsDto.java
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "login")
public class AccesoWsDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4673840235510590872L;

	private String usuario;

	private String password;

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
