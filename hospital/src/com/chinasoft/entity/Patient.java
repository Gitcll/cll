package com.chinasoft.entity;

/**
 * 
 * @author Administrator
 *患者表 
 */
public class Patient {

	//患者id
	private int pid;
	//患者姓名
	private String patientName;
	//患者登录名
	private String pLoginName;
	//患者登录密码
	private String pLoginPwd;
	//患者性别
	private String patientSex;
	//患者年龄
	private int patientAge;
	//患者住址
	private String patientAdd;
	//患者联系方式
	private String patientPhoneNum;
	//是否住院
	private String zhuyuan;
	//挂号id
	private int guahaoId;
	//处方id
	private int chufagnId;
	
	public Patient(int pid, String patientName, String pLoginName,
			String pLoginPwd, String patientSex, int patientAge,
			String patientAdd, String patientPhoneNum, String zhuyuan,
			int guahaoId, int chufagnId) {
		super();
		this.pid = pid;
		this.patientName = patientName;
		this.pLoginName = pLoginName;
		this.pLoginPwd = pLoginPwd;
		this.patientSex = patientSex;
		this.patientAge = patientAge;
		this.patientAdd = patientAdd;
		this.patientPhoneNum = patientPhoneNum;
		this.zhuyuan = zhuyuan;
		this.guahaoId = guahaoId;
		this.chufagnId = chufagnId;
	}
	public Patient(int pid, String patientName, String patientSex, int patientAge,
			String patientAdd, String patientPhoneNum, String zhuyuan,
			int guahaoId, int chufagnId) {
		super();
		this.pid = pid;
		this.patientName = patientName;
		this.patientSex = patientSex;
		this.patientAge = patientAge;
		this.patientAdd = patientAdd;
		this.patientPhoneNum = patientPhoneNum;
		this.zhuyuan = zhuyuan;
		this.guahaoId = guahaoId;
		this.chufagnId = chufagnId;
	}
	public Patient( String patientName, String patientSex, int patientAge,
			String patientAdd, String patientPhoneNum, String zhuyuan,
			int guahaoId, int chufagnId) {
		super();

		this.patientName = patientName;
		this.patientSex = patientSex;
		this.patientAge = patientAge;
		this.patientAdd = patientAdd;
		this.patientPhoneNum = patientPhoneNum;
		this.zhuyuan = zhuyuan;
		this.guahaoId = guahaoId;
		this.chufagnId = chufagnId;
	}
	
	
	
	public Patient(String patientName, String pLoginName, String pLoginPwd,
			String patientSex) {
		super();
		this.patientName = patientName;
		this.pLoginName = pLoginName;
		this.pLoginPwd = pLoginPwd;
		this.patientSex = patientSex;
	}
	public Patient(String pLoginName, String pLoginPwd) {
		super();
		this.pLoginName = pLoginName;
		this.pLoginPwd = pLoginPwd;
	}
	public Patient() {
		super();
		
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getpLoginName() {
		return pLoginName;
	}

	public void setpLoginName(String pLoginName) {
		this.pLoginName = pLoginName;
	}

	public String getpLoginPwd() {
		return pLoginPwd;
	}

	public void setpLoginPwd(String pLoginPwd) {
		this.pLoginPwd = pLoginPwd;
	}

	public String getPatientSex() {
		return patientSex;
	}

	public void setPatientSex(String patientSex) {
		this.patientSex = patientSex;
	}

	public int getPatientAge() {
		return patientAge;
	}

	public void setPatientAge(int patientAge) {
		this.patientAge = patientAge;
	}

	public String getPatientAdd() {
		return patientAdd;
	}

	public void setPatientAdd(String patientAdd) {
		this.patientAdd = patientAdd;
	}

	public String getPatientPhoneNum() {
		return patientPhoneNum;
	}

	public void setPatientPhoneNum(String patientPhoneNum) {
		this.patientPhoneNum = patientPhoneNum;
	}

	public String getZhuyuan() {
		return zhuyuan;
	}

	public void setZhuyuan(String zhuyuan) {
		this.zhuyuan = zhuyuan;
	}

	public int getGuahaoId() {
		return guahaoId;
	}

	public void setGuahaoId(int guahaoId) {
		this.guahaoId = guahaoId;
	}

	public int getChufagnId() {
		return chufagnId;
	}

	public void setChufagnId(int chufagnId) {
		this.chufagnId = chufagnId;
	}

	@Override
	public String toString() {
		return "patient [pid=" + pid + ", patientName=" + patientName
				+ ", pLoginName=" + pLoginName + ", pLoginPwd=" + pLoginPwd
				+ ", patientSex=" + patientSex + ", patientAge=" + patientAge
				+ ", patientAdd=" + patientAdd + ", patientPhoneNum="
				+ patientPhoneNum + ", zhuyuan=" + zhuyuan + ", guahaoId="
				+ guahaoId + ", chufagnId=" + chufagnId + "]";
	}

	
	
}

