
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.CondicionDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.CondicionNoAplica;

/**
 * 
 * Clase que maneja la logica de clase CondicionNoAplica
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class CondicionNoAplicaBean extends GenericServiceImpl<CondicionNoAplica, Long> {

	@EJB
	private CondicionDAO condicionNoAplicaDAO;

	@Override
	public GenericDao<CondicionNoAplica, Long> getDao() {
		return condicionNoAplicaDAO;
	}

	public MensajeDto guardar(CondicionNoAplica condicionNoAplica) {

		MensajeDto mensajeDto = new MensajeDto();

		try {

			if (condicionNoAplica.getCodigo() == null) {

				mensajeDto.setError(false);
				mensajeDto.setMensaje("CondicionNoAplica Guardado");
				create(condicionNoAplica);
				mensajeDto.setObjeto(condicionNoAplica);
			} else {
				mensajeDto.setError(false);
				mensajeDto.setMensaje("Actualiza Objeto");
				update(condicionNoAplica);
				mensajeDto.setObjeto(condicionNoAplica);
			}

		} catch (Exception e) {
			mensajeDto.setError(true);
			mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
			mensajeDto.setObjeto(null);
		}

		return mensajeDto;

	}

}
