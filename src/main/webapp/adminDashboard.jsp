<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<style>
body {
  margin: 0;
  font-family: 'Segoe UI', sans-serif;
  background: url("https://image.freepik.com/vecteurs-libre/concept-cybersecurite-element-hud-fond-ton-bleu_99087-130.jpg") no-repeat center center fixed;
  background-size: cover;
  color: #e0f7ff;
  padding: 20px;
  min-height: 100vh;
}

.header-section {
  text-align: center;
  margin-bottom: 30px;
  animation: fadeIn 1s ease;
}

h2 {
  font-size: 32px;
  color: #00c6ff;
  text-shadow: 0 0 10px #00c6ff, 0 0 20px #0093ff;
  margin: 0;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-20px); }
  to { opacity: 1; transform: translateY(0); }
}

/* Success Message Styling */
.success-message {
  max-width: 600px;
  margin: 0 auto 30px auto;
  background: rgba(0, 198, 255, 0.15);
  border: 2px solid #00c6ff;
  border-radius: 12px;
  padding: 20px;
  display: flex;
  align-items: center;
  gap: 15px;
  animation: slideDown 0.5s ease;
  box-shadow: 0 0 20px rgba(0, 198, 255, 0.4);
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.success-icon {
  font-size: 40px;
  color: #00c6ff;
  animation: successPulse 1.5s ease-in-out infinite;
  line-height: 1;
}

@keyframes successPulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.1);
  }
}

.success-text {
  flex: 1;
  text-align: left;
}

.success-text h3 {
  margin: 0 0 5px 0;
  color: #00c6ff;
  font-size: 18px;
  text-shadow: 0 0 8px rgba(0, 198, 255, 0.6);
}

.success-text p {
  margin: 0;
  color: #e0f7ff;
  font-size: 14px;
}

.close-success {
  background: rgba(0, 198, 255, 0.2);
  border: 1px solid #00c6ff;
  color: #00c6ff;
  padding: 8px 16px;
  border-radius: 6px;
  cursor: pointer;
  font-weight: bold;
  transition: all 0.3s ease;
}

.close-success:hover {
  background: rgba(0, 198, 255, 0.4);
  transform: translateY(-2px);
  box-shadow: 0 0 15px rgba(0, 198, 255, 0.4);
}

form {
  max-width: 1400px;
  margin: 0 auto;
  background: rgba(0, 20, 40, 0.85);
  padding: 30px;
  border-radius: 12px;
  border: 2px solid #00c6ff;
  box-shadow: 0 0 25px rgba(0, 198, 255, 0.4);
  backdrop-filter: blur(8px);
}

table {
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
  background: rgba(0, 15, 30, 0.7);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 0 15px rgba(0, 198, 255, 0.3);
}

th, td {
  border: 1px solid #00c6ff;
  padding: 12px 10px;
  color: #e0f7ff;
  text-align: left;
}

