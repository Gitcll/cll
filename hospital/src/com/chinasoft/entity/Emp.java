package com.chinasoft.entity;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 
 * @author Administrator1
 *Ա����
 */




public class Emp {

	private int e_id;               //�û���� 
	private String username;   		//�û�����
	private String userlogin; 		//�û���¼��
	private String userpwd;			//�û���¼����
	private String hiredate;			//�û���ְ����
	private String sex;				//�û��Ա�
	private int age;				//�û�����
	private  String education;		//�û�ѧ��
	private  String addr;			//�û���ַ
	private  String iphone;			//�û���ַ
	private  int d_id;				//�û�����id
	private  int q_id;				//�û�Ȩ��id
	private String usertype;  		//�û�����
	private String pos;				//�û�ְ��
	
	public Emp() {
		super();
	}
    
	public Emp(int e_id, String username, String userlogin, String userpwd,
			String hiredate, String sex, int age, String education, String addr,
			String iphone, int d_id, int q_id, String usertype, String pos) {
		super();
		this.e_id = e_id;
		this.username = username;
		this.userlogin = userlogin;
		this.userpwd = userpwd;
		this.hiredate = hiredate;
		this.sex = sex;
		this.age = age;
		this.education = education;
		this.addr = addr;
		this.iphone = iphone;
		this.d_id = d_id;
		this.q_id = q_id;
		this.usertype = usertype;
		this.pos = pos;
	}

	public Emp(String username, String userlogin, String userpwd
			) {
		super();
		this.username = username;
		this.userlogin = userlogin;
		this.userpwd = userpwd;
	}
	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserlogin() {
		return userlogin;
	}

	public void setUserlogin(String userlogin) {
		this.userlogin = userlogin;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getIphone() {
		return iphone;
	}

	public void setIphone(String iphone) {
		this.iphone = iphone;
	}

	public int getD_id() {
		return d_id;
	}

	public void setD_id(int d_id) {
		this.d_id = d_id;
	}

	public int getQ_id() {
		return q_id;
	}

	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getPos() {
		return pos;
	}

	public void setPos(String pos) {
		this.pos = pos;
	}

	@Override
	public String toString() {
		return "Emp [e_id=" + e_id + ", username=" + username + ", userlogin="
				+ userlogin + ", userpwd=" + userpwd + ", hiredate=" + hiredate
				+ ", sex=" + sex + ", age=" + age + ", education=" + education
				+ ", addr=" + addr + ", iphone=" + iphone + ", d_id=" + d_id
				+ ", q_id=" + q_id + ", usertype=" + usertype + ", pos=" + pos
				+ "]";
	}
	
	
	
	
}
