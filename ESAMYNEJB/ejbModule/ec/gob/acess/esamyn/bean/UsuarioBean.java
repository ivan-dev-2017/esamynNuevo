package ec.gob.acess.esamyn.bean;

import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.constant.CriteriaTypeEnum;
import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;
import com.saviasoft.util.Criteria;

import ec.gob.acess.esamyn.dao.UsuarioDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.Usuario;
import ec.gob.acess.esamyn.util.CifradoUtil;
import ec.gob.acess.esamyn.util.Md5;

/**
 * 
 * Clase: UsuarioBean.java
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017 Version: 1.0
 *
 */
@Stateless
@LocalBean
public class UsuarioBean extends GenericServiceImpl<Usuario, Long> {

    @EJB
    private UsuarioDAO usuarioDAO;

    @Override
    public GenericDao<Usuario, Long> getDao() {
	return usuarioDAO;
    }

    /**
     * Metodo que valida credenciales de ingreso
     * 
     * @param usuario
     * @param contrasenia
     * @return
     */
    public MensajeDto validarUsuarioContrasena(String usuario, String contrasenia) {

	String[] ands = { "username" };
	CriteriaTypeEnum[] operator = { CriteriaTypeEnum.STRING_EQUALS };
	Object[] valores = { usuario };

	Criteria criteria = new Criteria(ands, operator, valores);

	MensajeDto dto = null;

	List<Usuario> lista = findByCriterias(criteria);
	if (lista != null && !lista.isEmpty()) {
	    // validar contrasena
	    Usuario u = lista.get(0);
	    if (u.getPassword().equals(contrasenia)) {

		// generamos token
		Calendar c = Calendar.getInstance();
		String token = CifradoUtil.encriptar(u.getCodigo() + "-" + u.getUsername() + "-" + c.getTimeInMillis(),
			"esamyn");
		System.out.println("token: " + token);
		u.setToken(token);

		update(u);

		dto = new MensajeDto(false, "", u);
	    } else {
		dto = new MensajeDto(true, "Contraseña incorrecta", null);
	    }

	} else {

	    dto = new MensajeDto(true, "El usuario no esta registrado", null);

	}

	return dto;
    }

    /**
     * Metodo que crea o actualiza un usuario
     * 
     * @param usuario
     * @return
     */
    public MensajeDto guardar(Usuario usuario) {

	MensajeDto dto = new MensajeDto();

	try {

	    if (usuario.getCodigo() == null) {

		dto.setError(false);
		dto.setMensaje("Usuario Guardado");
		usuario.setCreado(new Date());
		usuario.setModificado(new Date());
		create(usuario);
		dto.setObjeto(usuario);
	    } else {
		dto.setError(false);
		dto.setMensaje("Usuario Actualizado");
		usuario.setModificado(new Date());
		update(usuario);
		dto.setObjeto(usuario);
	    }

	} catch (Exception e) {
	    dto.setError(true);
	    dto.setMensaje("Error al guardar: " + e.getMessage());
	    dto.setObjeto(null);
	}

	return dto;

    }

    /**
     * Metodo que valida si el token enviado es correcto
     * 
     * @param token
     * @return
     */
    public boolean validaToken(String token) {

	String revToken;
	boolean validaToken = false;
	try {
	    revToken = CifradoUtil.desencriptar(token, "esamyn");
	} catch (Exception e) {

	    e.printStackTrace();
	    return validaToken;
	}

	String[] arr = revToken.split("-");

	if (arr.length > 2) {

	    Long codigo = Long.parseLong(arr[0]);

	    Usuario u = findByPk(codigo);

	    if (u != null) {

		if (u.getCodigo().equals(codigo) && u.getUsername().equals(arr[1])) {

		    validaToken = true;
		}

	    }
	}
	return validaToken;
    }

    public MensajeDto cambiarPassword(String token, String passAntigua, String passNueva) {

	MensajeDto dto = null;

	if (passAntigua.equals(passNueva)) {

	    try {
		String clave1 = Md5.aplicarHash(passAntigua);

		String clave2 = Md5.aplicarHash(passNueva);

		Usuario usuario = buscarPorToken(token);

		if (usuario != null) {

		    if (clave1.equals(clave1)) {

			usuario.setPassword(clave2);
			update(usuario);

		    } else {
			dto = new MensajeDto(true, "La contraseña ingresada no es igual a su contraseña actual", null);
		    }

		} else {
		    dto = new MensajeDto(true, "Token invalido", null);
		}

	    } catch (NoSuchAlgorithmException e) {
		dto = new MensajeDto(true, e.getMessage(), null);
	    }

	} else {

	    dto = new MensajeDto(true, "Las contraseñas no son iguales", null);
	}

	return dto;

    }

    public Usuario buscarPorToken(String token) {

	String revToken;
	try {
	    revToken = CifradoUtil.desencriptar(token, "esamyn");
	    String[] arr = revToken.split("-");

	    if (arr.length > 2) {

		Long codigo = Long.parseLong(arr[0]);

		Usuario u = findByPk(codigo);

		if (u != null) {

		    if (u.getCodigo().equals(codigo) && u.getUsername().equals(arr[1])) {

			return u;
		    }

		}
	    }
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

	return null;
    }
}
