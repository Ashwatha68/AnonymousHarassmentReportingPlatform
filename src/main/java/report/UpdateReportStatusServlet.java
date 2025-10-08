package report;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/UpdateReportStatusServlet")
public class UpdateReportStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int updatedCount = 0;
        List<String> updatedReports = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/harassment_reporting", "root", "root");
            Enumeration<String> paramNames = request.getParameterNames();
                       while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();
                if (paramName.startsWith("status_")) {
                    String referenceCode = paramName.substring(7); 
                    String newStatus = request.getParameter(paramName);
                    String sql = "UPDATE user_reports SET status=? WHERE referenceCode=?";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setString(1, newStatus);
                    stmt.setString(2, referenceCode);
                    int rowsUpdated = stmt.executeUpdate();
                    
                    if (rowsUpdated > 0) {
                        updatedCount++;
                        updatedReports.add(referenceCode);
                    }
                    
                    stmt.close();
                }
            }
            conn.close();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<title>Status Updated</title>");
            out.println("<style>");
            out.println("body {");
            out.println("  margin: 0;");
            out.println("  font-family: 'Segoe UI', sans-serif;");
            out.println("  background: url('https://image.freepik.com/vecteurs-libre/concept-cybersecurite-element-hud-fond-ton-bleu_99087-130.jpg') no-repeat center center fixed;");
            out.println("  background-size: cover;");
            out.println("  display: flex;");
            out.println("  justify-content: center;");
            out.println("  align-items: center;");
            out.println("  min-height: 100vh;");
            out.println("  padding: 20px;");
            out.println("  color: #e0f7ff;");
            out.println("}");
            out.println(".success-container {");
            out.println("  background: rgba(0, 20, 40, 0.95);");
            out.println("  padding: 40px;");
            out.println("  border-radius: 15px;");
            out.println("  border: 2px solid #00c6ff;");
            out.println("  box-shadow: 0 0 30px rgba(0, 198, 255, 0.5), 0 0 50px rgba(0, 198, 255, 0.3);");
            out.println("  backdrop-filter: blur(10px);");
            out.println("  text-align: center;");
            out.println("  width: 100%;");
            out.println("  max-width: 600px;");
            out.println("  animation: fadeInScale 0.6s ease;");
            out.println("}");
            out.println("@keyframes fadeInScale {");
            out.println("  from { opacity: 0; transform: scale(0.9) translateY(30px); }");
            out.println("  to { opacity: 1; transform: scale(1) translateY(0); }");
            out.println("}");
            out.println(".success-icon {");
            out.println("  font-size: 70px;");
            out.println("  color: #00c6ff;");
            out.println("  margin-bottom: 20px;");
            out.println("  animation: pulse 2s infinite;");
            out.println("  text-shadow: 0 0 20px #00c6ff;");
            out.println("}");
            out.println("@keyframes pulse {");
            out.println("  0%, 100% { transform: scale(1); opacity: 1; }");
            out.println("  50% { transform: scale(1.1); opacity: 0.8; }");
            out.println("}");
            out.println("h2 {");
            out.println("  color: #00c6ff;");
            out.println("  font-size: 28px;");
            out.println("  margin: 0 0 15px 0;");
            out.println("  text-shadow: 0 0 10px #00c6ff, 0 0 20px #0093ff;");
            out.println("}");
            out.println("p {");
            out.println("  color: #e0f7ff;");
            out.println("  font-size: 16px;");
            out.println("  margin-bottom: 25px;");
            out.println("  line-height: 1.6;");
            out.println("}");
            out.println(".divider {");
            out.println("  height: 1px;");
            out.println("  background: linear-gradient(90deg, transparent, #00c6ff, transparent);");
            out.println("  margin: 25px 0;");
            out.println("}");
            out.println("button {");
            out.println("  padding: 14px 30px;");
            out.println("  font-size: 16px;");
            out.println("  cursor: pointer;");
            out.println("  background: linear-gradient(135deg, #00c6ff 0%, #0093ff 100%);");
            out.println("  border: none;");
            out.println("  color: #000;");
            out.println("  font-weight: bold;");
            out.println("  border-radius: 8px;");
            out.println("  transition: all 0.3s ease;");
            out.println("  box-shadow: 0 0 15px rgba(0, 198, 255, 0.3);");
            out.println("}");
            out.println("button:hover {");
            out.println("  background: linear-gradient(135deg, #fff 0%, #00e5ff 100%);");
            out.println("  transform: translateY(-3px);");
            out.println("  box-shadow: 0 0 25px #00c6ff, 0 0 40px rgba(0, 198, 255, 0.5);");
            out.println("}");
            out.println(".count-badge {");
            out.println("  display: inline-block;");
            out.println("  background: rgba(0, 198, 255, 0.2);");
            out.println("  border: 1px solid #00c6ff;");
            out.println("  padding: 8px 20px;");
            out.println("  border-radius: 20px;");
            out.println("  font-size: 18px;");
            out.println("  font-weight: bold;");
            out.println("  margin: 15px 0;");
            out.println("  color: #00c6ff;");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='success-container'>");
            out.println("  <div class='success-icon'>✓</div>");
            out.println("  <h2>Status Updated Successfully</h2>");
            out.println("  <div class='count-badge'>" + updatedCount + " report(s) updated</div>");
            out.println("  <p>The status has been successfully updated for the selected reports.</p>");
            out.println("  <div class='divider'></div>");
            out.println("  <button onclick=\"window.location.href='index.html'\">← Go Back Home</button>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<title>Update Failed</title>");
            out.println("<style>");
            out.println("body {");
            out.println("  margin: 0;");
            out.println("  font-family: 'Segoe UI', sans-serif;");
            out.println("  background: url('https://image.freepik.com/vecteurs-libre/concept-cybersecurite-element-hud-fond-ton-bleu_99087-130.jpg') no-repeat center center fixed;");
            out.println("  background-size: cover;");
            out.println("  display: flex;");
            out.println("  justify-content: center;");
            out.println("  align-items: center;");
            out.println("  min-height: 100vh;");
            out.println("  padding: 20px;");
            out.println("  color: #e0f7ff;");
            out.println("}");
            out.println(".error-container {");
            out.println("  background: rgba(0, 20, 40, 0.95);");
            out.println("  padding: 40px;");
            out.println("  border-radius: 15px;");
            out.println("  border: 2px solid #f44336;");
            out.println("  box-shadow: 0 0 30px rgba(244, 67, 54, 0.5);");
            out.println("  backdrop-filter: blur(10px);");
            out.println("  text-align: center;");
            out.println("  max-width: 500px;");
            out.println("  animation: fadeInScale 0.6s ease;");
            out.println("}");
            out.println("@keyframes fadeInScale {");
            out.println("  from { opacity: 0; transform: scale(0.9) translateY(30px); }");
            out.println("  to { opacity: 1; transform: scale(1) translateY(0); }");
            out.println("}");
            out.println(".error-icon {");
            out.println("  font-size: 70px;");
            out.println("  color: #f44336;");
            out.println("  margin-bottom: 20px;");
            out.println("  animation: shake 0.5s ease;");
            out.println("}");
            out.println("@keyframes shake {");
            out.println("  0%, 100% { transform: translateX(0); }");
            out.println("  25% { transform: translateX(-10px); }");
            out.println("  75% { transform: translateX(10px); }");
            out.println("}");
            out.println("h2 { color: #f44336; font-size: 26px; margin: 0 0 15px 0; text-shadow: 0 0 10px rgba(244, 67, 54, 0.6); }");
            out.println("p { color: #e0f7ff; font-size: 15px; margin-bottom: 30px; }");
            out.println("button {");
            out.println("  padding: 14px 30px;");
            out.println("  font-size: 16px;");
            out.println("  cursor: pointer;");
            out.println("  background: linear-gradient(135deg, #00c6ff 0%, #0093ff 100%);");
            out.println("  border: none;");
            out.println("  color: #000;");
            out.println("  font-weight: bold;");
            out.println("  border-radius: 8px;");
            out.println("  transition: all 0.3s ease;");
            out.println("}");
            out.println("button:hover {");
            out.println("  background: linear-gradient(135deg, #fff 0%, #00e5ff 100%);");
            out.println("  transform: translateY(-3px);");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='error-container'>");
            out.println("  <div class='error-icon'>✕</div>");
            out.println("  <h2>Update Failed</h2>");
            out.println("  <p>Error: " + e.getMessage() + "</p>");
            out.println("  <button onclick=\"window.location.href='index.html'\">← Go Back Home</button>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html");
    }
}