package com.chinasoft.service;

import java.util.List;

import com.chinasoft.entity.Emp;
import com.chinasoft.entity.EmpAndKeshi;

public interface IEmpService {

	public int getTotalCount();
	public List<Emp> queryEmpByPage(int currentPage, int pageSize);
	
	public List<EmpAndKeshi> queryDoctorByKeshi(int k_id); //根据科室查询所有医生信息
	public EmpAndKeshi queryPosByKeshi(int k_id);     //查询科室中职位为副主任医师的医生信息
}
