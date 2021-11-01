package com.theman.batch.dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface ScheduleTaskDAO {
	public void insertHoliday(List<Date> holidayList);
}
