package com.chinasoft.entity;
/**
 * 
 * @author Administrator
 *ҩƷ��
 */
public class Medicine {
	private int mid; //ҩƷ���
	private String mname;//ҩƷ����
	private int num;//ҩƷ����
	private String unit;//��λ
	private String descp;//ҩƷ˵��
	private double price;//ҩƷ�۸�
	public Medicine(int mid, String mname, int num, String unit, String descp,
			double price) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.num = num;
		this.unit = unit;
		this.descp = descp;
		this.price = price;
	}
	public Medicine() {
		super();
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNuit() {
		return unit;
	}
	public void setNuit(String unit) {
		this.unit = unit;
	}
	public String getDescp() {
		return descp;
	}
	public void setDescp(String descp) {
		this.descp = descp;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Medicine [mid=" + mid + ", mname=" + mname + ", num=" + num
				+ ", unit=" + unit + ", descp=" + descp + ", price=" + price
				+ "]";
	}
	
	
	
}
