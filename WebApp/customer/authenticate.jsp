<html>
    <head>
        <title>Authenticating...</title>
    </head>
    
    <jsp:useBean id="user" class="com.database.JDBC"/>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
    
        
        boolean authentication = user.authenticate(username, password);
        
        if(authentication){
            Object[] userDetails = (Object[]) user.getCustomerDetails(username);
            session.setAttribute("userDetails", userDetails);
            response.sendRedirect("options.jsp");
            // go to options.jsp
        } else{
            response.sendRedirect("http://localhost:8080/WebApp/customer.jsp?");
            // go back... something is wrong try again.
        }
        %>
</html>
