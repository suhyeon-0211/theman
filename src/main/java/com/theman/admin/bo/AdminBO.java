package com.theman.admin.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theman.menu.bo.MenuBO;
import com.theman.menu.model.Menu;
import com.theman.menu.model.ServiceType;

@Service
public class AdminBO {
	
	@Autowired
	private MenuBO menuBO;
	
	public boolean isCorrectIdAndPassword(String loginId, String password) {
		String standardId = "admin";
		String standardPassword = "admin";
		return (standardId.equals(loginId) && standardPassword.equals(password));
	}
	
	public List<Menu> getMenu() {
		return menuBO.getMenu();
	}
	
	public List<ServiceType> getMenuType() {
		return menuBO.getType();
	}
	
	@Transactional
	public void updateMenuType(List<String> menuList) {
		// 기존의 있던 id 저장
		List<ServiceType> serviceTypeOldList = getMenuType();

		List<Integer> deleteMenuList = new ArrayList<>();
		// 추가해야되는 메뉴인지 제거해야하는 메뉴인지 확인
		for (ServiceType serviceType : serviceTypeOldList) {
			boolean isDel = true;
			if (!menuList.isEmpty()) {
				for (String menu : menuList) {
					if (serviceType.getType().equals(menu)) {
						menuList.remove(menu);
						isDel = false;
						break;
					}
				}
			}
			if (isDel) {
				deleteMenuList.add(serviceType.getId());
			}
		}
	
		// db delete
		if (!deleteMenuList.isEmpty()) {
			menuBO.deleteMenuType(deleteMenuList);
			// 해당 메뉴타입이었던 상세 메뉴 삭제
			menuBO.deleteSpecificMenuByTypeId(deleteMenuList);
		}
		
		// db insert
		if (!menuList.isEmpty()) {
			menuBO.insertMenuType(menuList);
		}
		
	}
	
	public void insertSpecificMenu(int typeId, String specificType, int price, int requiredTime) {
		menuBO.insertSpecificMenu(typeId, specificType, price, requiredTime);
	}
	
	public void deleteSpeicificMenu(int id) {
		menuBO.deleteSpecificMenu(id);
	}
	
	public void updateSpecificMenu(int id, int typeId, String specificType, int price, int requiredTime) {
		menuBO.updateSpecificMenu(id, typeId, specificType, price, requiredTime);
	}
	
}
