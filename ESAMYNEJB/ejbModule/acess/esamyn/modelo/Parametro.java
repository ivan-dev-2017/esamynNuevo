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
import javax.persistence.OneToMany;
import javax.persistence.Table;

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
    @JoinColumn(name = "par_condicion", referencedColumnName = "con_id")
    @ManyToOne
    private Condicion condicion;
    @JoinColumn(name = "par_grupo_parametro", referencedColumnName = "gpa_id")
    @ManyToOne
    private GrupoParametro grupoParametro;
    @JoinColumn(name = "par_pregunta", referencedColumnName = "prg_id")
    @ManyToOne
    private Pregunta pregunta;
    @OneToMany(mappedBy = "verParametro")
    private List<Verificador> verificadorLista;

    public Parametro() {
    }

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

	public Condicion getCondicion() {
		return condicion;
	}

	public void setCondicion(Condicion condicion) {
		this.condicion = condicion;
	}

	public GrupoParametro getGrupoParametro() {
		return grupoParametro;
	}

	public void setGrupoParametro(GrupoParametro grupoParametro) {
		this.grupoParametro = grupoParametro;
	}

	public Pregunta getPregunta() {
		return pregunta;
	}

	public void setPregunta(Pregunta pregunta) {
		this.pregunta = pregunta;
	}

	public List<Verificador> getVerificadorLista() {
		return verificadorLista;
	}

	public void setVerificadorLista(List<Verificador> verificadorLista) {
		this.verificadorLista = verificadorLista;
	}

   
}
