package ec.gob.acess.esamyn.ws;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;

import ec.gob.acess.esamyn.bean.CumpleCondicionNoAplicaBean;
import ec.gob.acess.esamyn.bean.UsuarioBean;
import ec.gob.acess.esamyn.dto.EliminarDto;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.CumpleCondicionNoAplica;

/**
 * 
 * Clase CumpleCondicionNoAplicaWebService.java que publica servicios web objeto
 * CumpleCondicionNoAplica
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
@Path("/cumpleCondicionNoAplica")
public class CumpleCondicionNoAplicaWebService {

	@EJB
	private UsuarioBean usuarioBean;
	@EJB
	private CumpleCondicionNoAplicaBean cumpleCondicionNoAplicaBean;

	/**
	 * Default constructor.
	 */
	public CumpleCondicionNoAplicaWebService() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * Retorna lista de cumpleCondicionNoAplicaes
	 * 
	 * @param headers
	 * @return
	 */
	@GET
	@Path("todos")
	@Produces(MediaType.APPLICATION_JSON)
	public MensajeDto todos(@Context HttpHeaders headers) {

		MensajeDto mensajeDto;
		String token = headers.getRequestHeader("ApiToken").get(0);

		try {
			boolean valida = usuarioBean.validaToken(token);

			if (valida) {

				List<CumpleCondicionNoAplica> listaCondicionNoAplicaes = cumpleCondicionNoAplicaBean.findAll();
				mensajeDto = new MensajeDto(false, "", listaCondicionNoAplicaes);

			} else {
				mensajeDto = new MensajeDto(true, "Token invalido", null);
			}

		} catch (Exception e) {
			mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
		}
		return mensajeDto;
	}

	/**
	 * Metodo que guarda y actualiza
	 * 
	 * @param cumpleCondicionNoAplica
	 * @param headers
	 * @return
	 */
	@POST
	@Path("guardar")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MensajeDto guardar(CumpleCondicionNoAplica cumpleCondicionNoAplica, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);
		MensajeDto mensajeDto;
		try {
			boolean valida = usuarioBean.validaToken(token);

			if (valida) {

				mensajeDto = cumpleCondicionNoAplicaBean.guardar(cumpleCondicionNoAplica);

			} else {
				mensajeDto = new MensajeDto(true, "Token invalido", null);
			}
		} catch (Exception e) {
			mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
		}
		return mensajeDto;
	}

	/**
	 * Busca por codigo de objeto
	 * 
	 * @param codigo
	 * @param headers
	 * @return
	 */
	@GET
	@Path("buscar/{codigo}")
	@Produces(MediaType.APPLICATION_JSON)
	public MensajeDto buscar(@PathParam("codigo") String codigo, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);

		MensajeDto mensajeDto;
		boolean valida;
		try {

			Long codigoObjeto = Long.parseLong(codigo);

			valida = usuarioBean.validaToken(token);

			if (valida) {

				CumpleCondicionNoAplica cumpleCondicionNoAplica = cumpleCondicionNoAplicaBean.findByPk(codigoObjeto);

				if (cumpleCondicionNoAplica != null) {
					mensajeDto = new MensajeDto(false, "", cumpleCondicionNoAplica);
				} else {
					mensajeDto = new MensajeDto(true, "No se encuentra objeto con código " + codigo, null);
				}

			} else {
				mensajeDto = new MensajeDto(true, "Token invalido", null);
			}
		} catch (Exception e) {
			mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
		}
		return mensajeDto;
	}

	/**
	 * Elimina objeto
	 * 
	 * @param eliminar
	 * @param headers
	 * @return
	 */
	@DELETE
	@Path("eliminar")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MensajeDto eliminar(EliminarDto eliminar, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);

		MensajeDto mensajeDto;
		boolean valida;
		try {
			valida = usuarioBean.validaToken(token);

			if (valida) {
				try {
					cumpleCondicionNoAplicaBean.delete(eliminar.getCodigo());
					mensajeDto = new MensajeDto(false, "Objeto eliminado", null);
				} catch (Exception e) {
					mensajeDto = new MensajeDto(true, "No se puede eliminar " + e.getMessage(), null);
				}

			} else {
				mensajeDto = new MensajeDto(true, "Token invalido", null);
			}
		} catch (Exception e) {
			mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
		}
		return mensajeDto;
	}

}
