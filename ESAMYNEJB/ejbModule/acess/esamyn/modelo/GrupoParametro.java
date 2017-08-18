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
@Table(name = "esa_grupo_parametro")
public class GrupoParametro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "gpa_id")
    private Long gpaId;
    @Column(name = "gpa_texto")
    private String gpaTexto;
    @Column(name = "gpa_clave")
    private String gpaClave;
    @OneToMany(mappedBy = "parGrupoParametro")
    private List<Parametro> parametroList;
    @OneToMany(mappedBy = "gpaPadre")
    private List<GrupoParametro> grupoParametroList;
    @JoinColumn(name = "gpa_padre", referencedColumnName = "gpa_id")
    @ManyToOne
    private GrupoParametro gpaPadre;
    @JoinColumn(name = "gpa_tipo_grupo_parametro", referencedColumnName = "tgp_id")
    @ManyToOne
    private TipoGrupoParametro gpaTipoGrupoParametro;

    public GrupoParametro() {
    }

    public GrupoParametro(Long gpaId) {
        this.gpaId = gpaId;
    }

    public Long getGpaId() {
        return gpaId;
    }

    public void setGpaId(Long gpaId) {
        this.gpaId = gpaId;
    }

    public String getGpaTexto() {
        return gpaTexto;
    }

    public void setGpaTexto(String gpaTexto) {
        this.gpaTexto = gpaTexto;
    }

    public String getGpaClave() {
        return gpaClave;
    }

    public void setGpaClave(String gpaClave) {
        this.gpaClave = gpaClave;
    }

    @XmlTransient
    public List<Parametro> getParametroList() {
        return parametroList;
    }

    public void setParametroList(List<Parametro> parametroList) {
        this.parametroList = parametroList;
    }

    @XmlTransient
    public List<GrupoParametro> getGrupoParametroList() {
        return grupoParametroList;
    }

    public void setGrupoParametroList(List<GrupoParametro> grupoParametroList) {
        this.grupoParametroList = grupoParametroList;
    }

    public GrupoParametro getGpaPadre() {
        return gpaPadre;
    }

    public void setGpaPadre(GrupoParametro gpaPadre) {
        this.gpaPadre = gpaPadre;
    }

    public TipoGrupoParametro getGpaTipoGrupoParametro() {
        return gpaTipoGrupoParametro;
    }

    public void setGpaTipoGrupoParametro(TipoGrupoParametro gpaTipoGrupoParametro) {
        this.gpaTipoGrupoParametro = gpaTipoGrupoParametro;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (gpaId != null ? gpaId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GrupoParametro)) {
            return false;
        }
        GrupoParametro other = (GrupoParametro) object;
        if ((this.gpaId == null && other.gpaId != null) || (this.gpaId != null && !this.gpaId.equals(other.gpaId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.ops.modelo.GrupoParametro[ gpaId=" + gpaId + " ]";
    }
    
}
