
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.EstablecimientoSaludDAO;
import ec.gob.acess.esamyn.modelo.EstablecimientoSalud;

/**
 * 
 * Clase: EstablecimientoSaludBean.java
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

	@Override
	public GenericDao<EstablecimientoSalud, Long> getDao() {
		return establecimientoSaludDAO;
	}

}
