<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" isErrorPage="true" %>
<%@ page import="java.io.*"%>

<html><head>
    <!--[if lt IE 7.]>
    <script defer type="text/javascript" src="script/pngfix.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="style/default.css" type="text/css"/>
</head>

<body>
<h1><img src="icons/error.png" alt=""/> Error</h1>

<p>
    Supersonic encountered an internal error. You can report this error in the project's 
    <a href="https://github.com/mach5/supersonic/issues" target="_blank">Github issues</a>.
    Please include the information below.
</p>

<%
    StringWriter sw = new StringWriter();
    exception.printStackTrace(new PrintWriter(sw));

    long totalMemory = Runtime.getRuntime().totalMemory();
    long freeMemory = Runtime.getRuntime().freeMemory();
    long usedMemory = totalMemory - freeMemory;
%>

<table class="ruleTable indent">
    <tr><td class="ruleTableHeader">Exception</td>
        <td class="ruleTableCell"><%=exception.getClass().getName()%></td></tr>
    <tr><td class="ruleTableHeader">Message</td>
        <td class="ruleTableCell"><%=exception.getMessage()%></td></tr>
    <tr><td class="ruleTableHeader">Java version</td>
        <td class="ruleTableCell"><%=System.getProperty("java.vendor") + ' ' + System.getProperty("java.version")%></td></tr>
    <tr><td class="ruleTableHeader">Operating system</td>
        <td class="ruleTableCell"><%=System.getProperty("os.name") + ' ' + System.getProperty("os.version")%></td></tr>
    <tr><td class="ruleTableHeader">Server</td>
        <td class="ruleTableCell"><%=application.getServerInfo()%></td></tr>
    <tr><td class="ruleTableHeader">Memory</td>
        <td class="ruleTableCell">Used <%=usedMemory/1024L/1024L%> of <%=totalMemory/1024L/1024L%> MB</td></tr>
    <tr><td class="ruleTableHeader" style="vertical-align:top;">Stack trace</td>
        <td class="ruleTableCell" style="white-space:pre"><%=sw.getBuffer()%></td></tr>
</table>

</body>
</html>
