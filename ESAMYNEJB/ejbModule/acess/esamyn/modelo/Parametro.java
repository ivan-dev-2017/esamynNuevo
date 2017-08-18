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
import javax.xml.bind.annotation.XmlTransient;

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
    private Long parId;
    @Column(name = "par_puntaje")
    private Integer parPuntaje;
    @Column(name = "par_texto")
    private String parTexto;
    @Basic(optional = false)
    @Column(name = "par_obligatorio")
    private int parObligatorio;
    @Basic(optional = false)
    @Column(name = "par_umbral")
    private int parUmbral;
    @Basic(optional = false)
    @Column(name = "par_cantidad_minima")
    private int parCantidadMinima;
    @JoinColumn(name = "par_condicion", referencedColumnName = "con_id")
    @ManyToOne
    private Condicion parCondicion;
    @JoinColumn(name = "par_grupo_parametro", referencedColumnName = "gpa_id")
    @ManyToOne
    private GrupoParametro parGrupoParametro;
    @JoinColumn(name = "par_pregunta", referencedColumnName = "prg_id")
    @ManyToOne
    private Pregunta parPregunta;
    @OneToMany(mappedBy = "verParametro")
    private List<Verificador> verificadorList;

    public Parametro() {
    }

    public Parametro(Long parId) {
        this.parId = parId;
    }

    public Parametro(Long parId, int parObligatorio, int parUmbral, int parCantidadMinima) {
        this.parId = parId;
        this.parObligatorio = parObligatorio;
        this.parUmbral = parUmbral;
        this.parCantidadMinima = parCantidadMinima;
    }

    public Long getParId() {
        return parId;
    }

    public void setParId(Long parId) {
        this.parId = parId;
    }

    public Integer getParPuntaje() {
        return parPuntaje;
    }

    public void setParPuntaje(Integer parPuntaje) {
        this.parPuntaje = parPuntaje;
    }

    public String getParTexto() {
        return parTexto;
    }

    public void setParTexto(String parTexto) {
        this.parTexto = parTexto;
    }

    public int getParObligatorio() {
        return parObligatorio;
    }

    public void setParObligatorio(int parObligatorio) {
        this.parObligatorio = parObligatorio;
    }

    public int getParUmbral() {
        return parUmbral;
    }

    public void setParUmbral(int parUmbral) {
        this.parUmbral = parUmbral;
    }

    public int getParCantidadMinima() {
        return parCantidadMinima;
    }

    public void setParCantidadMinima(int parCantidadMinima) {
        this.parCantidadMinima = parCantidadMinima;
    }

    public Condicion getParCondicion() {
        return parCondicion;
    }

    public void setParCondicion(Condicion parCondicion) {
        this.parCondicion = parCondicion;
    }

    public GrupoParametro getParGrupoParametro() {
        return parGrupoParametro;
    }

    public void setParGrupoParametro(GrupoParametro parGrupoParametro) {
        this.parGrupoParametro = parGrupoParametro;
    }

    public Pregunta getParPregunta() {
        return parPregunta;
    }

    public void setParPregunta(Pregunta parPregunta) {
        this.parPregunta = parPregunta;
    }

    @XmlTransient
    public List<Verificador> getVerificadorList() {
        return verificadorList;
    }

    public void setVerificadorList(List<Verificador> verificadorList) {
        this.verificadorList = verificadorList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (parId != null ? parId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.Parametro[ parId=" + parId + " ]";
    }
    
}
