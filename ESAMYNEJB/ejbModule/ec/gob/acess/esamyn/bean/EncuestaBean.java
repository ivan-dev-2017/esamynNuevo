
package ec.gob.acess.esamyn.bean;

import java.util.Date;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.EncuestaDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.Encuesta;
import ec.gob.acess.esamyn.modelo.Usuario;

/**
 * 
 * Clase que maneja la logica de clase Encuesta
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class EncuestaBean extends GenericServiceImpl<Encuesta, Long> {

	@EJB
	private EncuestaDAO encuestaDAO;

	@Override
	public GenericDao<Encuesta, Long> getDao() {
		return encuestaDAO;
	}

	public MensajeDto guardar(Encuesta encuesta, Usuario usuario) {

		MensajeDto mensajeDto = new MensajeDto();

		try {

			if (encuesta.getCodigo() == null) {

				mensajeDto.setError(false);
				mensajeDto.setMensaje("Encuesta Guardado");
				encuesta.setCreadoPor(usuario.getUsername());
				encuesta.setModificadoPor(usuario.getUsername());
				encuesta.setUsuario(usuario);
				encuesta.setFechaInicial(new Date());

				create(encuesta);
				mensajeDto.setObjeto(encuesta);
			} else {
				mensajeDto.setError(false);
				mensajeDto.setMensaje("Actualiza Objeto");

				encuesta.setModificadoPor(usuario.getUsername());
				encuesta.setFechaInicial(new Date());

				update(encuesta);
				mensajeDto.setObjeto(encuesta);
			}

		} catch (Exception e) {
			mensajeDto.setError(true);
			mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
			mensajeDto.setObjeto(null);
		}

		return mensajeDto;

	}

}
