package com.chinasoft.dao;

import java.sql.ResultSet;
import java.util.List;

import com.chinasoft.entity.Patient;

public interface IPatientDao {

	List<Patient> queryPatientByPage(int currentPage,int pageSize);
	ResultSet queryAllPatient();
	Patient queryUSerById(int pid);
	boolean queryByPatientNameAndPatientPwd(Patient patient);
	
	boolean registerUser(Patient p);
	boolean addUser(Patient p);
	boolean delPatientByPid(Patient p);
	boolean updatePatientByPid(Patient p);
	boolean isExistBypid(int pid);
	//通过id查询患者信息
	public List<Patient> queryPatientById(Patient p);
	//分页
	public ResultSet find(int start,int end);
	//查询总记录数
	public ResultSet findCount();
	//更新患者的挂号id
	boolean updateGidByPid(Patient p);
	//通过患者的登录名获取患者id
	public ResultSet queryPidByLoginName(String name);
	//List<Patient> queryPatientById(Patient p);
}
