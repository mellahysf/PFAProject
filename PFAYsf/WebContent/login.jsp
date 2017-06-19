
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>
     	<link rel="stylesheet" href="./assets/css/style.css">
        <title>Login Page</title>
    </head>    
    <body>
    <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
			<form id="form" name="form" method="post" action="LoginServlet">
				<% if(request.getAttribute("error") != null) 
                    {%>
    			<div class="error">Error !!  <%=request.getAttribute("error") %>.</div>
					<%}%> <br>
				<div class="group">
					<label for="user" class="label">User Id</label>
					<input id="user" type="text" class="input" name="userId">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" data-type="password" name="password">
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign In">
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="#forgot">Forgot Password?</a>
				</div>
			</form>
			</div>
			<div class="sign-up-htm">
				<form id="form" name="form" method="post" action="RegisterServlet">
				<div class="group">
					<label for="user" class="label">First Name</label>
					<input id="user" type="text" class="input" name="firstName">
				</div>
				<div class="group">
					<label for="pass" class="label">Last Name</label>
					<input id="pass" type="text" class="input" name="lastName">
				</div>
				<div class="group">
					<label for="pass" class="label">Email</label>
					<input id="pass" type="email" class="input"  name="email">
				</div>
				<div class="group">
					<label for="pass" class="label">User Id</label>
					<input id="pass" type="text" class="input" name="userId">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" data-type="password" name="password">
				</div>
				<div class="group">
					<label for="pass" class="label">Status</label>
					<input class="ra" type="radio" name="gender" value="admin"> Admin<br>
	  			 	<input class="ra" type="radio" name="gender" value="prof"> Prof<br>
	 			 	<input class="ra" type="radio" name="gender" value="etudiant"> Etudiant
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign Up">
				</div>
				
				
				</form>
			</div>
		</div>
	</div>
</div>
  
  
</body>
</html>
