/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package packagebo;

import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
/**
 *
 * @author matteo grandi
 */
public class DemoUploadServlet1 extends HttpServlet {

    String dirName;
    String uscita;

    public void init(ServletConfig config) throws ServletException {
super.init(config);
// read the uploadDir from the servlet parameters
dirName = config.getInitParameter("uploadDir");
if (dirName == null) {
throw new ServletException("Please supply uploadDir parameter");
}
}

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       

    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

     //PrintWriter out = response.getWriter();
        response.setContentType("text/plain");

try {
// Use an advanced form of the constructor that specifies a character
// encoding of the request (not of the file contents) and a file
// rename policy.
MultipartRequest multi =
new MultipartRequest(request, dirName, 10*1024*1024,
"ISO-8859-1", new DefaultFileRenamePolicy());
Enumeration params = multi.getParameterNames();
Enumeration files = multi.getFileNames();
}
catch (IOException lEx) {
this.getServletContext().log(lEx, "error reading or saving file");
}

String uscita;
response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        uscita = "<html><head><meta content=\"text/html; charset=ISO-8859-1\"http-equiv=\"content-type\">" +
                    "<title>Home Page Upload Finish</title></head><body>" +
                    "<center><h1><font color=\"red\">UPLOAD EFFETTUATO</font><p>" +
                    "<font color=\"purple\">Torna al menù principale<p></font></h1><p>"+
                    "<form action=\"../welcome.jsp\">" +
                    "<input value=\"Torna al menu principale\" type=\"submit\"></form><p>" +
                    "</form></body></html>";



out.print(uscita);
        out.close();


        processRequest(request, response);

        

    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
