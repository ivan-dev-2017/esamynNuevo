package ec.gob.acess.esamyn.dao;

import javax.ejb.Local;
import com.saviasoft.persistence.util.dao.GenericDao;
import ec.gob.acess.esamyn.modelo.Provincia;

/**
 * 
 * Interfaz ProvinciaDAO para clase Provincia
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface ProvinciaDAO extends GenericDao<Provincia, Long> {

}
