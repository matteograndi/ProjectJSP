/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FC;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.String;

/**
 *
 * @author matteo grandi
 */
public class FrontController extends HttpServlet {

    String riga;
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher;
        String uri = request.getRequestURI();

        if (session.getAttribute("user")==null){
            riga = "<HTML><HEAD><TITLE>Errore</TITLE></HEAD>" +
                    "<BODY><h2>Utente non loggato</h2>" +
                    "<form method=\"post\" action=\"/SitoMaster/index.jsp\">" +
                    "<input type=\"submit\" value=\"HOME PAGE\">" +
                    "</form></BODY></HTML>";
        } else if (session.getAttribute("user")!=null){
            dispatcher = getServletContext().getRequestDispatcher("/WEB-INF"+uri);

            System.err.println(request.getRequestURI());
            System.err.println(getServletContext());
            if (dispatcher!=null) {
                dispatcher.forward(request, response);
            }
        } else{
            riga = "<HTML><HEAD><TITLE>Errore</TITLE></HEAD>" +
                    "<BODY><h2>Utente non loggato</h2>" +
                    "<form method=\"post\" action=\"/SitoMaster/index.jsp\">" +
                    "<input type=\"submit\" value=\"HOME PAGE\">" +
                    "</form></BODY></HTML>";
        }

        PrintWriter out = response.getWriter();
        out.println(riga);
        out.close();
    } 

      // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>

}
