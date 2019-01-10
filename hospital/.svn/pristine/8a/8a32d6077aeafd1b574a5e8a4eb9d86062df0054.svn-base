package com.chinasoft.dao;

import java.sql.ResultSet;
import java.util.List;

import com.chinasoft.entity.ChuFang;
import com.chinasoft.entity.Guahao;

public interface IGuahao {
	List<Guahao> queryGuahaosByPage(int currentPage,int pageSize);
	List<Guahao> queryAllGuahao();
	Guahao queryGuahaoById(int id);
	
	boolean addGuahao(Guahao g);
	boolean delGuahaoByGuahaoId(int id);
	boolean updateGuahaoByGuahaoId(Guahao g);
	boolean isExistById(int id);
	//患者预约挂号
		boolean addGuahaoByPatient(int pid);
		//通过患者id查询挂号id
		ResultSet queryGidByPid(int pid);
	
}
