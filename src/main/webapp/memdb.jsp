<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%!
   Connection connection;
   Statement statement;
   ResultSet resultSet;
   
   String driver = "oracle.jdbc.driver.OracleDriver";
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String uid = "user1";
   String upw = "tiger";
   String query = "select * from test";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memdb.jsp</title>
</head>
<body>
   <%
      try{ 
         // 실행하는 곳
         Class.forName(driver);
         connection = DriverManager.getConnection(url, uid, upw);
         statement = connection.createStatement();
         resultSet = statement.executeQuery(query);
         
         while(resultSet.next()){
            String name = resultSet.getString("name");
            String id = resultSet.getString("id");
            String pw = resultSet.getString("pw");
            String hobby = resultSet.getString("hobby");
            String major = resultSet.getString("major");
            
            out.println("이름 : " + name + "<br/>");
            out.println("아이디 : " + id + "<br/>");
            out.println("비밀번호 : " + pw + "<br/>");
            out.println("취미 : " + hobby + "<br/>");
            out.println("전공 : " + major + "<br/>");
            out.println("==============================<br/>");
         }
         
      } catch(Exception e){
         // 에러나면 실행
      } finally{
         // 무조건 실행
         try {
            if(resultSet != null) resultSet.close();
            if(statement!= null) statement.close();
            if(connection != null) connection.close();
         } catch(Exception e){
            
         }
      }
   
   %>
</body>
</html>