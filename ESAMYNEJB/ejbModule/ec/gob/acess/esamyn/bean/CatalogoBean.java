
package ec.gob.acess.esamyn.bean;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.CatalogoDAO;
import ec.gob.acess.esamyn.modelo.Catalogo;

/**
 * 
 * Clase: CatalogoBean.java
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class CatalogoBean extends GenericServiceImpl<Catalogo, Long> {

    @EJB
    private CatalogoDAO catalogoDAO;

    @Override
    public GenericDao<Catalogo, Long> getDao() {
	return catalogoDAO;
    }

}
