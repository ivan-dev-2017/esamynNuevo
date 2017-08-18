package acess.esamyn.dto;

public class MensajeDto {
	
	private boolean error;
	
	private String mensaje;
	
	private Object objeto;
	

	public MensajeDto(boolean error, String mensaje, Object objeto) {
		super();
		this.error = error;
		this.mensaje = mensaje;
		this.objeto = objeto;
	}

	public boolean isError() {
		return error;
	}

	public void setError(boolean error) {
		this.error = error;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public Object getObjeto() {
		return objeto;
	}

	public void setObjeto(Object objeto) {
		this.objeto = objeto;
	}
	
	

}
