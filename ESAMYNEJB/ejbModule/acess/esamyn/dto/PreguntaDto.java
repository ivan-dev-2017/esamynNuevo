package acess.esamyn.dto;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

public class PreguntaDto {

	private Long codigo;

	private String texto;

	private String ayuda;

	private String prefijo;

	private String subfijo;

	private String validacion;

	private Integer orden;

	private Long idFormulario;

	private Long codigoTipoPregunta;

	private String etiquetaTipoPregunta;

	private Long codigoRespuesta;

	private Long codigoEncuesta;

	private BigInteger valorNumero;

	private String valorTexto;

	private Date valorFecha;

	private List<PreguntaDto> preguntaLista;

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public String getAyuda() {
		return ayuda;
	}

	public void setAyuda(String ayuda) {
		this.ayuda = ayuda;
	}

	public String getPrefijo() {
		return prefijo;
	}

	public void setPrefijo(String prefijo) {
		this.prefijo = prefijo;
	}

	public String getSubfijo() {
		return subfijo;
	}

	public void setSubfijo(String subfijo) {
		this.subfijo = subfijo;
	}

	public String getValidacion() {
		return validacion;
	}

	public void setValidacion(String validacion) {
		this.validacion = validacion;
	}

	public Integer getOrden() {
		return orden;
	}

	public void setOrden(Integer orden) {
		this.orden = orden;
	}

	public Long getIdFormulario() {
		return idFormulario;
	}

	public void setIdFormulario(Long idFormulario) {
		this.idFormulario = idFormulario;
	}

	public List<PreguntaDto> getPreguntaLista() {
		return preguntaLista;
	}

	public void setPreguntaLista(List<PreguntaDto> preguntaLista) {
		this.preguntaLista = preguntaLista;
	}

	public Long getCodigoTipoPregunta() {
		return codigoTipoPregunta;
	}

	public void setCodigoTipoPregunta(Long codigoTipoPregunta) {
		this.codigoTipoPregunta = codigoTipoPregunta;
	}

	public String getEtiquetaTipoPregunta() {
		return etiquetaTipoPregunta;
	}

	public void setEtiquetaTipoPregunta(String etiquetaTipoPregunta) {
		this.etiquetaTipoPregunta = etiquetaTipoPregunta;
	}

	public Long getCodigoRespuesta() {
		return codigoRespuesta;
	}

	public void setCodigoRespuesta(Long codigoRespuesta) {
		this.codigoRespuesta = codigoRespuesta;
	}

	public Long getCodigoEncuesta() {
		return codigoEncuesta;
	}

	public void setCodigoEncuesta(Long codigoEncuesta) {
		this.codigoEncuesta = codigoEncuesta;
	}

	public BigInteger getValorNumero() {
		return valorNumero;
	}

	public void setValorNumero(BigInteger valorNumero) {
		this.valorNumero = valorNumero;
	}

	public String getValorTexto() {
		return valorTexto;
	}

	public void setValorTexto(String valorTexto) {
		this.valorTexto = valorTexto;
	}

	public Date getValorFecha() {
		return valorFecha;
	}

	public void setValorFecha(Date valorFecha) {
		this.valorFecha = valorFecha;
	}

}
