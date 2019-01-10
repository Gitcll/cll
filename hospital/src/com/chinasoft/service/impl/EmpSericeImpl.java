package com.chinasoft.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinasoft.entity.Emp;
import com.chinasoft.entity.EmpAndKeshi;
import com.chinasoft.service.IEmpService;
import com.chinasoft.util.DBUtil;

public class EmpSericeImpl implements IEmpService {

	private  Connection  conn = DBUtil.getConnection();
	private  ResultSet rs = null;
	private  PreparedStatement pstmt = null; 
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Emp> queryEmpByPage(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EmpAndKeshi> queryDoctorByKeshi(int k_id) {
		String sql = "SELECT *FROM (SELECT  e.e_id,e.username,e.userlogin,e.userpwd,e.hiredate,e.sex,e.age,e.education,e.addr,e.iphone,e.q_id,e.usertype,e.pos,ke.* FROM emp e,(SELECT k.*,d.d_name FROM keshi k,dept d WHERE k.d_id = d.d_id) ke WHERE e.k_id = ke.k_id) d WHERE k_id=? AND d_id=10";
		List<EmpAndKeshi> list = new  ArrayList<EmpAndKeshi>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, k_id);
			rs = pstmt.executeQuery();
			 while(rs.next())
			 {
				 EmpAndKeshi emp = new EmpAndKeshi(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getInt(11),rs.getString(12),rs.getString(13),rs.getInt(14),rs.getString(15),rs.getInt(16),rs.getString(17));
				 list.add(emp);
			 }
			 
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return list;
	}

	@Override
	public EmpAndKeshi queryPosByKeshi(int k_id) {
		String sql="SELECT d.e_id,d.username,d.sex,d.age,d.education,d.addr,d.iphone,d.pos,d.k_id,d.name,d.d_name FROM (SELECT  e.e_id,e.username,e.userlogin,e.userpwd,e.hiredate,e.sex,e.age,e.education,e.addr,e.iphone,e.q_id,e.usertype,e.pos,ke.* FROM emp e,(SELECT k.*,d.d_name FROM keshi k,dept d WHERE k.d_id = d.d_id) ke WHERE e.k_id = ke.k_id) d WHERE k_id=? AND d_id=10 AND pos='副主任医师'";
		EmpAndKeshi emp = new EmpAndKeshi();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, k_id);
			rs = pstmt.executeQuery();
			while(rs.next())
			 {
				 emp = new EmpAndKeshi(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),rs.getString(11));
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return emp;
	}
}
