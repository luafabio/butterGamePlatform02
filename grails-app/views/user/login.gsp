<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main" />
<title>User Login</title>
</head>
<body>
		<div class="form-signin">
			<g:form action="doLogin" method="post">
				
				<h2 class="form-signin-heading">Ingresar a tu cuenta </h2>
				<g:if test="${flash.message}">
					<p class=" text-danger" style="font-size:20px">${flash.message}</p>
				</g:if>
				<label for="email" class="sr-only">E-mail</label>
				<input type="email" id="email" name="email" class="form-control" placeholder="Email" value='${user?.email}' required autofocus>
				<label for="password" class="sr-only">Contraseña</label>
				<input style="margin-top: 10px;" type="password" id="password" name="password" class="form-control" placeholder="Password" value='${user?.password}' required>
				
				<div class="buttons">
					<span class="formButton">
						<input class="btn btn-lg btn-primary btn-block" type="submit" value="Iniciar sesion"></input>
						<a href="${createLink(action: 'create')}" class="btn btn-primary btn-lg btn-block" role="button">Crear Cuenta</a>
					</span>
				</div>
			</g:form>
		</div>
	</body> 

</body>
</html>

N.B. This