
package ec.gob.acess.esamyn.dao;

import javax.ejb.Local;
import com.saviasoft.persistence.util.dao.GenericDao;
import ec.gob.acess.esamyn.modelo.CondicionNoAplica;

/**
 * 
 * Interfaz CondicionDao para clase Condicion
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface CondicionDAO extends GenericDao<CondicionNoAplica, Long> {

}
