<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="inventariojeans.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>

<%

	String txtEmailAddress = request.getParameter("txtEmailAddress");
	String txtAsunto = request.getParameter("txtAsunto");
	String txtMensaje = request.getParameter("txtMensaje");

	MailServices mailservices = new MailServices();
	
	mailservices.sendMailInJava(txtMensaje, txtEmailAddress, txtAsunto);
	
	response.sendRedirect("notificacion.jsp");
	
%>
