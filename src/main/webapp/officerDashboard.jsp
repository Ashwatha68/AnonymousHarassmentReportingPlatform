<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Officer Dashboard</title>
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
h2, h3 {
  text-align: center;
  color: #00c6ff;
  text-shadow: 0 0 10px #00c6ff, 0 0 20px #0093ff;
  animation: fadeIn 1s ease;
}
h2 {
  font-size: 32px;
  margin-bottom: 10px;
}
h3 {
  font-size: 24px;
  margin-top: 5px;
  margin-bottom: 30px;
  color: #00e5ff;
}
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-20px); }
  to { opacity: 1; transform: translateY(0); }
}
.dashboard-container {
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
  background: rgba(0, 15, 30, 0.7);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 0 15px rgba(0, 198, 255, 0.3);
}
th, td {
  border: 1px solid #00c6ff;
  padding: 12px 10px;
  text-align: center;
  color: #e0f7ff;
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
  background-color: rgba(0, 12, 26, 0.6);
  font-size: 13px;
  transition: background-color 0.3s ease;
}
tr:hover td {
  background-color: rgba(0, 60, 100, 0.7);
}
select, button, input {
  padding: 6px 10px;
  margin: 2px;
  background: rgba(0, 20, 50, 0.9);
  color: #00c6ff;
  border: 1px solid #00c6ff;
  border-radius: 5px;
  font-size: 13px;
  outline: none;
  transition: all 0.3s ease;
}
select {
  cursor: pointer;
  min-width: 120px;
}
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
td:nth-child(7) {
  font-weight: bold;
  text-transform: uppercase;
  font-size: 12px;
  letter-spacing: 0.5px;
}
.button-container {
  display: flex;
  gap: 15px;
  justify-content: center;
  margin-top: 30px;
}
.update-button {
  padding: 14px 30px;
  font-size: 18px;
  box-shadow: 0 0 20px rgba(0, 198, 255, 0.3);
}
.update-button:hover {
  transform: translateY(-3px);
  box-shadow: 0 0 30px #00c6ff, 0 0 40px rgba(0, 198, 255, 0.6);
}
.back-button {
  background: linear-gradient(135deg, rgba(0, 198, 255, 0.2) 0%, rgba(0, 147, 255, 0.2) 100%);
  color: #00c6ff;
  border: 2px solid #00c6ff;
  padding: 14px 30px;
  font-size: 18px;
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
</style>
</head>
<body>
<h2>Welcome <%= request.getAttribute("officerName") %></h2>
<h3>Assigned Reports</h3>
<%
String officer = (String) request.getAttribute("officerName");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/harassment_reporting", "root", "root");

PreparedStatement ps = conn.prepareStatement(
"SELECT referenceCode, age, gender, description, date_of_incident, place, status FROM user_reports WHERE officer=? ORDER BY created_at DESC"
);
ps.setString(1, officer);
ResultSet rs = ps.executeQuery();
%>
<form method="post" action="UpdateReportStatusServlet">
<div class="dashboard-container">
<table>
<tr>
<th>Ref Code</th>
<th>Age</th>
<th>Gender</th>
<th>Description</th>
<th>Date</th>
<th>Place</th>
<th>Status</th>
<th>Update Status</th>
</tr>
<%
while(rs.next()) {
String ref = rs.getString("referenceCode");
int age = rs.getInt("age");
String gender = rs.getString("gender");
String desc = rs.getString("description");
java.sql.Date date = rs.getDate("date_of_incident");
String place = rs.getString("place");
String status = rs.getString("status");
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
<input type="hidden" name="referenceCode_<%= ref %>" value="<%= ref %>">
<select name="status_<%= ref %>" required>
<option value="Submitted" <%= "Submitted".equals(status) ? "selected" : "" %>>Submitted</option>
<option value="In Progress" <%= "In Progress".equals(status) ? "selected" : "" %>>In Progress</option>
<option value="Resolved" <%= "Resolved".equals(status) ? "selected" : "" %>>Resolved</option>
<option value="Closed" <%= "Closed".equals(status) ? "selected" : "" %>>Closed</option>
</select>
</td>
</tr>
<%
}
rs.close();
ps.close();
conn.close();
%>
</table>
<div class="button-container">
  <a href="index.html" class="back-button">← Go Back</a>
  <button type="submit" class="update-button">Update</button>
</div>
</div>
</form>
</body>
</html>