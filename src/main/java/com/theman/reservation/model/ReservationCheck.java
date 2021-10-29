package com.theman.reservation.model;

import com.theman.menu.model.Menu;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReservationCheck {
	private Reservation reservation;
	private Menu menu;
}
