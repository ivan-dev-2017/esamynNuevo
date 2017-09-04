
package ec.gob.acess.esamyn.bean;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.constant.CriteriaTypeEnum;
import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;
import com.saviasoft.util.Criteria;

import ec.gob.acess.esamyn.dao.RespuestaDAO;
import ec.gob.acess.esamyn.modelo.Respuesta;

/**
 * 
 * Clase que maneja la logica de clase Respuesta
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class RespuestaBean extends GenericServiceImpl<Respuesta, Long> {

    @EJB
    private RespuestaDAO respuestaDAO;

    @Override
    public GenericDao<Respuesta, Long> getDao() {
	return respuestaDAO;
    }

    /**
     * Buscar lista por encuesta
     * 
     * @param idEncuesta
     * @return
     */
    public List<Respuesta> buscarPorEncuesta(Long idEncuesta) {

	String[] ands = { "encuesta.codigo" };
	CriteriaTypeEnum[] operator = { CriteriaTypeEnum.LONG_EQUALS };
	Object[] valores = { idEncuesta };
	String[] orderby = { "codigo" };
	boolean[] asc = { true };

	Criteria criteria = new Criteria(ands, operator, valores, orderby, asc);

	return findByCriterias(criteria);

    }

}
