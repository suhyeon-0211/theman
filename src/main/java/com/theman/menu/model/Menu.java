package com.theman.menu.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Menu {
	private int id;
	private String type;
	private String specificType;
	private int price;
	private int requiredTime;
	private Date createdAt;
	private Date updatedAt;
}
