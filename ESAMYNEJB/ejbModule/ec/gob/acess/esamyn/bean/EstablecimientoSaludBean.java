
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.EstablecimientoSaludDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.EstablecimientoSalud;

/**
 * 
 * Clase que maneja la logica de clase EstablecimientoSaludBean.java
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class EstablecimientoSaludBean extends GenericServiceImpl<EstablecimientoSalud, Long> {

    @EJB
    private EstablecimientoSaludDAO establecimientoSaludDAO;

    @EJB
    private PersonaJuridicaBean personaJuridicaBean;

    @Override
    public GenericDao<EstablecimientoSalud, Long> getDao() {
	return establecimientoSaludDAO;
    }

    public MensajeDto guardar(EstablecimientoSalud establecimientoSalud) {

	MensajeDto mensajeDto = new MensajeDto();

	if (establecimientoSalud.getPersonaJuridica() != null) {
	    if (establecimientoSalud.getPersonaJuridica().getCodigo() == null) {
		personaJuridicaBean.create(establecimientoSalud.getPersonaJuridica());
	    } else {
		personaJuridicaBean.update(establecimientoSalud.getPersonaJuridica());
	    }
	}

	try {

	    if (establecimientoSalud.getCodigo() == null) {

		mensajeDto.setError(false);
		mensajeDto.setMensaje("Establecimiento de Salud Guardado");
		create(establecimientoSalud);
		mensajeDto.setObjeto(establecimientoSalud);
	    } else {
		mensajeDto.setError(false);
		mensajeDto.setMensaje("Actualiza Objeto");
		update(establecimientoSalud);
		mensajeDto.setObjeto(establecimientoSalud);
	    }

	} catch (Exception e) {
	    mensajeDto.setError(true);
	    mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
	    mensajeDto.setObjeto(null);
	}

	return mensajeDto;

    }

}
