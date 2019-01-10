package com.chinasoft.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinasoft.dao.IMedicine;
import com.chinasoft.entity.Medicine;
import com.chinasoft.util.DBUtil;


public class MedicineImpl implements IMedicine {
	
	private static Connection conn = DBUtil.getConnection();
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	int line;
	
	@Override
	public List<com.chinasoft.entity.Medicine> queryMedicineByPage(
			int currentPage, int pageSize) {
		
		return null;
	}

	@Override
	public List<com.chinasoft.entity.Medicine> queryAllMedicine() {
		List<Medicine> list = new ArrayList<Medicine>();
		String sql = "select * from medicine";
		try {
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Medicine m = new Medicine(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getDouble(6));
				list.add(m);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Medicine> queryMedicineById(int id) {
		List<Medicine> list = new ArrayList<Medicine>();
		String sql = "select * from medicine where m_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(new Medicine(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getDouble(6)));
		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Medicine queryByName(String mname) {
		Medicine MM = new Medicine();
		String sql = "select * from medicine where drugname = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,mname);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MM.setMid(rs.getInt(1));
				MM.setMname(rs.getString(2));
				MM.setNum(rs.getInt(3));
				MM.setNuit(rs.getString(4));
				MM.setDescp(rs.getString(5));
				MM.setPrice(rs.getDouble(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return MM;
	}

	@Override
	public boolean addMedicine(Medicine u) {
		String sql = "insert into Medicine values(?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u.getMid());
			pstmt.setString(2, u.getMname());
			pstmt.setInt(3, u.getNum());
			pstmt.setString(4, u.getNuit());
			pstmt.setString(5, u.getDescp());
			pstmt.setDouble(6, u.getPrice());
			int insert = pstmt.executeUpdate();
			if(insert<=0)
			{
				return false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}

	@Override
	public boolean delMedicineByid(int id) {
		String sql = "delete from medicine where m_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			int delete = pstmt.executeUpdate();
			if(delete<=0)
			{
				return false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}

	@Override
	public boolean updateMedicineByid(Medicine u) {
		String sql = "update medicine set drugname=?,num=?,unit=?,descp=?,price=? where m_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getMname());
			pstmt.setInt(2, u.getNum());
			pstmt.setString(3, u.getNuit());
			pstmt.setString(4, u.getDescp());
			pstmt.setDouble(5, u.getPrice());
			pstmt.setInt(6, u.getMid());
			int update = pstmt.executeUpdate();
			if(update<=0)
			{
				return false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
	
	public int maxID()
	{	
		
		String sql = "select max(m_id) from medicine";
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
			pstmt = conn.prepareStatement("select count(1)  co  from medicine" );
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public ResultSet find(int start, int end) {
		 
		try {
			pstmt = conn.prepareStatement("select * from medicine u  limit "+start+","+end);
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		MedicineImpl m = new MedicineImpl();
	}
}
