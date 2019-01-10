package com.chinasoft.entity;

public class Liuyan {
	
	private String id;
	private String message;
	public Liuyan(String id, String message) {
		super();
		this.id = id;
		this.message = message;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Liuyan [id=" + id + ", message=" + message + "]";
	}
	
	
}	
