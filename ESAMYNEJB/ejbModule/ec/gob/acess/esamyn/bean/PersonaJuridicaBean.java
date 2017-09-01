
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.PersonaJuridicaDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.PersonaJuridica;

/**
 * 
 * Clase que maneja la logica de clase PersonaJuridica
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class PersonaJuridicaBean extends GenericServiceImpl<PersonaJuridica, Long> {

    @EJB
    private PersonaJuridicaDAO personaJuridicaDAO;

    @Override
    public GenericDao<PersonaJuridica, Long> getDao() {
	return personaJuridicaDAO;
    }

    /**
     * Guardar Objeto
     * @param personaJuridica
     * @return
     */
    public MensajeDto guardar(PersonaJuridica personaJuridica) {

	MensajeDto mensajeDto = new MensajeDto();

	try {

	    if (personaJuridica.getCodigo() == null) {

		mensajeDto.setError(false);
		mensajeDto.setMensaje("PersonaJuridica Guardado");
		create(personaJuridica);
		mensajeDto.setObjeto(personaJuridica);
	    } else {
		mensajeDto.setError(false);
		mensajeDto.setMensaje("Actualiza Objeto");
		update(personaJuridica);
		mensajeDto.setObjeto(personaJuridica);
	    }

	} catch (Exception e) {
	    mensajeDto.setError(true);
	    mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
	    mensajeDto.setObjeto(null);
	}

	return mensajeDto;

    }
 
}
