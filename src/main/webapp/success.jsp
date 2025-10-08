<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Report Submitted</title>
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
  max-width: 550px;
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

.success-icon {
  font-size: 80px;
  color: #00c6ff;
  margin-bottom: 20px;
  animation: pulse 2s infinite;
  text-shadow: 0 0 20px #00c6ff, 0 0 40px #00c6ff;
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
  font-size: 28px;
  margin: 0 0 20px 0;
  text-shadow: 0 0 10px #00c6ff, 0 0 20px #0093ff;
}

p {
  font-size: 15px;
  line-height: 1.7;
  color: #e0f7ff;
  margin-bottom: 20px;
}

.reference {
  font-size: 32px;
  font-weight: bold;
  color: #00c6ff;
  margin: 30px 0;
  padding: 25px;
  background: rgba(0, 40, 80, 0.7);
  border-radius: 12px;
  border: 2px solid #00c6ff;
  box-shadow: 0 0 20px rgba(0, 198, 255, 0.4);
  letter-spacing: 3px;
  font-family: 'Courier New', monospace;
  text-shadow: 0 0 10px #00c6ff;
  animation: glow 2s ease-in-out infinite;
}

@keyframes glow {
  0%, 100% {
    box-shadow: 0 0 20px rgba(0, 198, 255, 0.4);
  }
  50% {
    box-shadow: 0 0 30px rgba(0, 198, 255, 0.6), 0 0 40px rgba(0, 198, 255, 0.4);
  }
}

.warning-note {
  background: rgba(255, 193, 7, 0.1);
  border: 1px solid #ffc107;
  border-left: 4px solid #ffc107;
  padding: 15px;
  border-radius: 8px;
  margin: 25px 0;
  font-size: 14px;
  color: #ffd54f;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
}

.warning-note::before {
  content: '⚠️';
  font-size: 20px;
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
  background: linear-gradient(135deg, #00c6ff 0%, #0093ff 100%);
  color: #000;
  text-decoration: none;
  border-radius: 8px;
  font-weight: bold;
  font-size: 15px;
  transition: all 0.3s ease;
  box-shadow: 0 0 15px rgba(0, 198, 255, 0.3);
  border: none;
}

a:hover {
  background: linear-gradient(135deg, #fff 0%, #00e5ff 100%);
  transform: translateY(-3px);
  box-shadow: 0 0 25px #00c6ff, 0 0 40px rgba(0, 198, 255, 0.5);
}

a.secondary {
  background: linear-gradient(135deg, rgba(0, 198, 255, 0.2) 0%, rgba(0, 147, 255, 0.2) 100%);
  color: #00c6ff;
  border: 2px solid #00c6ff;
}

a.secondary:hover {
  background: linear-gradient(135deg, rgba(0, 198, 255, 0.4) 0%, rgba(0, 147, 255, 0.4) 100%);
  color: #fff;
}

.divider {
  height: 1px;
  background: linear-gradient(90deg, transparent, #00c6ff, transparent);
  margin: 25px 0;
}
</style>
</head>
<body>
<div class="container">
  <div class="success-icon">✓</div>
  
  <h2>Your Report Has Been Submitted Anonymously</h2>
  
  <p>Thank you for helping us fight harassment. Please <strong>save your Reference Code</strong> below to track the status of your report:</p>

  <div class="reference">
    <%= request.getAttribute("referenceCode") %>
  </div>

  <div class="warning-note">
    <strong>Note:</strong> Without this code, you will not be able to track your report.
  </div>

  <div class="divider"></div>

  <div class="button-container">
    <a href="index.html" class="secondary">← Go Back Home</a>
    <a href="track.jsp">Track Report →</a>
  </div>
</div>
</body>
</html>