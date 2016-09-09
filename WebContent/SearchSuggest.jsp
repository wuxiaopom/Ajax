<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.yc.util.*,java.sql.*,java.util.*" %>
<%
		BaseDao bd = new BaseDao();
        Connection conn = null;
        PreparedStatement stmt = null;
		ResultSet rs = null;
		String str = request.getParameter("search");
		System.out.println(str);
		List strList=new ArrayList();
		
		String sql = "  select distinct(n.ncontent) from news n where n.ncontent like '"+str+"%' order by n.ntid ";
		
		try{
		if(str!=null&str.length()>0){
			conn = bd.getConnection();
			stmt = conn.prepareStatement(sql);
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				strList.add(rs.getString("ncontent"));				
			}
			StringBuffer sbu=new StringBuffer();
			int size = strList.size();
			for(int i=0;i<size;i++){
				sbu.append((String)strList.get(i)+"-");
			}
				out.print(sbu.toString());
				out.flush();
		   }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			bd.closeAll(conn, stmt, rs);
		}
%>