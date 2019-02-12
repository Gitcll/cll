package com.chinasoft.entity;

/**
 * 
 * @author Administrator
 *���߱� 
 */
public class Patient {

	//����id
	private int pid;
	//��������
	private String patientName;
	//���ߵ�¼��
	private String pLoginName;
	//���ߵ�¼����
	private String pLoginPwd;
	//�����Ա�
	private String patientSex;
	//��������
	private int patientAge;
	//����סַ
	private String patientAdd;
	//������ϵ��ʽ
	private String patientPhoneNum;
	//�Ƿ�סԺ
	private String zhuyuan;
	//�Һ�id
	private int guahaoId;
	//����id
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
