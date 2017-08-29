
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.CantonDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.Canton;

/**
 * 
 * Clase que maneja la logica de clase Canton
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class CantonBean extends GenericServiceImpl<Canton, Long> {

    @EJB
    private CantonDAO cantonDAO;

    @Override
    public GenericDao<Canton, Long> getDao() {
	return cantonDAO;
    }

    public MensajeDto guardar(Canton canton) {

	MensajeDto mensajeDto = new MensajeDto();

	try {

	    if (canton.getCodigo() == null) {

		mensajeDto.setError(false);
		mensajeDto.setMensaje("Canton Guardado");
		create(canton);
		mensajeDto.setObjeto(canton);
	    } else {
		mensajeDto.setError(false);
		mensajeDto.setMensaje("Actualiza Objeto");
		update(canton);
		mensajeDto.setObjeto(canton);
	    }

	} catch (Exception e) {
	    mensajeDto.setError(true);
	    mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
	    mensajeDto.setObjeto(null);
	}

	return mensajeDto;

    }

}
