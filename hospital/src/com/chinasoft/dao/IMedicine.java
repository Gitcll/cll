package com.chinasoft.dao;

import java.util.List;

import com.chinasoft.entity.Medicine;

public interface IMedicine {
	
	List<Medicine> queryMedicineByPage(int currentPage,int pageSize);//分页查询
	List<Medicine> queryAllMedicine();//查询所有药品
	List<Medicine> queryMedicineById(int id);//通过药品id查询
	Medicine queryByName(String mname);//通过药品名称查询
	
	boolean addMedicine(Medicine u);//新增药品
	boolean delMedicineByid(int id);//删除药品
	boolean updateMedicineByid(Medicine u);//修改药品信息

	
}
