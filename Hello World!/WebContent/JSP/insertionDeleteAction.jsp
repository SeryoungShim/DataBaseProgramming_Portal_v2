<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="course.CourseDAO"%>
<%@ page import="likey.LikeyDTO"%>
<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");
	String usrID = null;
	
	if(session.getAttribute("user") != null){
		usrID = (String) session.getAttribute("user");
	}
	
	if(usrID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'login.jsp';");
		script.println("</script>");
		script.close();
		return ;
	}
	
	request.setCharacterEncoding("UTF-8");
	String courseNo = null;
	
	if(request.getParameter("courseNo") != null) {
		courseNo = request.getParameter("courseNo");
	}

	CourseDAO courseDAO = new CourseDAO();
		int result = new CourseDAO().delete(courseNo);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제가 완료되었습니다.');");
			script.println("location.href = 'insertionCourse.jsp';");
			script.println("</script>");
			script.close();
			return ;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return ;
		}
		

%>