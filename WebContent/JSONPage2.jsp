<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
    import="java.sql.*"
    import="org.json.simple.*"
%>




<%
Connection con = null;
Statement stmt = null;
JSONArray jArray = new JSONArray();

try{
	String jdbcURL="jdbc:mysql://localhost:3306/locationdb";
	String dbID="root";
	String dbPW="1501"; //비밀번호 입력

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(jdbcURL,dbID,dbPW);
	
	
    stmt = con.createStatement();
    String strSQL="SELECT * FROM allstudentdata ORDER BY name DESC, date DESC ";
    ResultSet rs=stmt.executeQuery(strSQL);
    
    
    
    while(rs.next())
    {
    	JSONObject temp = new JSONObject();

    	temp.put("classID",rs.getString("classID"));        
    	temp.put("name",rs.getString("name"));
    	temp.put("coordinate_x",rs.getInt("coordinate_x"));
    	temp.put("coordinate_y", rs.getInt("coordinate_y"));
    	temp.put("date", rs.getString("date"));
    	
    	jArray.add(0, temp);
    	
    }
   
   out.println(jArray.toJSONString());
    
	stmt.close();
	con.close();
}catch(Exception e){
    out.println(e);
}
%>
