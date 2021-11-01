package com.theman.admin.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CalendarVO {
	private String id;
	private String title="휴무";
	private Date start;
	private Date end;
	private String display="background";
	private String backgroundColor="#FE2E64";
	private boolean allDay=true;
}
