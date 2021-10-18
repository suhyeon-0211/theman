package com.theman.menu.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theman.menu.dao.MenuDAO;

@Service
public class MenuBO {

	@Autowired
	private MenuDAO menuDAO;
	
	public List<String> getType() {
		return menuDAO.getType();
	}
}
