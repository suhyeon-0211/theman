package com.theman.menu.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theman.menu.dao.MenuDAO;
import com.theman.menu.model.Menu;
import com.theman.menu.model.ServiceType;

@Service
public class MenuBO {

	@Autowired
	private MenuDAO menuDAO;
	
	public List<ServiceType> getType() {
		return menuDAO.getType();
	}
	
	public void deleteMenuType(List<Integer> deleteMenuList) {
		menuDAO.deleteMenuType(deleteMenuList);
	}
	
	public void insertMenuType(List<String> menuList) {
		menuDAO.insertMenuType(menuList);
	}
	
	public void insertSpecificMenu(int typeId, String specificMenu, int price, int requiredTime) {
		menuDAO.insertSpecificMenu(typeId, specificMenu, price, requiredTime);
	}
	
	public List<Menu> getMenu() {
		return menuDAO.selectMenu();
	}
	
	public void deleteSpecificMenu(int id) {
		menuDAO.deleteSpecificMenu(id);
	}
	
	public void deleteSpecificMenuByTypeId(List<Integer> deleteMenuList) {
		menuDAO.deleteSpecificMenuByTypeId(deleteMenuList);
	}
	
	public void updateSpecificMenu(int id, int typeId, String specificMenu, int price, int requiredTime) {
		menuDAO.updateSpecificMenu(id, typeId, specificMenu, price, requiredTime);
	}
}
