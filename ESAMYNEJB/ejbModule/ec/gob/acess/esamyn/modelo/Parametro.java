package ec.gob.acess.esamyn.modelo;

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
@Table(name = "esa_parametro")
public class Parametro implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "par_id")
	private Long codigo;
	@Column(name = "par_puntaje")
	private Integer puntaje;
	@Column(name = "par_texto")
	private String texto;
	@Basic(optional = false)
	@Column(name = "par_obligatorio")
	private int obligatorio;
	@Basic(optional = false)
	@Column(name = "par_umbral")
	private int umbral;
	@Basic(optional = false)
	@Column(name = "par_cantidad_minima")
	private int cantidadMinima;
	@JoinColumn(name = "par_condicion_na", referencedColumnName = "cna_id")
	@ManyToOne
	private CondicionNa condicionNa;
	@JoinColumn(name = "par_grupo_parametro", referencedColumnName = "gpa_id")
	@ManyToOne
	private GrupoParametro grupoParametro;
	@Transient
	private List<Verificador> verificadorList;
	@Transient
	private List<ParametroPregunta> parametroPreguntaList;

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Integer getPuntaje() {
		return puntaje;
	}

	public void setPuntaje(Integer puntaje) {
		this.puntaje = puntaje;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public int getObligatorio() {
		return obligatorio;
	}

	public void setObligatorio(int obligatorio) {
		this.obligatorio = obligatorio;
	}

	public int getUmbral() {
		return umbral;
	}

	public void setUmbral(int umbral) {
		this.umbral = umbral;
	}

	public int getCantidadMinima() {
		return cantidadMinima;
	}

	public void setCantidadMinima(int cantidadMinima) {
		this.cantidadMinima = cantidadMinima;
	}

	public CondicionNa getCondicionNa() {
		return condicionNa;
	}

	public void setCondicionNa(CondicionNa condicionNa) {
		this.condicionNa = condicionNa;
	}

	public GrupoParametro getGrupoParametro() {
		return grupoParametro;
	}

	public void setGrupoParametro(GrupoParametro grupoParametro) {
		this.grupoParametro = grupoParametro;
	}

	public List<Verificador> getVerificadorList() {
		return verificadorList;
	}

	public void setVerificadorList(List<Verificador> verificadorList) {
		this.verificadorList = verificadorList;
	}

	public List<ParametroPregunta> getParametroPreguntaList() {
		return parametroPreguntaList;
	}

	public void setParametroPreguntaList(List<ParametroPregunta> parametroPreguntaList) {
		this.parametroPreguntaList = parametroPreguntaList;
	}

}
