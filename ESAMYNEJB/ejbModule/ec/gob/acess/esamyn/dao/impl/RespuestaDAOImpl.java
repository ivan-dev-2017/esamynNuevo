package ec.gob.acess.esamyn.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.RespuestaDAO;
import ec.gob.acess.esamyn.dto.RespuestaDto;
import ec.gob.acess.esamyn.modelo.Respuesta;

/**
 * 
 * Implementación de la Interfaz RespuestaDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class RespuestaDAOImpl extends GenericEmDaoEjb<Respuesta, Long> implements RespuestaDAO {

    @PersistenceContext(unitName = "esamyn-pu")
    private EntityManager em;

    @Override
    protected EntityManager getEm() {
	return em;
    }

    public RespuestaDAOImpl() {
	super(Respuesta.class);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * ec.gob.acess.esamyn.dao.RespuestaDAO#getRespuestasParaEvaluar(java.lang.Long,
     * java.util.List, java.lang.Integer)
     */
    @Override
    public List<Respuesta> getRespuestasParaEvaluar(Long codigoEstablecimientoSalud, List<Long> codigoPreguntaList,
	    Integer anio) {
	StringBuffer hql = new StringBuffer(200);
	hql.append("select r from Respuesta r inner join r.pregunta p ");
	hql.append("where r.encuesta.establecimientoSalud.codigo = :codigoEstablecimientoSalud ");
	hql.append("and p.codigo in (:codigosPreguntas) ");
	hql.append("and year(r.encuesta.fechaInicial) = :anio ");
	hql.append("and r.encuesta.finalizada = 1 ");

	Query query = em.createQuery(hql.toString());
	query.setParameter("codigoEstablecimientoSalud", codigoEstablecimientoSalud);
	query.setParameter("codigosPreguntas", codigoPreguntaList);
	query.setParameter("anio", anio);

	return query.getResultList();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<RespuestaDto> respuestasParaReporte(Long idFormulario, Long idEstablecimiento) {

	StringBuffer sql = new StringBuffer(200);
	sql.append(" SELECT r.res_id, r.res_pregunta, r.res_valor_numero, r.res_valor_texto,");
	sql.append(" r.res_valor_fecha, r.res_valor_booleano, e.enc_id, es.ess_unicodigo, ");
	sql.append(" ev.eva_numero, e.enc_responsable, e.enc_cargo, u.usu_nombres||' '||u.usu_apellidos,");
	sql.append(" ev.eva_fecha_inicio, e.enc_fecha_inicial, e.enc_finalizada");
	sql.append(" FROM esamyn.esa_respuesta r");
	sql.append(" INNER JOIN esamyn.esa_encuesta e ON e.enc_id = r. res_encuesta");
	sql.append(" INNER JOIN esamyn.esa_establecimiento_salud es on es.ess_id = e.enc_establecimiento_salud");
	sql.append(" INNER JOIN esamyn.esa_usuario u ON u.usu_username = e.enc_creado_por");
	sql.append(" INNER JOIN esamyn.esa_evaluacion ev ON ev.eva_id = e.enc_evaluacion");
	sql.append(" WHERE enc_formulario = :formulario");
	if (idEstablecimiento != null) {
	    sql.append(" AND enc_establecimiento_salud = :establecimiento");
	}

	Query query = em.createNativeQuery(sql.toString());
	query.setParameter("formulario", idFormulario);
	if (idEstablecimiento != null) {
	    query.setParameter("establecimiento", idEstablecimiento);
	}

	List<Object[]> lista = query.getResultList();

	if (lista != null && !lista.isEmpty()) {

	    List<RespuestaDto> listaRespuesta = new ArrayList<>();

	    for (Object[] objeto : lista) {

		RespuestaDto respuestaDto = new RespuestaDto();
		respuestaDto.setIdRespuesta(objeto[0] != null ? Long.parseLong(objeto[0].toString()) : null);
		respuestaDto.setIdPregunta(objeto[1] != null ? Long.parseLong(objeto[1].toString()) : null);

		if (objeto[2] != null) {
		    respuestaDto.setRespuesta(objeto[2].toString());
		} else {
		    if (objeto[3] != null) {
			respuestaDto.setRespuesta(objeto[3].toString());
		    } else {
			if (objeto[4] != null) {
			    respuestaDto.setRespuesta(objeto[4].toString());
			} else {

			    if (objeto[5] != null ? Boolean.parseBoolean(objeto[5].toString()) : false) {
				respuestaDto.setRespuesta("SI");
			    } else {
				respuestaDto.setRespuesta("NO");
			    }

			}
		    }
		}

		respuestaDto.setUnicodigo(objeto[7] != null ? objeto[7].toString() : null);

		respuestaDto.setSecuencial(objeto[8] != null ? Long.parseLong(objeto[8].toString()) : null);

		respuestaDto.setResponsable(objeto[9] != null ? objeto[9].toString() : null);

		respuestaDto.setCargo(objeto[10] != null ? objeto[10].toString() : null);

		respuestaDto.setCreadoPor(objeto[11] != null ? objeto[11].toString() : null);

		respuestaDto.setFechaEvaluacion(objeto[12] != null ? objeto[12].toString() : "2000-01-01");

		respuestaDto.setFechaEncuesta(objeto[13] != null ? objeto[13].toString() : "2000-01-01");

		if (objeto[14] != null ? Boolean.parseBoolean(objeto[14].toString()) : false) {
		    respuestaDto.setFinalizada("SI");
		} else {
		    respuestaDto.setFinalizada("NO");
		}
		
		listaRespuesta.add(respuestaDto);

	    }

	    
	    return listaRespuesta;
	}

	return null;
    }

}
