package com.chinasoft.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinasoft.dao.IChuFang;
import com.chinasoft.entity.ChuFang;
import com.chinasoft.util.DBUtil;

public class ChuFangDaoImpl implements IChuFang{
	private Connection conn = DBUtil.getConnection();
	List<ChuFang> list = new ArrayList<ChuFang>();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	int flag = 0;
	int line;
	@Override
	public ResultSet queryChuFangsByPage(int start, int end) {
		try {
			pstmt = conn.prepareStatement( "select * from chufang c limit "+start+","+end);
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	@Override
	public List<ChuFang> queryAllChuFangs() {
		try {
			pstmt = conn.prepareStatement("select * from chufang");
			rs = pstmt.executeQuery();
			while(rs.next()){
				ChuFang cf = new ChuFang();
				cf.setC_id(rs.getInt(1));
				cf.setChu_date(rs.getString(2));
				cf.setDiagnosis(rs.getString(3));
				cf.setContent(rs.getString(4));
				list.add(cf);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public ChuFang queryChuFangById(int c_id) {
		ChuFang cf=null;
		try {
			pstmt = conn.prepareStatement("select * from chufang where c_id=?");
			rs = pstmt.executeQuery();
			while(rs.next()){
				 cf = new ChuFang(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
			}
			return cf;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	@Override
	public boolean addChuFang(ChuFang c) {
		try {
			pstmt = conn.prepareStatement("insert into chufang values(?,?,?,?)");
			pstmt.setInt(1,c.getC_id());
			pstmt.setString(2,c.getChu_date());
			pstmt.setString(3,c.getDiagnosis());
			pstmt.setString(4,c.getContent());
		    flag = pstmt.executeUpdate();
		    if(flag <= 0){
		    	return false;
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
	@Override
	public boolean delChuFangByChuFangId(int c_id) {
		try {
			pstmt = conn.prepareStatement("delete from chufang where c_id=?");
			pstmt.setInt(1,c_id);
			pstmt.executeUpdate();
			 flag = pstmt.executeUpdate();
			    if(flag >0){
			    	return true;
			    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean updateChuFang(ChuFang c) {
		try {
			pstmt = conn.prepareStatement("update chufang set c_id=?,chu_date=?,diagnosis=?,content=?");
			pstmt.setInt(1,c.getC_id());
			pstmt.setString(2,c.getChu_date());
			pstmt.setString(3,c.getDiagnosis());
			pstmt.setString(4,c.getContent());
			pstmt.executeUpdate();
			flag = pstmt.executeUpdate();
			    if(flag >0){
			    	return true;
			    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	@Override
	public boolean isExistById(int c_id) {
		try {
			pstmt = conn.prepareStatement("select * from chufang where c_id=?");
			rs = pstmt.executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	/*public ResultSet find(int start, int end) {
		 
		try {
			pstmt = conn.prepareStatement("select * from chufang c limit "+start+","+end);
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}*/
	public int maxID()
	{	
		
		String sql = "select max(c_id) from chufang";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
		    line = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return line;
	}
	public ResultSet findCount() {
		 try {
			pstmt = conn.prepareStatement("select count(1)  co  from chufang" );
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return null;
	}
	public ResultSet find(int start, int end) {
		 
		try {
			pstmt = conn.prepareStatement("select * from chufang c limit "+start+","+end);
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
