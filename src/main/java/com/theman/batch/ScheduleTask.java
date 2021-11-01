package com.theman.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.theman.batch.bo.ScheduleTaskBO;

@Component
public class ScheduleTask {

	@Autowired
	private ScheduleTaskBO scheduleTaskBO;
	
	@Scheduled(cron = "0 0 0 1 * *")
	public void insertHoliday() {
		scheduleTaskBO.insertHoliday();
	}
}
