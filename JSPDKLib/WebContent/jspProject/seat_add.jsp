<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8");%>

<% 
    Connection conn = null;
    PreparedStatement pstmt = null;

    String jdbc_driver = "com.mysql.jdbc.Driver";
    String jdbc_url= "jdbc:mysql://127.0.0.1:3306/student";
    

    try{
        Class.forName(jdbc_driver);

        conn = DriverManager.getConnection(jdbc_url,"root","1234");
        
        String sql="select seat_num, seat_option from libraryseat";
        pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
        
        boolean hasSameId=false;
        sql="insert into libraryseat values(?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,request.getParameter("seat_num"));
        pstmt.setString(2,request.getParameter("seat_option"));
        pstmt.setString(3,request.getParameter("seat_used"));
        pstmt.setString(4,request.getParameter("seat_used_id"));
        
        while(rs.next()){
            if(rs.getString("seat_num").equals(request.getParameter("seat_num"))){
                out.print("이미 동일한 seat_num 가 있습니다");
                hasSameId=true;
                break;
            }
        }
        
        if(!hasSameId&&request.getParameter("seat_num") !=null){
            pstmt.executeUpdate();
        }
    }
    catch(Exception e){
        System.out.println(e);
    }

%>
<HTML>
<HEAD><TITLE> 자리추가 </TITLE></HEAD>

<BODY>
<div align="center">
<H2>REGISTER</H2>
<HR>

<form name=form1 method=post action=seat_add.jsp>
seat_option  : <input type=text name=seat_option size=20>
registerName : <input type=text name=seat_num>
seat used : <input type=text name=seat_used>
seat used id : <input type=text name=seat_used_id>
<input type=submit value="register">
</form>
<HR>
</div>
#register list<P>
<% 
    try{
        String sql="select seat_num, seat_option,seat_used, seat_used_id from libraryseat";
        pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
        int i=1;

        while(rs.next()){
            out.println(rs.getString("seat_num")+"   번 좌석 옵션 "+":"+rs.getString("seat_option")+"seat id: "+rs.getString("seat_used")+"seat used id"+rs.getString("seat_used_id")+"<BR>");
            i++;
            
        }
        


        rs.close();
        pstmt.close();
        conn.close();
    }
    catch(Exception e){
        System.out.println(e);
    }
%>
<a href="librarySeat.jsp">좌석현황</a>
</BODY>
</HTML>