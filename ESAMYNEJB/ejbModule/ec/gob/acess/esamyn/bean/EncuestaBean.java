
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.EncuestaDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.Encuesta;

/**
 * 
 * Clase que maneja la logica de clase Encuesta
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
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

    public MensajeDto guardar(Encuesta encuesta) {

	MensajeDto mensajeDto = new MensajeDto();

	try {

	    if (encuesta.getCodigo() == null) {

		mensajeDto.setError(false);
		mensajeDto.setMensaje("Encuesta Guardado");
		create(encuesta);
		mensajeDto.setObjeto(encuesta);
	    } else {
		mensajeDto.setError(false);
		mensajeDto.setMensaje("Modifica Actualizado");
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
