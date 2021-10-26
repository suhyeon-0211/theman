package com.theman.menu.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ServiceType {
	private int id;
	private String type;
	private Date createdAt;
	private Date updatedAt;
}
