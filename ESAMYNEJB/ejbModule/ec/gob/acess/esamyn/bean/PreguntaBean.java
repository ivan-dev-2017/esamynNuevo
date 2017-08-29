package ec.gob.acess.esamyn.bean;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.constant.CriteriaTypeEnum;
import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;
import com.saviasoft.util.Criteria;

import ec.gob.acess.esamyn.dao.PreguntaDAO;
import ec.gob.acess.esamyn.dto.EncuestaDto;
import ec.gob.acess.esamyn.dto.PreguntaDto;
import ec.gob.acess.esamyn.modelo.Pregunta;

/**
 * 
 * Clase: PreguntaBean.java
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class PreguntaBean extends GenericServiceImpl<Pregunta, Long> {

    @EJB
    private PreguntaDAO preguntaDAO;

    @Override
    public GenericDao<Pregunta, Long> getDao() {
	return preguntaDAO;
    }

    public EncuestaDto obtenerPreguntasFormulario(Long idFormulario, Long IdEncuesta) {

	// TODO BUSCAR ENCUESTA

	EncuestaDto encuesta = new EncuestaDto();

	encuesta.setIdEncuesta(IdEncuesta);
	encuesta.setIdFormulario(idFormulario);

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

	    encuesta.setPregunta(padres);

	    return encuesta;
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

		    PreguntaDto preguntaDto = new PreguntaDto();
		    preguntaDto.setCodigo(p.getCodigo());
		    preguntaDto.setAyuda(p.getAyuda());
		    preguntaDto.setCodigoTipoPregunta(
			    p.getTipoPregunta() != null ? p.getTipoPregunta().getCodigo() : null);
		    preguntaDto.setEtiquetaTipoPregunta(
			    p.getTipoPregunta() != null ? p.getTipoPregunta().getEtiqueta() : null);
		    preguntaDto.setOrden(p.getOrden());
		    preguntaDto.setPrefijo(p.getPrefijo());
		    preguntaDto.setPreguntaLista(null);
		    preguntaDto.setSubfijo(p.getSubfijo());
		    preguntaDto.setTexto(p.getTexto());
		    preguntaDto.setValidacion(p.getValidacion());

		    preguntaDto = llenarHijos(lista, preguntaDto, idFormulario);

		    hijos.add(preguntaDto);
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

		PreguntaDto preguntaDto = new PreguntaDto();
		preguntaDto.setCodigo(p.getCodigo());
		preguntaDto.setAyuda(p.getAyuda());
		preguntaDto.setCodigoTipoPregunta(p.getTipoPregunta() != null ? p.getTipoPregunta().getCodigo() : null);
		preguntaDto.setEtiquetaTipoPregunta(p.getTipoPregunta() != null ? p.getTipoPregunta().getEtiqueta() : null);
		preguntaDto.setOrden(p.getOrden());
		preguntaDto.setPrefijo(p.getPrefijo());
		preguntaDto.setPreguntaLista(null);
		preguntaDto.setSubfijo(p.getSubfijo());
		preguntaDto.setTexto(p.getTexto());
		preguntaDto.setValidacion(p.getValidacion());

		padres.add(preguntaDto);

	    }
	}

	return padres;
    }

}
