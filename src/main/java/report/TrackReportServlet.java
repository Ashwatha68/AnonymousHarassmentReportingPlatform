package report;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/TrackReportServlet")

public class TrackReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String referenceCode = request.getParameter("referenceCode");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/harassment_reporting", "root", "root");

            String sql = "SELECT status FROM user_reports WHERE referenceCode=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, referenceCode);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("status", rs.getString("status"));
                request.setAttribute("referenceCode", referenceCode);
                RequestDispatcher rd = request.getRequestDispatcher("track.jsp");
                rd.forward(request, response);
            } else {
                response.getWriter().println("Invalid Reference Code");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
