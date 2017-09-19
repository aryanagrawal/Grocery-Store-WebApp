<jsp:useBean id="user" class="com.database.JDBC"/>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    session.setAttribute("username", username);
    session.setAttribute("password", password);
    
    if(user.authenticateManager(username, password)){
        response.sendRedirect("options.jsp");
    } else{
        response.sendRedirect("http://localhost:8080/WebApp/manager.jsp?");
    }
%>
