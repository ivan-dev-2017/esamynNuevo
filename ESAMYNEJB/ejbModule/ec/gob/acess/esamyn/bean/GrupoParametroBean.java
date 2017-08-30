
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.GrupoParametroDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.GrupoParametro;

/**
 * 
 * Clase que maneja la logica de clase GrupoParametro
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class GrupoParametroBean extends GenericServiceImpl<GrupoParametro, Long> {

	@EJB
	private GrupoParametroDAO grupoParametroDAO;

	@Override
	public GenericDao<GrupoParametro, Long> getDao() {
		return grupoParametroDAO;
	}

	public MensajeDto guardar(GrupoParametro grupoParametro) {

		MensajeDto mensajeDto = new MensajeDto();

		try {

			if (grupoParametro.getCodigo() == null) {

				mensajeDto.setError(false);
				mensajeDto.setMensaje("GrupoParametro Guardado");
				create(grupoParametro);
				mensajeDto.setObjeto(grupoParametro);
			} else {
				mensajeDto.setError(false);
				mensajeDto.setMensaje("Actualiza Objeto");
				update(grupoParametro);
				mensajeDto.setObjeto(grupoParametro);
			}

		} catch (Exception e) {
			mensajeDto.setError(true);
			mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
			mensajeDto.setObjeto(null);
		}

		return mensajeDto;

	}

}
