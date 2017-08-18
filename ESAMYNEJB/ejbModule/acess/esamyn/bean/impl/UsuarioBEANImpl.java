package acess.esamyn.bean.impl;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.constant.CriteriaTypeEnum;
import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;
import com.saviasoft.util.Criteria;

import acess.esamyn.bean.UsuarioBEAN;
import acess.esamyn.dao.UsuarioDAO;
import acess.esamyn.dto.MensajeDto;
import acess.esamyn.modelo.Usuario;

@Stateless
public class UsuarioBEANImpl extends GenericServiceImpl<Usuario, Long> implements UsuarioBEAN {

	@EJB
	private UsuarioDAO usuarioDAO;

	@Override
	public GenericDao<Usuario, Long> getDao() {

		return usuarioDAO;
	}

	@Override
	public MensajeDto validarUSaurioContrasena(String usuario, String contrasenia) {

		String[] ands = { "usuUsername" };
		CriteriaTypeEnum[] operator = { CriteriaTypeEnum.STRING_EQUALS };
		Object[] valores = { usuario };

		Criteria criteria = new Criteria(ands, operator, valores);

		MensajeDto dto = null;

		List<Usuario> lista = findByCriterias(criteria);
		if (lista != null && !lista.isEmpty()) {
			// validar contrasena
			Usuario u = lista.get(0);
			if (u.getUsuPassword().equals(contrasenia)) {

				dto = new MensajeDto(false, "", u);
			} else {
				dto = new MensajeDto(true, "Contraseña incorrecta", null);
			}

		} else {

			dto = new MensajeDto(true, "El usuario no esta registrado", null);

		}

		return dto;
	}

}
