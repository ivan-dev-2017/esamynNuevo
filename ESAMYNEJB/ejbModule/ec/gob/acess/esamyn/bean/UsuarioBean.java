package ec.gob.acess.esamyn.bean;

import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
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
import ec.gob.acess.esamyn.util.PasswordUtil;

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

	MensajeDto mensajeDto = null;

	List<Usuario> lista = findByCriterias(criteria);
	if (lista != null && !lista.isEmpty()) {
	    // validar contrasena
	    Usuario usuarioObjeto = lista.get(0);
	    if (usuarioObjeto.getPassword().equals(contrasenia)) {

		// generamos token
		Calendar c = Calendar.getInstance();
		String token = CifradoUtil.encriptar(usuarioObjeto.getCodigo() + "-" + usuarioObjeto.getUsername() + "-" + c.getTimeInMillis(),
			"esamyn");
		System.out.println("token: " + token);
		usuarioObjeto.setToken(token);

		update(usuarioObjeto);

		mensajeDto = new MensajeDto(false, "", usuarioObjeto);
	    } else {
		mensajeDto = new MensajeDto(true, "Contraseña incorrecta", null);
	    }

	} else {

	    mensajeDto = new MensajeDto(true, "El usuario no esta registrado", null);

	}

	return mensajeDto;
    }

    /**
     * Metodo que crea o actualiza un usuario
     * 
     * @param usuario
     * @return
     */
    public MensajeDto guardar(Usuario usuario) {

	MensajeDto mensajeDto = new MensajeDto();

	try {

	    if (usuario.getCodigo() == null) {

		mensajeDto.setError(false);
		mensajeDto.setMensaje("Usuario Guardado");
		create(usuario);
		mensajeDto.setObjeto(usuario);
	    } else {
		mensajeDto.setError(false);
		mensajeDto.setMensaje("Usuario Actualizado");
		update(usuario);
		mensajeDto.setObjeto(usuario);
	    }

	} catch (Exception e) {
	    mensajeDto.setError(true);
	    mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
	    mensajeDto.setObjeto(null);
	}

	return mensajeDto;

    }

    /**
     * Metodo que valida si el token enviado es correcto
     * 
     * @param token
     * @return
     */
    public boolean validaToken(String token) throws Exception {

	String revToken;
	boolean validaToken = false;
	try {
	    revToken = CifradoUtil.desencriptar(token, "esamyn");
	} catch (Exception e) {

	    throw e;
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

    /**
     * Metodo para cambiar password de un usuario
     * 
     * @param token
     * @param passAntigua
     * @param passNueva
     * @return
     */
    public MensajeDto cambiarPassword(Long idUsuario, String passAntigua, String passNueva) {

	MensajeDto mensajeDto = null;

	

	    try {
		String clave1 = Md5.aplicarHash(passAntigua);

		String clave2 = Md5.aplicarHash(passNueva);

		Usuario usuario = findByPk(idUsuario);

		if (usuario != null) {

		    if (clave1.equals(usuario.getPassword())) {

			usuario.setPassword(clave2);
			update(usuario);
			mensajeDto = new MensajeDto(false, "Contraseña cambiada", null);

		    } else {
			mensajeDto = new MensajeDto(true, "La contraseña ingresada no es igual a su contraseña actual",
				null);
		    }

		} else {
		    mensajeDto = new MensajeDto(true, "No existe el usuario", null);
		}

	    } catch (NoSuchAlgorithmException e) {
		mensajeDto = new MensajeDto(true, "Error al encriptar " + e.getMessage(), null);
	    }

	

	return mensajeDto;

    }

    public MensajeDto olvidoPassword(String userName) {
	MensajeDto mensajeDto;

	String[] ands = { "username" };
	CriteriaTypeEnum[] operator = { CriteriaTypeEnum.STRING_EQUALS };
	Object[] valores = { userName };

	Criteria criteria = new Criteria(ands, operator, valores);

	List<Usuario> lista = findByCriterias(criteria);
	if (lista != null && !lista.isEmpty()) {

	    Usuario usuario = lista.get(0);

	    String contrasena = PasswordUtil.getCadenaAlfanumAleatoria(6);

	    String pass;
	    try {
		pass = Md5.aplicarHash(contrasena);
		usuario.setPassword(pass);

		update(usuario);

		// TODO enviar correo

		// TODO buscar texto cooreo

		mensajeDto = new MensajeDto(false, "Cambio de contraseña", null);

	    } catch (NoSuchAlgorithmException e) {
		mensajeDto = new MensajeDto(true, "Error al encriptar " + e.getMessage(), null);
	    }

	} else {

	    mensajeDto = new MensajeDto(true, "No existe el usuario", null);

	}

	return mensajeDto;
    }

    /**
     * Busca usaurio por token
     * 
     * @param token
     * @return
     */
    public Usuario buscarPorToken(String token) throws Exception {

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

	    e.printStackTrace();
	    throw e;
	}

	return null;
    }
}
