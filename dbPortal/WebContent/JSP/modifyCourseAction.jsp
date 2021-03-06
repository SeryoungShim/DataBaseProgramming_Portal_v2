<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="course.CourseDTO"%>
<%@ page import="course.CourseDAO"%>
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
	
	String category = null; 
	String major = null; 
	int credit = -1; 
	int PF = -1; 
	int cyber = -1; 
	String courseName = null; 
	int courseNo = -1;
	
	if(request.getParameter("courseNo") != null) {
		
		try {
			courseNo = Integer.parseInt(request.getParameter("courseNo"));
		} catch(Exception e){
			System.out.println("강의 번호 오류");
		}
		System.out.println(courseNo);
	}
	
	if(request.getParameter("courseName") != null) {
		courseName = request.getParameter("courseName");
		System.out.println(courseName);
	}
	if(request.getParameter("major") != null) {
		major = request.getParameter("major");
		System.out.println(major);
	}
	if(request.getParameter("credit") != null) {
		
		try {
			credit = Integer.parseInt(request.getParameter("credit"));
		} catch(Exception e){
			System.out.println("학점 데이터 오류");
		}
		System.out.println(credit);
	}
	
	if(request.getParameter("PF") != null) {
		
		try {
			PF = Integer.parseInt(request.getParameter("PF"));
		} catch(Exception e){
			System.out.println("PF 데이터 오류");
		}
		System.out.println(PF);
	}
	
	if(request.getParameter("cyber") != null) {
		try {
			cyber = Integer.parseInt(request.getParameter("cyber"));
		} catch(Exception e){
			System.out.println("사이버 데이터 오류");
		}
		System.out.println(cyber);
	}
	
	if(request.getParameter("category") != null) {
		
		category = request.getParameter("category");
		System.out.println("cate" + category);
	}
	
	if (courseName == null || category == null || major == null || 
			PF == -1 || cyber == -1 || credit == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return ;
	} else {
		CourseDAO courseDAO = new CourseDAO();
		int result = courseDAO.modify(new CourseDTO(category, major, credit, PF, cyber, courseName, courseNo));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('강의 수정 실패');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} 
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복 강의 존재');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}	else {
			session.setAttribute("usrID", usrID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'insertionCourse.jsp';");
			script.println("</script>");
			script.close();
		}
	}
%>
