package com.chinasoft.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.chinasoft.dao.IGuahao;
import com.chinasoft.entity.Guahao;
import com.chinasoft.util.DBUtil;
import java.sql.PreparedStatement;
public class GuahaoDaoImpl implements IGuahao {
	private  Connection conn = DBUtil.getConnection();
	List<Guahao> list=new ArrayList<Guahao>();
	private ResultSet rs=null;
	private  PreparedStatement pstmt=null;
	int flag=0;
	@Override
	public List<Guahao> queryGuahaosByPage(int currentPage, int pageSize) {	
		return null;
	}
//��ѯ���еĹҺż�¼
	@Override
	public List<Guahao> queryAllGuahao() {
		
		String sql="select * from guahao";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Guahao g=new Guahao(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5));
				list.add(g);
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return list;
	}
//ͨ���Һű�Ų�ѯ�Һż�¼
	@Override
	public Guahao queryGuahaoById(int id) {
		String sql="select * from guahao where g_id="+id;
		
		Guahao g=null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
			g=new Guahao(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return g;
	}
//���ӹҺż�¼
	@Override
	public boolean addGuahao(Guahao g) {
		
		String sql="insert into guahao values(?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, g.getG_id());
			pstmt.setString(2,g.getGh_date());
			pstmt.setString(3, g.getStatus());
			pstmt.setString(4, g.getGrade());
			pstmt.setInt(5, g.getVisit());
			flag=pstmt.executeUpdate();
			if(flag>0){
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
//ɾ���Һż�¼
	@Override
	public boolean delGuahaoByGuahaoId(int id) {
		
		String sql="delete from guahao where g_id="+id;
		try {
			pstmt=conn.prepareStatement(sql);
			flag=pstmt.executeUpdate();
			if(flag>0){
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
//�޸ĹҺż�¼
	@Override
	public boolean updateGuahaoByGuahaoId(Guahao g) {
		
		String sql="update guahao set gh_date=?,status=?,grade=?,visit=? where g_id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, g.getGh_date());
			pstmt.setString(2, g.getStatus());
			pstmt.setString(3, g.getGrade());
			pstmt.setInt(4, g.getVisit());
			pstmt.setInt(5,g.getG_id());
			flag=pstmt.executeUpdate();
			if(flag>0){
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
//���ҹҺż�¼�Ƿ����
	@Override
	public boolean isExistById(int id) {
		
		String sql="select * from guahao where id="+id;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return false;
	}
	//��ȡ���������
	public int maxGuahaoId(){		
		try {
			pstmt=conn.prepareStatement("select max(g_id) from guahao");
			rs=pstmt.executeQuery();
			while(rs.next()){
				flag=rs.getInt(1);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return flag;
	}
	//
	public ResultSet findCount(){		
		try {
			pstmt=conn.prepareStatement("select count(1) co from guahao");			
			return pstmt.executeQuery();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	//��ҳ��ѯ
	public ResultSet find(int start,int end){
		
		try {
			pstmt=conn.prepareStatement("select * from guahao u limit "+start+","+end);
			
			return pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	//����ԤԼ�Һ�
		@Override
		public boolean addGuahaoByPatient(int pid) {
			String sql="insert into guahao(grade,visit) values('ר��',?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pid);
				int result = pstmt.executeUpdate();
				if(result>0){
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		//ͨ������id��ѯ�Һ�id
		@Override
		public ResultSet queryGidByPid(int pid) {

			String sql = "select g_id g from guahao where visit=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pid);
				rs = pstmt.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return rs;
		}

}
