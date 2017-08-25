package acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import acess.esamyn.dao.EstablecimientoSaludDAO;
import acess.esamyn.modelo.EstablecimientoSalud;

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