th {
  background: linear-gradient(135deg, #001020 0%, #002040 100%);
  font-weight: bold;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  text-shadow: 0 0 8px rgba(0, 198, 255, 0.6);
  color: #00c6ff;
  position: sticky;
  top: 0;
  z-index: 10;
}

td {
  background-color: rgba(0, 31, 51, 0.6);
  font-size: 13px;
  transition: background-color 0.3s ease;
}

tr:hover td {
  background-color: rgba(0, 60, 100, 0.7);
}

select, button {
  padding: 6px 10px;
  margin: 2px;
  background: rgba(0, 20, 50, 0.9);
  color: #00c6ff;
  border: 1px solid #00c6ff;
  border-radius: 5px;
  font-size: 13px;
  outline: none;
  cursor: pointer;
  transition: all 0.3s ease;
}

select:hover, select:focus {
  background: rgba(0, 40, 80, 0.9);
  box-shadow: 0 0 10px rgba(0, 198, 255, 0.4);
  border-color: #00e5ff;
}

button {
  background: linear-gradient(135deg, #00c6ff 0%, #0093ff 100%);
  border: none;
  color: #000;
  font-weight: bold;
  cursor: pointer;
  border-radius: 6px;
  text-shadow: none;
}

button:hover {
  background: linear-gradient(135deg, #fff 0%, #00e5ff 100%);
  color: #000;
  box-shadow: 0 0 15px #00c6ff, 0 0 25px rgba(0, 198, 255, 0.5);
  transform: translateY(-2px);
}

.assign-button {
  margin-top: 25px;
  padding: 14px 30px;
  font-size: 18px;
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: fit-content;
  box-shadow: 0 0 20px rgba(0, 198, 255, 0.3);
}

.assign-button:hover {
  transform: translateY(-3px);
  box-shadow: 0 0 30px #00c6ff, 0 0 40px rgba(0, 198, 255, 0.6);
}

.button-container {
  display: flex;
  gap: 15px;
  justify-content: center;
  margin-top: 20px;
}

.back-button {
  background: linear-gradient(135deg, rgba(0, 198, 255, 0.2) 0%, rgba(0, 147, 255, 0.2) 100%);
  color: #00c6ff;
  border: 2px solid #00c6ff;
  padding: 12px 25px;
  font-size: 16px;
  text-decoration: none;
  display: inline-block;
  border-radius: 8px;
  font-weight: bold;
  transition: all 0.3s ease;
  box-shadow: 0 0 15px rgba(0, 198, 255, 0.3);
}

.back-button:hover {
  background: linear-gradient(135deg, rgba(0, 198, 255, 0.4) 0%, rgba(0, 147, 255, 0.4) 100%);
  color: #fff;
  transform: translateY(-3px);
  box-shadow: 0 0 25px #00c6ff, 0 0 40px rgba(0, 198, 255, 0.5);
}

/* Scrollbar styling */
::-webkit-scrollbar {
  width: 10px;
  height: 10px;
}

::-webkit-scrollbar-track {
  background: rgba(0, 15, 40, 0.5);
}

::-webkit-scrollbar-thumb {
  background: #00c6ff;
  border-radius: 5px;
}

::-webkit-scrollbar-thumb:hover {
  background: #00e5ff;
}
</style>
</head>
<body>

<div class="header-section">
  <h2>Admin Dashboard</h2>
</div>

<%
String confirmation = (String) request.getAttribute("confirmation");
if (confirmation != null) {
%>
<div class="success-message" id="successMessage">
  <div class="success-icon">✓</div>
  <div class="success-text">
    <h3>Success!</h3>
    <p><%= confirmation %></p>
  </div>
  <button class="close-success" onclick="document.getElementById('successMessage').style.display='none'">×</button>
</div>
<%
}
%>
<form method="post" action="AssignOfficerServlet">
<table>
<tr>
<th>Ref Code</th>
<th>Age</th>
<th>Gender</th>
<th>Description</th>
<th>Date</th>
<th>Place</th>
<th>Status</th>
<th>Assign Officer</th>
</tr>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/harassment_reporting", "root", "root");
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM user_reports ORDER BY created_at DESC");
while(rs.next()) {
String ref = rs.getString("referenceCode");
int age = rs.getInt("age");
String gender = rs.getString("gender");
String desc = rs.getString("description");
java.sql.Date date = rs.getDate("date_of_incident");
String place = rs.getString("place");
String status = rs.getString("status");
String officer = rs.getString("officer"); 
%>
<tr>
<td><%= ref %></td>
<td><%= age %></td>
<td><%= gender %></td>
<td><%= desc %></td>
<td><%= date %></td>
<td><%= place %></td>
<td><%= status %></td>
<td>
<select name="officer_<%= ref %>">
<option value="">Select Officer</option>
<option value="officer1" <%= "officer1".equals(officer) ? "selected" : "" %>>Officer1</option>
<option value="officer2" <%= "officer2".equals(officer) ? "selected" : "" %>>Officer2</option>
<option value="officer3" <%= "officer3".equals(officer) ? "selected" : "" %>>Officer3</option>
</select>
</td>
</tr>
<%
}
rs.close();
stmt.close();
conn.close();
%>
</table>
<div class="button-container">
  <a href="index.html" class="back-button">← Go Back Home</a>
  <button type="submit" class="assign-button">Assign Officers</button>
</div>
</form>

</body>
</html>