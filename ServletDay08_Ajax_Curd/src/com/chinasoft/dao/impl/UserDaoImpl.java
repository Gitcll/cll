package com.chinasoft.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.chinasoft.dao.IUserDao;
import com.chinasoft.entity.User;
import com.chinasoft.util.DBUtil;


public class UserDaoImpl implements IUserDao {

	private Connection conn = DBUtil.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	@Override
	public ResultSet findAll() {
		 
		try {
			pstmt = conn.prepareStatement("select  * from user");
			rs = pstmt.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ResultSet findById(String id) {
		try {
			pstmt = conn.prepareStatement("select  * from user where id = '"+id+"'");
			rs = pstmt.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addUser(User user) {
		
		try {
			pstmt = conn.prepareStatement("insert into user(id,name,pwd) values (?,?,?)");
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPwd());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
	}

}
