package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_catalogo
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_catalogo")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "catalogo")
public class Catalogo implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "cat_id")
	private Long codigo;

	@Column(name = "cat_codigo")
	private String identificador;
	@Basic(optional = false)
	@Column(name = "cat_valor")
	private String valor;

	public Catalogo() {
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getIdentificador() {
		return identificador;
	}

	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}
