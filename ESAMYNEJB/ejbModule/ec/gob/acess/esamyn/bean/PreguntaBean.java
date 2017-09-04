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
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.dto.PreguntaDto;
import ec.gob.acess.esamyn.modelo.Encuesta;
import ec.gob.acess.esamyn.modelo.Pregunta;
import ec.gob.acess.esamyn.modelo.Respuesta;

/**
 * 
 * Clase que maneja la logica de clase Pregunta
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class PreguntaBean extends GenericServiceImpl<Pregunta, Long> {

    @EJB
    private PreguntaDAO preguntaDAO;
    @EJB
    private EncuestaBean encuestaBean;
    @EJB
    private RespuestaBean respuestaBean;

    @Override
    public GenericDao<Pregunta, Long> getDao() {
	return preguntaDAO;
    }

    /**
     * Guarda una encuesta y respuestas por Pregunta
     * 
     * @param encuestaDto
     * @return
     */
    public MensajeDto guardarEncuesta(EncuestaDto encuestaDto) {

	MensajeDto mensajeDto;

	List<Respuesta> respuestas = respuestaBean.buscarPorEncuesta(encuestaDto.getIdEncuesta());

	for (PreguntaDto preguntaDto : encuestaDto.getPregunta()) {

	    
	    //validar hijos
	}

	mensajeDto = new MensajeDto(true, "Estamos trabajadno", null);

	return mensajeDto;
    }

    /**
     * 
     * @param idFormulario
     * @param IdEncuesta
     * @return
     */
    public EncuestaDto obtenerPreguntasFormulario(Long idFormulario, Long IdEncuesta) {

	Encuesta encuesta = null;

	if (IdEncuesta != null) {
	    encuesta = encuestaBean.findByPk(IdEncuesta);
	}

	List<Respuesta> respuestas = null;

	if (encuesta != null) {
	    respuestas = respuestaBean.buscarPorEncuesta(IdEncuesta);
	}

	String[] ands = { "formulario.codigo" };
	CriteriaTypeEnum[] operator = { CriteriaTypeEnum.LONG_EQUALS };
	Object[] valores = { idFormulario };
	String[] orderby = { "orden" };
	boolean[] asc = { true };

	Criteria criteria = new Criteria(ands, operator, valores, orderby, asc);

	List<Pregunta> lista = findByCriterias(criteria);

	if (lista != null && !lista.isEmpty()) {
	    List<PreguntaDto> padres = buscarRaiz(lista, idFormulario, respuestas);

	    for (PreguntaDto pregunta : padres) {
		pregunta = llenarHijos(lista, pregunta, idFormulario, respuestas);
	    }

	    EncuestaDto encuestaDto = new EncuestaDto();

	    encuestaDto.setIdEncuesta(IdEncuesta);
	    encuestaDto.setIdFormulario(idFormulario);

	    encuestaDto.setPregunta(padres);

	    return encuestaDto;
	}

	return null;

    }

    private PreguntaDto llenarHijos(List<Pregunta> lista, PreguntaDto padre, Long idFormulario,
	    List<Respuesta> respuestas) {

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
		    preguntaDto = llenarRespuestas(respuestas, preguntaDto);

		    preguntaDto = llenarHijos(lista, preguntaDto, idFormulario, respuestas);

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

    private List<PreguntaDto> buscarRaiz(List<Pregunta> lista, Long idFormulario, List<Respuesta> respuestas) {

	List<PreguntaDto> padres = new ArrayList<>();

	for (Pregunta pregunta : lista) {

	    if (pregunta.getPadre() == null) {

		PreguntaDto preguntaDto = new PreguntaDto();
		preguntaDto.setCodigo(pregunta.getCodigo());
		preguntaDto.setAyuda(pregunta.getAyuda());
		preguntaDto.setCodigoTipoPregunta(
			pregunta.getTipoPregunta() != null ? pregunta.getTipoPregunta().getCodigo() : null);
		preguntaDto.setEtiquetaTipoPregunta(
			pregunta.getTipoPregunta() != null ? pregunta.getTipoPregunta().getEtiqueta() : null);
		preguntaDto.setOrden(pregunta.getOrden());
		preguntaDto.setPrefijo(pregunta.getPrefijo());
		preguntaDto.setPreguntaLista(null);
		preguntaDto.setSubfijo(pregunta.getSubfijo());
		preguntaDto.setTexto(pregunta.getTexto());
		preguntaDto.setValidacion(pregunta.getValidacion());

		preguntaDto = llenarRespuestas(respuestas, preguntaDto);

		padres.add(preguntaDto);

	    }
	}

	return padres;
    }

    private PreguntaDto llenarRespuestas(List<Respuesta> respuestas, PreguntaDto preguntaDto) {

	if (respuestas != null && !respuestas.isEmpty()) {
	    for (Respuesta respuesta : respuestas) {

		if (respuesta.getPregunta().getCodigo().equals(preguntaDto.getCodigo())) {
		    preguntaDto.setCodigoEncuesta(respuesta.getEncuesta().getCodigo());
		    preguntaDto.setCodigoRespuesta(respuesta.getCodigo());
		    preguntaDto.setValorBooleano(respuesta.getValorBooleano());
		    preguntaDto.setValorFecha(respuesta.getValorFecha());
		    preguntaDto.setValorNumero(respuesta.getValorNumero());
		    preguntaDto.setValorTexto(respuesta.getValorTexto());

		}

	    }
	}

	return preguntaDto;

    }

    /**
     * Edita texto de pregunta
     * 
     * @param codigo
     * @param textoPregunta
     * @return
     */
    public MensajeDto editarTextoPregunta(Long codigo, String textoPregunta) {
	MensajeDto mensajeDto;

	Pregunta pregunta = findByPk(codigo);

	if (pregunta != null) {

	    pregunta.setTexto(textoPregunta);
	    update(pregunta);

	    mensajeDto = new MensajeDto(false, "Actualiza Objeto", pregunta);

	} else {
	    mensajeDto = new MensajeDto(true, "No existe pregunta para el id: " + codigo, null);
	}

	return mensajeDto;
    }

}
