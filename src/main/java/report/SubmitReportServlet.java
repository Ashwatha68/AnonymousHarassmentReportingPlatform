package report;

import java.io.*;
import java.sql.*;
import java.util.UUID;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

@WebServlet("/SubmitReportServlet")
@MultipartConfig(       
    fileSizeThreshold = 1024 * 1024 * 1, 
    maxFileSize = 1024 * 1024 * 10,      
    maxRequestSize = 1024 * 1024 * 15    
)
public class SubmitReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String description = request.getParameter("details");
        String dateOfIncident = request.getParameter("incident_date");
        String place = request.getParameter("location");
        Part filePart = request.getPart("proofFile");
        String filePath = null;
        if (filePart != null && filePart.getSize() > 0) {
            String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) uploadFolder.mkdirs();
            String fileName = UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();
            filePath = uploadDir + File.separator + fileName;
            try (InputStream input = filePart.getInputStream()) {
            	Files.copy(input, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        }
        String referenceCode = "REF-" + UUID.randomUUID().toString().substring(0, 6).toUpperCase();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/harassment_reporting", "root", "root");

            String sql = "INSERT INTO user_reports " +
                         "(referenceCode, age, gender, description, date_of_incident, place, filePath, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, 'Submitted')";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, referenceCode);
            stmt.setInt(2, Integer.parseInt(age));
            stmt.setString(3, gender);
            stmt.setString(4, description);
            stmt.setDate(5, java.sql.Date.valueOf(dateOfIncident));
            stmt.setString(6, place);
            stmt.setString(7, filePath);
            stmt.executeUpdate();
            stmt.close();
            conn.close();
            request.setAttribute("referenceCode", referenceCode);
            RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
