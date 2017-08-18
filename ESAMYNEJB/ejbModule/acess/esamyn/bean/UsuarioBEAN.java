/* 
 * DiaFestivoServicio.java
 * JUN 21, 2016 
 * Copyright 2016 Saviasoft Cia. Ltda. 
 */
package acess.esamyn.bean;

import javax.ejb.Local;

import com.saviasoft.persistence.util.service.GenericService;

import acess.esamyn.dto.MensajeDto;
import acess.esamyn.modelo.Usuario;

/**
 * @author Duval
 * 
 */
@Local
public interface UsuarioBEAN extends GenericService<Usuario, Long> {

	/**
	 * MEtodo que valida usuario y contrasenia
	 * 
	 * @param usuario
	 * @param contrasenia
	 *            (encriptada)
	 * @return
	 */
	MensajeDto validarUSaurioContrasena(String usuario, String contrasenia);

}
