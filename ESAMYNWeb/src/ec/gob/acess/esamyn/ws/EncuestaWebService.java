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

import ec.gob.acess.esamyn.bean.EncuestaBean;
import ec.gob.acess.esamyn.bean.UsuarioBean;
import ec.gob.acess.esamyn.dto.EcuenstaFiltro;
import ec.gob.acess.esamyn.dto.EliminarDto;
import ec.gob.acess.esamyn.dto.EncuestaDto;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.Encuesta;
import ec.gob.acess.esamyn.modelo.Usuario;

/**
 * 
 * Clase EncuestaWebService.java que publica servicios web objeto Encuesta
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
@Path("/encuesta")
public class EncuestaWebService {

	@EJB
	private UsuarioBean usuarioBean;
	@EJB
	private EncuestaBean encuestaBean;

	/**
	 * Default constructor.
	 */
	public EncuestaWebService() {
		// TODO Auto-generated constructor stub
	}

	@POST
	@Path("filtro")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MensajeDto guardar(EcuenstaFiltro filtro, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);

		MensajeDto mensajeDto;
		try {
			boolean valida = usuarioBean.validaToken(token);

			if (valida) {

				mensajeDto = encuestaBean.buscarPorEstablecimientoFormulario(filtro.getCodigoEstablesimiento(),
						filtro.getCodigoFormulario());

			} else {
				mensajeDto = new MensajeDto(true, "Token invalido", null);
			}

		} catch (Exception e) {
			mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
		}
		return mensajeDto;
	}

	@POST
	@Path("finalizar")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MensajeDto guardar(EncuestaDto encuestaDto, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);

		MensajeDto mensajeDto;
		try {
			boolean valida = usuarioBean.validaToken(token);

			if (valida) {
				mensajeDto = encuestaBean.finalizarEncuesta(encuestaDto, token);

			} else {
				mensajeDto = new MensajeDto(true, "Token invalido", null);
			}

		} catch (Exception e) {
			mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
		}
		return mensajeDto;
	}

	/**
	 * Retorna lista de encuestaes
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

				List<Encuesta> listaEncuestaes = encuestaBean.findAll();
				mensajeDto = new MensajeDto(false, "", listaEncuestaes);

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
	 * @param encuesta
	 * @param headers
	 * @return
	 */
	@POST
	@Path("guardar")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MensajeDto guardar(Encuesta encuesta, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);
		MensajeDto mensajeDto;
		try {
			Usuario usuario = usuarioBean.buscarPorToken(token);

			if (usuario != null) {

				mensajeDto = encuestaBean.guardar(encuesta, usuario);

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

				Encuesta encuesta = encuestaBean.findByPk(codigoObjeto);

				if (encuesta != null) {
					mensajeDto = new MensajeDto(false, "", encuesta);
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
					encuestaBean.delete(eliminar.getCodigo());
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
