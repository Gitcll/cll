package com.chinasoft.test;

import com.chinasoft.dao.impl.EmpDaoImpl;
import com.chinasoft.entity.Emp;

public class EmpTest {

	public static void main(String[] args) {
		EmpDaoImpl dao = new EmpDaoImpl();
		
		
		System.out.println(dao.queryAllUsers());
	}
}
