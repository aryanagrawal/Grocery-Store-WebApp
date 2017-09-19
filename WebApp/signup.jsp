<html>
	<head>
		<title>Customer Sign Up</title>
	</head>

	<body>
		<h4>Customer Sign Up Form</h4>
		<form name="signup" action="signup/submitForm.jsp">
		<table>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstname"></td>
			</tr>
			<tr>
				<td>Last Name</td>
                                <td><input type="text" name="lastname"></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><form name="gender">
					<input type="radio" name="gender" value="male"> Male
					<input type="radio" name="gender" value="female"> Female
				</form></td>	
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
                                <td>State</td>
                                <td><select name="state">
					<option value="AL">AL</option>
					<option value="AK">AK</option>
					<option value="AR">AR</option>	
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>	
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>	
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>	
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>			
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="ND">ND</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VT">VT</option>
					<option value="VA">VA</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>	
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select></td>
                        </tr>
			<tr>
                                <td>Zip</td>
                                <td><input type="text" name="zip"></td>
                        </tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>Choose a<br>Username</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Choose a<br>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr></tr>
			<tr><td><center><input type="submit" value="Submit"></input></center></td></tr>

		</table>
		</form>
	</body>
</html>
