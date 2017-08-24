/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_catalogo")
public class Catalogo implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "cat_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "cat_creado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creado;
	@Basic(optional = false)
	@Column(name = "cat_modificado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificado;
	@Basic(optional = false)
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

	public Date getCreado() {
		return creado;
	}

	public void setCreado(Date creado) {
		this.creado = creado;
	}

	public Date getModificado() {
		return modificado;
	}

	public void setModificado(Date modificado) {
		this.modificado = modificado;
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
