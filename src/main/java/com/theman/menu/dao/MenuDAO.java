package com.theman.menu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.theman.menu.model.Menu;
import com.theman.menu.model.ServiceType;

@Repository
public interface MenuDAO {
	public List<ServiceType> getType();
	public void deleteMenuType(List<Integer> deleteMenuList);
	public void insertMenuType(List<String> menuList);
	public void insertSpecificMenu(
			@Param("typeId") int typeId,
			@Param("specificType") String specificType,
			@Param("price") int price,
			@Param("requiredTime") int requiredTime);
	public List<Menu> selectMenu();
	public void deleteSpecificMenu(int id);
	public void deleteSpecificMenuByTypeId(List<Integer> deleteMenuList);
	public void updateSpecificMenu(
			@Param("id") int id,
			@Param("typeId") int typeId,
			@Param("specificType") String specificType,
			@Param("price") int price,
			@Param("requiredTime") int requiredTime);
	public Menu selectMenuById(int id);
}
