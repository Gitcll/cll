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
	//ͨ��id��ѯ������Ϣ
	public List<Patient> queryPatientById(Patient p);
	//��ҳ
	public ResultSet find(int start,int end);
	//��ѯ�ܼ�¼��
	public ResultSet findCount();
	//���»��ߵĹҺ�id
	boolean updateGidByPid(Patient p);
	//ͨ�����ߵĵ�¼����ȡ����id
	public ResultSet queryPidByLoginName(String name);
	//List<Patient> queryPatientById(Patient p);
}
