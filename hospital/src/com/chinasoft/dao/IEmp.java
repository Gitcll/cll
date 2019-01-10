package com.chinasoft.dao;

import java.sql.ResultSet;
import java.util.List;

import com.chinasoft.entity.Emp;

public interface IEmp {
	

	List<Emp> queryAllUsers();                                  //查询所有用户
	List<Emp> queryUSerById(int e_id);								//通过Id查询
	Emp queryByUserNameAndUserPass(Emp emp);     //通过用户名和密码
	List<Emp> queryEmpByName(String ename);		//通过医生名字查询医生信息
	
	boolean addUser(Emp emp);       				//添加用户
	boolean delUserByUserId(int e_id);             //删除加用户
	boolean updateUserByUserId(Emp emp);			 //修改加用户
	boolean isExistById(int e_id);					//查询用户
	
	ResultSet queryUsersByPage(int start,int end);   //分页查询
	public ResultSet findCount(); //查询总数;
	
	Emp registered(Emp emp);       				//注册用户
	
}
