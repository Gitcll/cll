package com.chinasoft.dao;

import java.sql.ResultSet;
import java.util.List;

import com.chinasoft.entity.Emp;

public interface IKeshi {
	

	List<Emp> queryAllUsers();                                  //��ѯ�����û�
	List<Emp> queryUSerById(int e_id);								//ͨ��Id��ѯ
	Emp queryByUserNameAndUserPass(Emp emp);     //ͨ���û���������

	boolean addUser(Emp emp);       				//�����û�
	boolean delUserByUserId(int e_id);             //ɾ�����û�
	boolean updateUserByUserId(Emp emp);			 //�޸ļ��û�
	boolean isExistById(int e_id);					//��ѯ�û�
	
	ResultSet queryUsersByPage(int start,int end);   //��ҳ��ѯ
	public ResultSet findCount(); //��ѯ����;
	
	Emp registered(Emp emp);       				//ע���û�
	
}