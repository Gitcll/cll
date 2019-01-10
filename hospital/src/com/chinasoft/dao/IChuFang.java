package com.chinasoft.dao;

import java.sql.ResultSet;
import java.util.List;

import com.chinasoft.entity.ChuFang;
/*
 * 处方页面接口
 */
public interface IChuFang {

	
	ResultSet queryChuFangsByPage(int start,int end);//分页查询
	List<ChuFang> queryAllChuFangs();//查询所有信息
	ChuFang queryChuFangById(int c_id);//通过id查询信息
	
	boolean addChuFang(ChuFang c);//增加信息
	boolean delChuFangByChuFangId(int c_id);//通过id删除信息
	boolean updateChuFang(ChuFang c);//更改信息
	boolean isExistById(int c_id);//是否存在输入的id号
}
