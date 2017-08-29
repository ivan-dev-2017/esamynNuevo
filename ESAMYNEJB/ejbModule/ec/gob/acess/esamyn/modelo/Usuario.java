package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.util.Date;

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
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_usuario")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "usuario")
public class Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "usu_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "usu_creado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creado;
	@Basic(optional = false)
	@Column(name = "usu_modificado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificado;
	@Column(name = "usu_nombres")
	private String nombres;
	@Column(name = "usu_apellidos")
	private String apellidos;
	@Column(name = "usu_username")
	private String username;
	@Column(name = "usu_password")
	private String password;
	@Basic(optional = false)
	@Column(name = "usu_bloqueado")
	private int bloqueado;
	@Column(name = "usu_cedula")
	private String cedula;
	@Column(name = "usu_telefono")
	private String telefono;
	@Column(name = "usu_correo_eletronico")
	private String correoEletronico;
	@Column(name = "usu_sesion")
	private String token;
	@JoinColumn(name = "usu_rol", referencedColumnName = "rol_id")
	@ManyToOne
	private Rol rol;

	public Usuario() {
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

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getBloqueado() {
		return bloqueado;
	}

	public void setBloqueado(int bloqueado) {
		this.bloqueado = bloqueado;
	}

	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCorreoEletronico() {
		return correoEletronico;
	}

	public void setCorreoEletronico(String correoEletronico) {
		this.correoEletronico = correoEletronico;
	}

	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	

}