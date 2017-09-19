package ec.gob.acess.esamyn.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import ec.gob.acess.esamyn.bean.FormularioBean;
import ec.gob.acess.esamyn.bean.ReporteBean;
import ec.gob.acess.esamyn.modelo.Formulario;

@WebServlet("/archivo")
public class ArchivoServlet extends HttpServlet {

    private static final long serialVersionUID = 8525402383318635268L;

    @EJB
    private ReporteBean reporteBean;

    @EJB
    private FormularioBean formularioBean;

    public ArchivoServlet() {
	super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	

	String idFormulario = request.getParameter("idFormulario");
	String idEstablecimiento = request.getParameter("idEstablecimiento");

	Long codigoFormulario = idFormulario != null ? Long.parseLong(idFormulario) : null;

	Long codigoEstablecimiento = idEstablecimiento != null ? Long.parseLong(idEstablecimiento) : null;

	if (codigoFormulario != null) {
	    Formulario formulario = formularioBean.findByPk(codigoFormulario);

	    String nombreArchivo = formulario.getTitulo() + ".xlsx";

	    try {
		XSSFWorkbook workbook = reporteBean.generarDocumento(codigoFormulario, codigoEstablecimiento);
		
		ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
		workbook.write(outByteStream);
		byte [] outArray = outByteStream.toByteArray();
		response.setContentType("application/ms-excel");
		response.setContentLength(outArray.length);
		response.setHeader("Expires:", "0"); // eliminates browser caching
		response.setHeader("Content-Disposition", "attachment; filename="+nombreArchivo);
		OutputStream outStream = response.getOutputStream();
		outStream.write(outArray);
		outStream.flush();
		
	    } catch (IOException e) {
		String m = e.getMessage();

	    }
	}


    }

}
