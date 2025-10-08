<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Track Report Status</title>
<style>
body {
  margin: 0;
  font-family: 'Segoe UI', sans-serif;
  background: url("https://image.freepik.com/vecteurs-libre/concept-cybersecurite-element-hud-fond-ton-bleu_99087-130.jpg") no-repeat center center fixed;
  background-size: cover;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  padding: 20px;
  color: #e0f7ff;
}

.container {
  background: rgba(0, 20, 40, 0.95);
  padding: 40px;
  border-radius: 15px;
  border: 2px solid #00c6ff;
  box-shadow: 0 0 30px rgba(0, 198, 255, 0.5), 0 0 50px rgba(0, 198, 255, 0.3);
  backdrop-filter: blur(10px);
  text-align: center;
  width: 100%;
  max-width: 600px;
  animation: fadeInScale 0.6s ease;
}

@keyframes fadeInScale {
  from {
    opacity: 0;
    transform: scale(0.9) translateY(30px);
  }
  to {
    opacity: 1;
    transform: scale(1) translateY(0);
  }
}

.tracking-icon {
  font-size: 70px;
  margin-bottom: 20px;
  animation: pulse 2s infinite;
  text-shadow: 0 0 20px #00c6ff;
}

@keyframes pulse {
  0%, 100% {
    transform: scale(1);
    opacity: 1;
  }
  50% {
    transform: scale(1.1);
    opacity: 0.8;
  }
}

h2 {
  color: #00c6ff;
  font-size: 32px;
  margin: 0 0 30px 0;
  text-shadow: 0 0 10px #00c6ff, 0 0 20px #0093ff;
}

.info-card {
  background: rgba(0, 40, 80, 0.6);
  padding: 30px;
  border-radius: 12px;
  border: 1px solid #00c6ff;
  margin: 25px 0;
  box-shadow: 0 0 15px rgba(0, 198, 255, 0.3);
}

.info-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 0;
  border-bottom: 1px solid rgba(0, 198, 255, 0.2);
}

.info-row:last-child {
  border-bottom: none;
}

.info-label {
  font-weight: bold;
  color: #00e5ff;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  text-align: left;
}

.info-value {
  color: #e0f7ff;
  font-size: 16px;
  text-align: right;
  word-break: break-word;
}

.reference-code {
  font-family: 'Courier New', monospace;
  font-size: 20px;
  color: #00c6ff;
  font-weight: bold;
  letter-spacing: 2px;
  text-shadow: 0 0 8px #00c6ff;
}

.status-badge {
  display: inline-block;
  padding: 8px 20px;
  border-radius: 20px;
  font-weight: bold;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 1px;
  animation: statusGlow 2s ease-in-out infinite;
}

@keyframes statusGlow {
  0%, 100% {
    box-shadow: 0 0 15px rgba(0, 198, 255, 0.4);
  }
  50% {
    box-shadow: 0 0 25px rgba(0, 198, 255, 0.6), 0 0 35px rgba(0, 198, 255, 0.4);
  }
}

.status-submitted {
  background: rgba(255, 193, 7, 0.2);
  color: #ffc107;
  border: 2px solid #ffc107;
  box-shadow: 0 0 15px rgba(255, 193, 7, 0.4);
}

.status-progress {
  background: rgba(33, 150, 243, 0.2);
  color: #2196f3;
  border: 2px solid #2196f3;
  box-shadow: 0 0 15px rgba(33, 150, 243, 0.4);
}

.status-resolved {
  background: rgba(76, 175, 80, 0.2);
  color: #4caf50;
  border: 2px solid #4caf50;
  box-shadow: 0 0 15px rgba(76, 175, 80, 0.4);
}

.status-closed {
  background: rgba(158, 158, 158, 0.2);
  color: #9e9e9e;
  border: 2px solid #9e9e9e;
  box-shadow: 0 0 15px rgba(158, 158, 158, 0.4);
}

.divider {
  height: 1px;
  background: linear-gradient(90deg, transparent, #00c6ff, transparent);
  margin: 30px 0;
}

.button-container {
  display: flex;
  gap: 15px;
  justify-content: center;
  margin-top: 30px;
  flex-wrap: wrap;
}

a {
  display: inline-block;
  padding: 14px 28px;
  text-decoration: none;
  border-radius: 8px;
  font-weight: bold;
  font-size: 15px;
  transition: all 0.3s ease;
  border: none;
}

.back-button {
  background: linear-gradient(135deg, rgba(0, 198, 255, 0.2) 0%, rgba(0, 147, 255, 0.2) 100%);
  color: #00c6ff;
  border: 2px solid #00c6ff;
  box-shadow: 0 0 15px rgba(0, 198, 255, 0.3);
}

.back-button:hover {
  background: linear-gradient(135deg, rgba(0, 198, 255, 0.4) 0%, rgba(0, 147, 255, 0.4) 100%);
  color: #fff;
  transform: translateY(-3px);
  box-shadow: 0 0 25px #00c6ff, 0 0 40px rgba(0, 198, 255, 0.5);
}

.track-again-button {
  background: linear-gradient(135deg, #00c6ff 0%, #0093ff 100%);
  color: #000;
  box-shadow: 0 0 15px rgba(0, 198, 255, 0.3);
}

.track-again-button:hover {
  background: linear-gradient(135deg, #fff 0%, #00e5ff 100%);
  transform: translateY(-3px);
  box-shadow: 0 0 25px #00c6ff, 0 0 40px rgba(0, 198, 255, 0.5);
}

.info-message {
  background: rgba(0, 30, 60, 0.5);
  padding: 15px;
  border-radius: 8px;
  border-left: 4px solid #00c6ff;
  margin-top: 20px;
  font-size: 13px;
  line-height: 1.6;
  color: #a0d7ff;
  text-align: left;
}
</style>
</head>
<body>
<div class="container">
  <div class="tracking-icon">📌</div>
  
  <h2>Report Tracking Status</h2>

  <div class="info-card">
    <div class="info-row">
      <span class="info-label">Reference Code:</span>
      <span class="info-value reference-code"><%= request.getAttribute("referenceCode") %></span>
    </div>
    
    <div class="info-row">
      <span class="info-label">Current Status:</span>
      <span class="info-value">
        <%
          String status = (String) request.getAttribute("status");
          String statusClass = "";
          if (status != null) {
            if (status.equals("Submitted")) {
              statusClass = "status-submitted";
            } else if (status.equals("In Progress")) {
              statusClass = "status-progress";
            } else if (status.equals("Resolved")) {
              statusClass = "status-resolved";
            } else if (status.equals("Closed")) {
              statusClass = "status-closed";
            }
          }
        %>
        <span class="status-badge <%= statusClass %>"><%= status %></span>
      </span>
    </div>
  </div>

  <div class="info-message">
    💡 Your report is being handled with complete confidentiality. Check back regularly for updates on your case status.
  </div>

  <div class="divider"></div>

  <div class="button-container">
    <a href="index.html" class="back-button">← Go Back Home</a>
    <a href="track.jsp" class="track-again-button">Track Another Report</a>
  </div>
</div>
</body>
</html>