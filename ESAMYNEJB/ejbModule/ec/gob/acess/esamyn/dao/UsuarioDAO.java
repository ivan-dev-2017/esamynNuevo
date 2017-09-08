package ec.gob.acess.esamyn.dao;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import ec.gob.acess.esamyn.modelo.Usuario;

/**
 * 
 * Interfaz UsuarioDAO para clase Usuario
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface UsuarioDAO extends GenericDao<Usuario, Long> {

	/**
	 * Obtiene usuario por el username.
	 * 
	 * @param username
	 * @return
	 */
	Usuario getPorUsername(String username);
}
