package ec.gob.acess.esamyn.modelo;

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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_encuesta
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_encuesta")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "encuesta")
public class Encuesta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "enc_id")
    private Long codigo;

    @Column(name = "enc_creado_por")
    @XmlTransient
    private String creadoPor;
    @Column(name = "enc_modificado_por")
    @XmlTransient
    private String modificadoPor;
    @Basic(optional = false)
    @Column(name = "enc_finalizada")
    @XmlTransient
    private int finalizada;
    @Basic(optional = false)
    @Column(name = "enc_fecha_inicial")
    @Temporal(TemporalType.TIMESTAMP)
    @XmlTransient
    private Date fechaInicial;
    @Column(name = "enc_fecha_final")
    @Temporal(TemporalType.TIMESTAMP)
    @XmlTransient
    private Date fechaFinal;
    @Column(name = "enc_responsable")
    private String responsable;
    @Column(name = "enc_cargo")
    private String cargo;
    @Column(name = "enc_extra")
    private String extra;
    @Transient
    @XmlTransient
    private List<Respuesta> respuestaLista;
    @JoinColumn(name = "enc_establecimiento_salud", referencedColumnName = "ess_id")
    @ManyToOne
    private EstablecimientoSalud establecimientoSalud;
    @JoinColumn(name = "enc_evaluacion", referencedColumnName = "eva_id")
    @ManyToOne
    @XmlTransient
    private Evaluacion evaluacion;
    @JoinColumn(name = "enc_formulario", referencedColumnName = "frm_id")
    @ManyToOne
    private Formulario formulario;
    @JoinColumn(name = "enc_usuario", referencedColumnName = "usu_id")
    @ManyToOne
    @XmlTransient
    private Usuario usuario;

    public Long getCodigo() {
	return codigo;
    }

    public void setCodigo(Long codigo) {
	this.codigo = codigo;
    }

    public String getCreadoPor() {
	return creadoPor;
    }

    public void setCreadoPor(String creadoPor) {
	this.creadoPor = creadoPor;
    }

    public String getModificadoPor() {
	return modificadoPor;
    }

    public void setModificadoPor(String modificadoPor) {
	this.modificadoPor = modificadoPor;
    }

    public int getFinalizada() {
	return finalizada;
    }

    public void setFinalizada(int finalizada) {
	this.finalizada = finalizada;
    }

    public Date getFechaInicial() {
	return fechaInicial;
    }

    public void setFechaInicial(Date fechaInicial) {
	this.fechaInicial = fechaInicial;
    }

    public Date getFechaFinal() {
	return fechaFinal;
    }

    public void setFechaFinal(Date fechaFinal) {
	this.fechaFinal = fechaFinal;
    }

    public String getResponsable() {
	return responsable;
    }

    public void setResponsable(String responsable) {
	this.responsable = responsable;
    }

    public String getCargo() {
	return cargo;
    }

    public void setCargo(String cargo) {
	this.cargo = cargo;
    }

    public String getExtra() {
	return extra;
    }

    public void setExtra(String extra) {
	this.extra = extra;
    }

    public List<Respuesta> getRespuestaLista() {
	return respuestaLista;
    }

    public void setRespuestaLista(List<Respuesta> respuestaLista) {
	this.respuestaLista = respuestaLista;
    }

    public EstablecimientoSalud getEstablecimientoSalud() {
	return establecimientoSalud;
    }

    public void setEstablecimientoSalud(EstablecimientoSalud establecimientoSalud) {
	this.establecimientoSalud = establecimientoSalud;
    }

    public Evaluacion getEvaluacion() {
	return evaluacion;
    }

    public void setEvaluacion(Evaluacion evaluacion) {
	this.evaluacion = evaluacion;
    }

    public Formulario getFormulario() {
	return formulario;
    }

    public void setFormulario(Formulario formulario) {
	this.formulario = formulario;
    }

    public Usuario getUsuario() {
	return usuario;
    }

    public void setUsuario(Usuario usuario) {
	this.usuario = usuario;
    }

}
