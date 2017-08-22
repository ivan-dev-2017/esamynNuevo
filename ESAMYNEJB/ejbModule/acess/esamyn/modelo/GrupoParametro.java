/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_grupo_parametro")
public class GrupoParametro implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "gpa_id")
	private Long codigo;
	@Column(name = "gpa_texto")
	private String texto;
	@Column(name = "gpa_clave")
	private String clave;
	@Transient
	private List<Parametro> parametroList;
	@Transient
	private List<GrupoParametro> grupoParametroLista;
	@JoinColumn(name = "gpa_padre", referencedColumnName = "gpa_id")
	@ManyToOne
	private GrupoParametro padre;
	@JoinColumn(name = "gpa_tipo_grupo_parametro", referencedColumnName = "tgp_id")
	@ManyToOne
	private TipoGrupoParametro tipoGrupoParametro;

	public GrupoParametro() {
	}

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

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public List<Parametro> getParametroList() {
		return parametroList;
	}

	public void setParametroList(List<Parametro> parametroList) {
		this.parametroList = parametroList;
	}

	public List<GrupoParametro> getGrupoParametroLista() {
		return grupoParametroLista;
	}

	public void setGrupoParametroLista(List<GrupoParametro> grupoParametroLista) {
		this.grupoParametroLista = grupoParametroLista;
	}

	public GrupoParametro getPadre() {
		return padre;
	}

	public void setPadre(GrupoParametro padre) {
		this.padre = padre;
	}

	public TipoGrupoParametro getTipoGrupoParametro() {
		return tipoGrupoParametro;
	}

	public void setTipoGrupoParametro(TipoGrupoParametro tipoGrupoParametro) {
		this.tipoGrupoParametro = tipoGrupoParametro;
	}

}
