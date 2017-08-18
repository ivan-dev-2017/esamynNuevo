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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_tipo_pregunta")
public class TipoPregunta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "tpp_id")
    private Long tppId;
    @Column(name = "tpp_clave")
    private String tppClave;
    @Column(name = "tpp_etiqueta")
    private String tppEtiqueta;
    @OneToMany(mappedBy = "prgTipoPregunta")
    private List<Pregunta> preguntaList;

    public TipoPregunta() {
    }

    public TipoPregunta(Long tppId) {
        this.tppId = tppId;
    }

    public Long getTppId() {
        return tppId;
    }

    public void setTppId(Long tppId) {
        this.tppId = tppId;
    }

    public String getTppClave() {
        return tppClave;
    }

    public void setTppClave(String tppClave) {
        this.tppClave = tppClave;
    }

    public String getTppEtiqueta() {
        return tppEtiqueta;
    }

    public void setTppEtiqueta(String tppEtiqueta) {
        this.tppEtiqueta = tppEtiqueta;
    }

    @XmlTransient
    public List<Pregunta> getPreguntaList() {
        return preguntaList;
    }

    public void setPreguntaList(List<Pregunta> preguntaList) {
        this.preguntaList = preguntaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tppId != null ? tppId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.TipoPregunta[ tppId=" + tppId + " ]";
    }
    
}
