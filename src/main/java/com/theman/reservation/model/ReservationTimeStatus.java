package com.theman.reservation.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReservationTimeStatus {
	private String date;
	private String time;
	private String type;
	private String specificType;
	private int requiredTime;
}
