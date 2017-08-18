/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_usuario")
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "usu_id")
    private Long usuId;
    @Basic(optional = false)
    @Column(name = "usu_creado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date usuCreado;
    @Basic(optional = false)
    @Column(name = "usu_modificado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date usuModificado;
    @Column(name = "usu_nombres")
    private String usuNombres;
    @Column(name = "usu_apellidos")
    private String usuApellidos;
    @Column(name = "usu_username")
    private String usuUsername;
    @Column(name = "usu_password")
    private String usuPassword;
    @Basic(optional = false)
    @Column(name = "usu_bloqueado")
    private int usuBloqueado;
    @Column(name = "usu_cedula")
    private String usuCedula;
    @Column(name = "usu_telefono")
    private String usuTelefono;
    @Column(name = "usu_correo_eletronico")
    private String usuCorreoEletronico;
    @JoinColumn(name = "usu_rol", referencedColumnName = "rol_id")
    @ManyToOne
    private Rol usuRol;
    @OneToMany(mappedBy = "evaUsuario")
    private List<Evaluacion> evaluacionList;
    @OneToMany(mappedBy = "encUsuario")
    private List<Encuesta> encuestaList;

    public Usuario() {
    }

    public Usuario(Long usuId) {
        this.usuId = usuId;
    }

    public Usuario(Long usuId, Date usuCreado, Date usuModificado, int usuBloqueado) {
        this.usuId = usuId;
        this.usuCreado = usuCreado;
        this.usuModificado = usuModificado;
        this.usuBloqueado = usuBloqueado;
    }

    public Long getUsuId() {
        return usuId;
    }

    public void setUsuId(Long usuId) {
        this.usuId = usuId;
    }

    public Date getUsuCreado() {
        return usuCreado;
    }

    public void setUsuCreado(Date usuCreado) {
        this.usuCreado = usuCreado;
    }

    public Date getUsuModificado() {
        return usuModificado;
    }

    public void setUsuModificado(Date usuModificado) {
        this.usuModificado = usuModificado;
    }

    public String getUsuNombres() {
        return usuNombres;
    }

    public void setUsuNombres(String usuNombres) {
        this.usuNombres = usuNombres;
    }

    public String getUsuApellidos() {
        return usuApellidos;
    }

    public void setUsuApellidos(String usuApellidos) {
        this.usuApellidos = usuApellidos;
    }

    public String getUsuUsername() {
        return usuUsername;
    }

    public void setUsuUsername(String usuUsername) {
        this.usuUsername = usuUsername;
    }

    public String getUsuPassword() {
        return usuPassword;
    }

    public void setUsuPassword(String usuPassword) {
        this.usuPassword = usuPassword;
    }

    public int getUsuBloqueado() {
        return usuBloqueado;
    }

    public void setUsuBloqueado(int usuBloqueado) {
        this.usuBloqueado = usuBloqueado;
    }

    public String getUsuCedula() {
        return usuCedula;
    }

    public void setUsuCedula(String usuCedula) {
        this.usuCedula = usuCedula;
    }

    public String getUsuTelefono() {
        return usuTelefono;
    }

    public void setUsuTelefono(String usuTelefono) {
        this.usuTelefono = usuTelefono;
    }

    public String getUsuCorreoEletronico() {
        return usuCorreoEletronico;
    }

    public void setUsuCorreoEletronico(String usuCorreoEletronico) {
        this.usuCorreoEletronico = usuCorreoEletronico;
    }

    public Rol getUsuRol() {
        return usuRol;
    }

    public void setUsuRol(Rol usuRol) {
        this.usuRol = usuRol;
    }

    @XmlTransient
    public List<Evaluacion> getEvaluacionList() {
        return evaluacionList;
    }

    public void setEvaluacionList(List<Evaluacion> evaluacionList) {
        this.evaluacionList = evaluacionList;
    }

    @XmlTransient
    public List<Encuesta> getEncuestaList() {
        return encuestaList;
    }

    public void setEncuestaList(List<Encuesta> encuestaList) {
        this.encuestaList = encuestaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (usuId != null ? usuId.hashCode() : 0);
        return hash;
    }


    @Override
    public String toString() {
        return "org.ops.modelo.Usuario[ usuId=" + usuId + " ]";
    }
    
}
