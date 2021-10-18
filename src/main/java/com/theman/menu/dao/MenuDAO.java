package com.theman.menu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface MenuDAO {
	public List<String> getType();
}
