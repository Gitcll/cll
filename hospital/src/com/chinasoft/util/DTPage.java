package com.chinasoft.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class DTPage {

	private static Connection  conn = DBUtil.getConnection();
	private static ResultSet rs = null;
	private static PreparedStatement pstmt = null; 
	
	public static int getTotalCount()
	{
		int count =-1;
		String sql = "select count(1) from emp";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
			count= 	rs.getInt(1);
			}
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
		
	}
	
}
