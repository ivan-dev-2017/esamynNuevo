
package ec.gob.acess.esamyn.bean;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.constant.CriteriaTypeEnum;
import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;
import com.saviasoft.util.Criteria;

import ec.gob.acess.esamyn.constante.CatalogoEnum;
import ec.gob.acess.esamyn.dao.CatalogoDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.Catalogo;

/**
 * 
 * Clase que maneja la logica de clase Catalago
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
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

	public MensajeDto guardar(Catalogo catalogo) {
		MensajeDto mensajeDto = new MensajeDto();

		try {

			if (catalogo.getCodigo() == null) {

				mensajeDto.setError(false);
				mensajeDto.setMensaje("Catalago Guardado");
				create(catalogo);
				mensajeDto.setObjeto(catalogo);
			} else {
				mensajeDto.setError(false);
				mensajeDto.setMensaje("Actualiza Objeto");
				update(catalogo);
				mensajeDto.setObjeto(catalogo);
			}

		} catch (Exception e) {
			mensajeDto.setError(true);
			mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
			mensajeDto.setObjeto(null);

		}
		return mensajeDto;

	}

	public Catalogo buscarPorIdentificador(CatalogoEnum catalogoEnum) {

		String[] ands = { "identificador" };
		CriteriaTypeEnum[] operator = { CriteriaTypeEnum.STRING_EQUALS };
		Object[] valores = { catalogoEnum.toString() };

		Criteria criteria = new Criteria(ands, operator, valores);

		List<Catalogo> lista = findByCriterias(criteria);

		if (lista != null && !lista.isEmpty()) {
			return lista.get(0);
		}

		return null;
	}

}
