
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.CumpleCondicionNoAplicaDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.CumpleCondicionNoAplica;

/**
 * 
 * Clase que maneja la logica de clase CumpleCondicionNoAplica
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class CumpleCondicionNoAplicaBean extends GenericServiceImpl<CumpleCondicionNoAplica, Long> {

	@EJB
	private CumpleCondicionNoAplicaDAO cumpleCondicionNoAplicaDAO;

	@Override
	public GenericDao<CumpleCondicionNoAplica, Long> getDao() {
		return cumpleCondicionNoAplicaDAO;
	}

	public MensajeDto guardar(CumpleCondicionNoAplica cumpleCondicionNoAplica) {

		MensajeDto mensajeDto = new MensajeDto();

		try {

			if (cumpleCondicionNoAplica.getCodigo() == null) {

				mensajeDto.setError(false);
				mensajeDto.setMensaje("CumpleCondicionNoAplica Guardado");
				create(cumpleCondicionNoAplica);
				mensajeDto.setObjeto(cumpleCondicionNoAplica);
			} else {
				mensajeDto.setError(false);
				mensajeDto.setMensaje("Actualiza Objeto");
				update(cumpleCondicionNoAplica);
				mensajeDto.setObjeto(cumpleCondicionNoAplica);
			}

		} catch (Exception e) {
			mensajeDto.setError(true);
			mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
			mensajeDto.setObjeto(null);
		}

		return mensajeDto;

	}

}
