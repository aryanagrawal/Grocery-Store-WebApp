<html>
	<head>
		<title>Validating...</title>
	</head>

	<body>
		<jsp:useBean id="user" class="com.database.JDBC"/>
		<%
			String firstname = request.getParameter("firstname");
			String lastname  = request.getParameter("lastname");
			String gender    = request.getParameter("gender");
			String address   = request.getParameter("address");
			String city      = request.getParameter("city");
			String state     = request.getParameter("state");
			String zip       = request.getParameter("zip");
			String email     = request.getParameter("email");
			String username  = request.getParameter("username");
			String password  = request.getParameter("password");
			
			boolean output = user.validateUsername(username);
            //out.print("user validation: " + output);
            if(output){
                if(user.addUser(firstname,
                                lastname,
                                gender,
                                address,
                                city,
                                state,
                                zip,
                                email,
                                username,
                                password)){
                    response.sendRedirect("successSignUp.jsp");
                }
            } else{
                response.sendRedirect("http://localhost:8080/WebApp/signup.jsp?");
            }
		%>
	</body>

</html>
