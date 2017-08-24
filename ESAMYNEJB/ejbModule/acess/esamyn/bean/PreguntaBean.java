package acess.esamyn.bean;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.constant.CriteriaTypeEnum;
import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;
import com.saviasoft.util.Criteria;

import acess.esamyn.dao.PreguntaDAO;
import acess.esamyn.dto.PreguntaDto;
import acess.esamyn.modelo.Pregunta;

@Stateless
@LocalBean
public class PreguntaBean extends GenericServiceImpl<Pregunta, Long> {

	@EJB
	private PreguntaDAO preguntaDAO;

	@Override
	public GenericDao<Pregunta, Long> getDao() {
		return preguntaDAO;
	}

	public List<PreguntaDto> obtenerPreguntasFormulario(Long idFormulario) {

		String[] ands = { "formulario.codigo" };
		CriteriaTypeEnum[] operator = { CriteriaTypeEnum.LONG_EQUALS };
		Object[] valores = { idFormulario };
		String[] orderby = { "orden" };
		boolean[] asc = { true };

		Criteria criteria = new Criteria(ands, operator, valores, orderby, asc);

		List<Pregunta> lista = findByCriterias(criteria);

		if (lista != null && !lista.isEmpty()) {
			List<PreguntaDto> padres = buscarRaiz(lista, idFormulario);

			for (PreguntaDto pregunta : padres) {
				pregunta = llenarHijos(lista, pregunta, idFormulario);
			}

			return padres;
		}

		return null;

	}

	private PreguntaDto llenarHijos(List<Pregunta> lista, PreguntaDto padre, Long idFormulario) {

		List<PreguntaDto> hijos = new ArrayList<>();

		// Respuesta r = new Respuesta();
		// Buscar respuestas formularios
		// padre.setRespuesta(r);

		for (Pregunta p : lista) {

			if (!p.getCodigo().equals(padre.getCodigo()) && p.getPadre() != null) {
				if (p.getPadre().getCodigo().equals(padre.getCodigo())) {

					PreguntaDto dto = new PreguntaDto();
					dto.setCodigo(p.getCodigo());
					dto.setAyuda(p.getAyuda());
					dto.setCodigoTipoPregunta(p.getTipoPregunta() != null ? p.getTipoPregunta().getCodigo() : null);
					dto.setEtiquetaTipoPregunta(p.getTipoPregunta() != null ? p.getTipoPregunta().getEtiqueta() : null);
					dto.setIdFormulario(idFormulario);
					dto.setOrden(p.getOrden());
					dto.setPrefijo(p.getPrefijo());
					dto.setPreguntaLista(null);
					dto.setSubfijo(p.getSubfijo());
					dto.setTexto(p.getTexto());
					dto.setValidacion(p.getValidacion());

					dto = llenarHijos(lista, dto, idFormulario);

					hijos.add(dto);
				}
			}

		}

		if (!hijos.isEmpty()) {
			padre.setPreguntaLista(hijos);
		} else {
			padre.setPreguntaLista(null);
		}

		return padre;

	}

	private List<PreguntaDto> buscarRaiz(List<Pregunta> lista, Long idFormulario) {

		List<PreguntaDto> padres = new ArrayList<>();

		for (Pregunta p : lista) {

			if (p.getPadre() == null) {

				PreguntaDto dto = new PreguntaDto();
				dto.setCodigo(p.getCodigo());
				dto.setAyuda(p.getAyuda());
				dto.setCodigoTipoPregunta(p.getTipoPregunta() != null ? p.getTipoPregunta().getCodigo() : null);
				dto.setEtiquetaTipoPregunta(p.getTipoPregunta() != null ? p.getTipoPregunta().getEtiqueta() : null);
				dto.setIdFormulario(idFormulario);
				dto.setOrden(p.getOrden());
				dto.setPrefijo(p.getPrefijo());
				dto.setPreguntaLista(null);
				dto.setSubfijo(p.getSubfijo());
				dto.setTexto(p.getTexto());
				dto.setValidacion(p.getValidacion());

				padres.add(dto);

			}
		}

		return padres;
	}

}
