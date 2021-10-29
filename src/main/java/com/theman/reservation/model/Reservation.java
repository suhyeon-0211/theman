package com.theman.reservation.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Reservation {
	private int id;
	private int serviceId;
	private Date reservationDateTime;
	private String name;
	private String phoneNumber;
	private String reservationPassword;
	private String status;
	private Date createdAt;
	private Date updatedAt;
}
