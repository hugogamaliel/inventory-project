<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="inventariojeans.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>

<%

	String txtMensaje = request.getParameter("txtMensaje");
	String txtSaldoForm = request.getParameter("txtSaldoForm");

	SendSMS smsservices = new SendSMS();
	
	//smsservices.sendSMS(txtMensaje, txtSaldoForm);
	smsservices.sendSMSToMe(txtMensaje, "");
	
	response.sendRedirect("notificacion_sms.jsp");
	
%>
