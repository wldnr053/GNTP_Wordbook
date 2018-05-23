<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="kr.or.gntp.db.DBConnectionUseBean" scope="page"></jsp:useBean>
<jsp:useBean id="login" class="kr.or.gntp.db.TBL_Member" scope="page">
<jsp:setProperty name="login" property="*"/>
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Check</title>
</head>
<body>
<%
	db.getDBConnection();
	String id = login.getUserID();
	if(login.checkAdmin(db)){
		%><script type="text/javascript">
			location.href="adminHome.jsp";
			</script><%
	}else if(login.checkLogin()){
		%>
			<jsp:include page="home.jsp">
			<jsp:param name="userID" value="<%=id%>" />
			</jsp:include>
		<%
	}else{
		%><script type="text/javascript">
			location.href="loginfail.jsp";
			</script><%
	}
	login.checkLogin();
	db.closeDBConnection();
%>
</body>
</html>