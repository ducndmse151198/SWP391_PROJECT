/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controller;

import app.employees.EmployeesDAO;
import app.facility.FacilityDAO;
import app.facility.FacilityDTO;
import app.users.UserDTO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "FacilityStatisticController", urlPatterns = {"/FacilityStatisticController"})

public class FacilityStatisticController extends HttpServlet {

    private static final String SUCCESS = "adminPage.jsp";
    private static final String ERROR = "##";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            HttpSession session = request.getSession();
            String txt1 = "";
            String txt2 = "";
            String txt3 = "";
            int quarter = 0; 
            SimpleDateFormat month_format = new SimpleDateFormat("MMM ", Locale.ENGLISH);
            Date date = new Date();
            String month_name = month_format.format(date);
            FacilityDAO dao = new FacilityDAO();
            List<FacilityDTO> list = new ArrayList<FacilityDTO>();
            if (month_name.equalsIgnoreCase("Jan") || month_name.equalsIgnoreCase("Feb") || month_name.equalsIgnoreCase("Mar")) {
                txt1 = "Jan";
                txt2 = "Feb";
                txt3 = "Mar";
                quarter = 1;
            }
            if (month_name.equalsIgnoreCase("Apr") || month_name.equalsIgnoreCase("May") || month_name.equalsIgnoreCase("Jun")) {
                txt1 = "Apr";
                txt2 = "May";
                txt3 = "Jun";
                quarter = 2;
            }
            if (month_name.equalsIgnoreCase("Jul") || month_name.equalsIgnoreCase("Aug") || month_name.equalsIgnoreCase("Sep")) {
                txt1 = "Jul";
                txt2 = "Aug";
                txt3 = "Sep";
                quarter = 3;
            }

            if (month_name.equalsIgnoreCase("Oct") || month_name.equalsIgnoreCase("Nov") || month_name.equalsIgnoreCase("Dec")) {
                txt1 = "Oct";
                txt2 = "Nov";
                txt3 = "Dec";
                quarter = 4;
            }
            list = dao.selectTop5(txt1, txt2, txt3);
            if (!list.isEmpty()) {
                session.setAttribute("FACILITY_STATISTIC", list);
                session.setAttribute("QUARTER_OF_YEAR", quarter);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at StatisticGoodEmpController" + e.toString());

        } finally {
            request.getRequestDispatcher(url).forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
