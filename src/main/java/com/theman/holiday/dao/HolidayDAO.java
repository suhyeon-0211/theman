package com.theman.holiday.dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface HolidayDAO {
	public List<Date> getDateList();
	public boolean existHolidayByCloseDate(Date targetDate);
	public void deleteHolidayByCloseDate(Date targetDate);
	public void insertHoliday(Date targetDate);
}
