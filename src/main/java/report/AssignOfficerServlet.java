package report;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.*;

@WebServlet("/AssignOfficerServlet")
public class AssignOfficerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/harassment_reporting", "root", "root");

            Enumeration<String> paramNames = request.getParameterNames();

            boolean anyAssigned = false;

            while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();

                if (paramName.startsWith("officer_")) {
                    String officer = request.getParameter(paramName);
                    if (officer != null && !officer.isEmpty()) {
                        String referenceCode = paramName.substring(8); 

                        PreparedStatement stmt = conn.prepareStatement(
                                "UPDATE user_reports SET officer=? WHERE referenceCode=?"
                        );
                        stmt.setString(1, officer);
                        stmt.setString(2, referenceCode);
                        stmt.executeUpdate();
                        stmt.close();

                        anyAssigned = true;
                    }
                }
            }

            conn.close();
            if (anyAssigned) {
                request.setAttribute("confirmation", "Officer(s) assigned successfully!");
            } else {
                request.setAttribute("confirmation", "No officer was selected for assignment.");
            }

            RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
