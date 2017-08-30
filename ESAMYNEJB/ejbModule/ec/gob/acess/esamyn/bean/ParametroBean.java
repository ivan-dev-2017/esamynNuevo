
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.ParametroDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.Parametro;

/**
 * 
 * Clase que maneja la logica de clase Parametro
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class ParametroBean extends GenericServiceImpl<Parametro, Long> {

    @EJB
    private ParametroDAO parametroDAO;

    @Override
    public GenericDao<Parametro, Long> getDao() {
	return parametroDAO;
    }

    public MensajeDto guardar(Parametro parametro) {

	MensajeDto mensajeDto = new MensajeDto();

	try {

	    if (parametro.getCodigo() == null) {

		mensajeDto.setError(false);
		mensajeDto.setMensaje("Parametro Guardado");
		create(parametro);
		mensajeDto.setObjeto(parametro);
	    } else {
		mensajeDto.setError(false);
		mensajeDto.setMensaje("Actualiza Objeto");
		update(parametro);
				mensajeDto.setObjeto(parametro);
	    }

	} catch (Exception e) {
	    mensajeDto.setError(true);
	    mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
	    mensajeDto.setObjeto(null);
	}

	return mensajeDto;

    }

}
