package com.theman.batch.bo;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theman.batch.dao.ScheduleTaskDAO;

@Service
public class ScheduleTaskBO {

	@Autowired
	private ScheduleTaskDAO scheduleTaskDAO;
	
	public void insertHoliday() {
		Calendar cal = Calendar.getInstance();
		List<Date> holidayList = new ArrayList<>();
		cal.add(Calendar.MONTH, 1);
		int dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		for (int i = 1; i <= dayOfMonth; i++) {
			if (cal.get(Calendar.DAY_OF_WEEK) == 3) {
				holidayList.add(cal.getTime());
			}
			cal.add(Calendar.DATE, 1);
		}
		scheduleTaskDAO.insertHoliday(holidayList);
	}
}
