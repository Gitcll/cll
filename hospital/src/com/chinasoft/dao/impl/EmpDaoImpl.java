package com.chinasoft.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.chinasoft.dao.IEmp;
import com.chinasoft.entity.Emp;
import com.chinasoft.util.DBUtil;
import com.chinasoft.util.DTPage;

public class EmpDaoImpl implements IEmp {

	private static Connection  conn = DBUtil.getConnection();
	private static ResultSet rs = null;
	private static PreparedStatement pstmt = null; 
	private static int line;
	private static List<Emp> list = null;
	@Override
	public ResultSet queryUsersByPage(int start, int end) {
		String sql  = "select * from emp e limit "+start+","+end;
		try {
			pstmt = conn.prepareStatement(sql);
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null; 
	}
/*--------------------查询总记录数--------------*/
	@Override
	public ResultSet findCount() {
		String sql = "select count(1) co from emp";
		try {
			pstmt = conn.prepareStatement(sql);
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Emp> queryAllUsers() {
		List<Emp> list = new ArrayList<Emp>();

		try {
			String sql = "select * from emp";
			pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 while(rs.next())
			 {
				 Emp emp = new Emp(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getInt(11),rs.getInt(12),rs.getString(13),rs.getString(14));
				 list.add(emp);
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	//通过用户ID查询  --------------------------------------------------------------
	@Override
	public List<Emp> queryUSerById(int e_id) {
		String sql = "select * from emp where e_id = ?";
		List<Emp> list = new ArrayList<Emp>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, e_id);
			rs = pstmt.executeQuery();
			 while(rs.next())
			 {
				 Emp emp = new Emp(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getInt(11),rs.getInt(12),rs.getString(13),rs.getString(14));
				 list.add(emp);
			 }
			 
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return list;
	}

	@Override
	public Emp registered(Emp emp) {
		String sql = "insert into emp(username,userlogin,userpwd) values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emp.getUsername());
			pstmt.setString(2, emp.getUserlogin());
			pstmt.setString(3, emp.getUserpwd());
			int i =pstmt.executeUpdate();
			Emp emp1=new Emp();
			if(i == 1){
				emp1.setUsername(rs.getString(2));
				emp1.setUserlogin(rs.getString(3));
				emp1.setUserpwd(rs.getString(4));
				return emp1;
			}
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	@Override
	public Emp queryByUserNameAndUserPass(Emp emp) {
		String sql = "select * from emp where userlogin = ? and userpwd = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emp.getUserlogin());
			pstmt.setString(2, emp.getUserpwd());
			rs = pstmt.executeQuery();
			Emp emp1=new Emp();
			if(rs.next())
			{   
				emp1.setUsername(rs.getString(2));
				emp1.setUserlogin(rs.getString(3));
				emp1.setUserpwd(rs.getString(4));
				emp1.setUsertype(rs.getString(13));
				return emp1;
			}
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
	@Override
	public boolean addUser(Emp emp) {
		String sql = "insert into emp values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, emp.getE_id());
			pstmt.setString(2, emp.getUsername());
			pstmt.setString(3, emp.getUserlogin());
			pstmt.setString(4, emp.getUserpwd());
			pstmt.setString(5, emp.getHiredate());		
			pstmt.setString(6, emp.getSex());
			pstmt.setInt(7, emp.getAge());
			pstmt.setString(8, emp.getEducation());
			pstmt.setString(9, emp.getAddr());
			pstmt.setString(10, emp.getIphone());
			pstmt.setInt(11, emp.getD_id());
			pstmt.setInt(12, emp.getQ_id());
			pstmt.setString(13, emp.getUsertype());
			pstmt.setString(14, emp.getPos());
			int i=pstmt.executeUpdate();
			if(i==1){
				return true;
			}
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delUserByUserId(int e_id) {
		String sql = "delete from emp where e_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, e_id);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean updateUserByUserId(Emp emp) {
		String sql = "update emp set username = ?, userlogin = ?, userpwd = ?, hiredate = ?, sex = ?, age = ?, education = ?, addr = ?, iphone = ?, k_id = ?, q_id = ?, usertype = ?, pos = ? where e_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emp.getUsername());
			pstmt.setString(2, emp.getUserlogin());
			pstmt.setString(3, emp.getUserpwd());
			pstmt.setString(4, emp.getHiredate());
			pstmt.setString(5, emp.getSex());
			pstmt.setInt(6, emp.getAge());
			pstmt.setString(7, emp.getEducation());
			pstmt.setString(8, emp.getAddr());
			pstmt.setString(9, emp.getIphone());
			pstmt.setInt(10, emp.getD_id());
			pstmt.setInt(11, emp.getQ_id());
			pstmt.setString(12, emp.getUsertype());
			pstmt.setString(13, emp.getPos());
			pstmt.setInt(14, emp.getE_id());
			
			int i=pstmt.executeUpdate();
			if(i==1){
				return true;
			}
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean isExistById(int e_id) {

		String sql = "select * from emp where e_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, e_id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				return true;
			}
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	public static int maxE_id()
	{
		
		String sql = "select max(e_id) from emp";
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
	
	

	@Override
	public List<Emp> queryEmpByName(String ename) {
		List<Emp> list = new ArrayList<Emp>();
		String sql = "select * from emp where name = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				 Emp emp = new Emp(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getInt(11),rs.getInt(12),rs.getString(13),rs.getString(14));
				 list.add(emp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

}

}
