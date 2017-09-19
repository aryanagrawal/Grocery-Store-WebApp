<html>
    <head>
        <title>Manager Home</title>
    </head>
    
    <body><center>
        <h3>Manager Home Page</h3>
        
        <jsp:useBean id="user" class="com.database.JDBC"/>
        <%
            String username = (String)session.getAttribute("username");
            String password = (String)session.getAttribute("password");
            
     
            Object[] managerDetails = user.getEmployeeDetails(username);
            
            session.setAttribute("managerDetails", managerDetails);
        %>
        
        <!--// view profile-->
        <form action = "profile/viewProfile.jsp">
            <input type="submit" value="View Profile"/>
        </form>
        
        <!--
        // view stock
        // edit product
        // change price
        // restock
        // add product-->
        <form action = "stock/myStore.jsp">
            <input type="submit" value="My Store"/>
        </form>

        <!--// view employee
        // hire new employee
        // fire employee
        // edit employee
        // change salary
        // change position-->
        <form action = "employee/myEmployee.jsp">
            <input type="submit" value="Employee Section"/>
        </form>
        
        <!--// view order history-->
        <form action = "history/history.jsp">
            <input type="submit" value="View History"/>
        </form>
        
    </center></body>
</html>
