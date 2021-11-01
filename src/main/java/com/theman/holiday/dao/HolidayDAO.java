package com.theman.holiday.dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface HolidayDAO {
	public List<Date> getDateList();
}
