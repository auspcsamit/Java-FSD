<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <!DOCTYPE html>
  <html>
    <head>
      <title>Session Expire</title>
      <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      />
      <style>
        /* CSS for the spinning gear image */
        .spinner {
          width: 40px;
          height: 40px;
          border: 5px solid #f3f3f3;
          border-top: 5px solid #3498db;
          border-radius: 50%;
          animation: spin 1s linear infinite;
          margin: 0 auto;
          margin-top: 100px;
        }

        /* CSS animation for the spinning gear image */
        @keyframes spin {
          0% {
            transform: rotate(0deg);
          }
          100% {
            transform: rotate(360deg);
          }
        }
      </style>
    </head>
    <body>
      <%--Redirect to admin login page after 2 seconds --%> <%
      response.setHeader("Refresh","3;URL=/");%>

      <h2>Session Expired! Redirecting to Home Page</h2>
      <body>
        <div class="spinner"></div>
      </body>
    </body>
  </html>
</html>
