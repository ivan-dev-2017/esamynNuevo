package acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import acess.esamyn.dao.FormularioDAO;
import acess.esamyn.modelo.Formulario;

@Stateless
@LocalBean
public class FormularioBean extends GenericServiceImpl<Formulario, Long> {

	@EJB
	private FormularioDAO formularioDAO;

	@Override
	public GenericDao<Formulario, Long> getDao() {
		return formularioDAO;
	}
	
	

}
