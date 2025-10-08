package report;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/OfficerLoginServlet")
public class OfficerLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if ((username.equals("officer1") && password.equals("pass1")) ||
            (username.equals("officer2") && password.equals("pass2")) ||
            (username.equals("officer3") && password.equals("pass3"))) {

            request.setAttribute("officerName", username);
            RequestDispatcher rd = request.getRequestDispatcher("officerDashboard.jsp");
            rd.forward(request, response);

        } else {
        	 response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
             out.println("<!DOCTYPE html>");
             out.println("<html>");
             out.println("<head>");
             out.println("<meta charset='UTF-8'>");
             out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
             out.println("<title>Login Failed</title>");
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
             out.println("  box-shadow: 0 0 30px rgba(244, 67, 54, 0.5), 0 0 50px rgba(244, 67, 54, 0.3);");
             out.println("  backdrop-filter: blur(10px);");
             out.println("  text-align: center;");
             out.println("  width: 100%;");
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
             out.println("  text-shadow: 0 0 20px #f44336;");
             out.println("}");
             out.println("@keyframes shake {");
             out.println("  0%, 100% { transform: translateX(0); }");
             out.println("  25% { transform: translateX(-10px); }");
             out.println("  75% { transform: translateX(10px); }");
             out.println("}");
             out.println("h3 {");
             out.println("  color: #f44336;");
             out.println("  font-size: 26px;");
             out.println("  margin: 0 0 15px 0;");
             out.println("  text-shadow: 0 0 10px rgba(244, 67, 54, 0.6);");
             out.println("}");
             out.println("p {");
             out.println("  color: #e0f7ff;");
             out.println("  font-size: 15px;");
             out.println("  margin-bottom: 30px;");
             out.println("  line-height: 1.6;");
             out.println("}");
             out.println(".divider {");
             out.println("  height: 1px;");
             out.println("  background: linear-gradient(90deg, transparent, #f44336, transparent);");
             out.println("  margin: 25px 0;");
             out.println("}");
             out.println("a {");
             out.println("  display: inline-block;");
             out.println("  padding: 14px 30px;");
             out.println("  background: linear-gradient(135deg, #00c6ff 0%, #0093ff 100%);");
             out.println("  color: #000;");
             out.println("  text-decoration: none;");
             out.println("  border-radius: 8px;");
             out.println("  font-weight: bold;");
             out.println("  font-size: 15px;");
             out.println("  transition: all 0.3s ease;");
             out.println("  box-shadow: 0 0 15px rgba(0, 198, 255, 0.3);");
             out.println("}");
             out.println("a:hover {");
             out.println("  background: linear-gradient(135deg, #fff 0%, #00e5ff 100%);");
             out.println("  transform: translateY(-3px);");
             out.println("  box-shadow: 0 0 25px #00c6ff, 0 0 40px rgba(0, 198, 255, 0.5);");
             out.println("}");
             out.println("</style>");
             out.println("</head>");
             out.println("<body>");
             out.println("<div class='error-container'>");
             out.println("  <div class='error-icon'>✕</div>");
             out.println("  <h3>Login Failed</h3>");
             out.println("  <p>Invalid credentials. Please check your username and password and try again.</p>");
             out.println("  <div class='divider'></div>");
             out.println("  <a href='index.html'>← Go Back Home</a>");
             out.println("</div>");
             out.println("</body>");
             out.println("</html>");
        }
    }
}
