
package ec.gob.acess.esamyn.bean;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.constant.CriteriaTypeEnum;
import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;
import com.saviasoft.util.Criteria;

import ec.gob.acess.esamyn.dao.VerificadorDAO;
import ec.gob.acess.esamyn.modelo.Verificador;

/**
 * 
 * Clase que maneja la logica de clase Verificador
 * 
 * @author Duval Barragan
 * @date Sep 12, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class VerificadorBean extends GenericServiceImpl<Verificador, Long> {

    @EJB
    private VerificadorDAO verificadorDAO;

    @Override
    public GenericDao<Verificador, Long> getDao() {
	return verificadorDAO;
    }

    public List<Verificador> listaPorEvaluacion(Long idEvaluacion) {

	String[] ands = { "evaluacion.codigo" };
	CriteriaTypeEnum[] operator = { CriteriaTypeEnum.LONG_EQUALS };
	Object[] valores = { idEvaluacion };

	Criteria criteria = new Criteria(ands, operator, valores);

	return findByCriterias(criteria);
    }
    
    

}
