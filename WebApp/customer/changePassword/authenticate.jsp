<html>
    <head>
        <title>Please Wait...</title>
    </head>
    
    <jsp:useBean id="user" class="com.database.JDBC"/>
    <%
        Object[] userDetails = (Object[]) session.getAttribute("userDetails");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String reNewPassword = request.getParameter("reNewPassword");
        

        
        if(newPassword.equals(reNewPassword) &&
            userDetails[1].equals(oldPassword) &&
            user.changePassword(userDetails[0].toString(), newPassword)){
            //user.changePassword(username, newPassword);
            response.sendRedirect("successChangePassword.jsp");
        } else{
            response.sendRedirect("http://localhost:8080/WebApp/customer/changePassword.jsp?");
        }
    %>

</html>
