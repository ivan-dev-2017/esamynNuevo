package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_provincia
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_provincia")
public class Provincia implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "pro_id")
	private Long codigo;
	@Column(name = "pro_nombre")
	private String nombre;
	@Column(name = "pro_codigo")
	private String codigoInen;

	public Provincia() {
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCodigoInen() {
		return codigoInen;
	}

	public void setCodigoInen(String codigoInen) {
		this.codigoInen = codigoInen;
	}

}
