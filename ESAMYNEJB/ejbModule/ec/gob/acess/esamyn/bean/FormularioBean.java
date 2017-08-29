package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.FormularioDAO;
import ec.gob.acess.esamyn.modelo.Formulario;


/**
 * 
 * Clase: FormularioBean.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
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
