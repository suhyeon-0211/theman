package com.theman.holiday.bo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theman.admin.model.CalendarVO;
import com.theman.holiday.dao.HolidayDAO;

@Service
public class HolidayBO {
	
	@Autowired
	private HolidayDAO holidayDAO;
	
	public List<CalendarVO> getHolidayList() {
		List<Date> dateList = holidayDAO.getDateList();
		List<CalendarVO> holidayList = new ArrayList<>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (Date date : dateList) {
			CalendarVO calendar = new CalendarVO();
			calendar.setStart(date);
			calendar.setId(sdf.format(date));
			holidayList.add(calendar);
		}
		return holidayList;
	}
	
	public boolean existHolidayByCloseDate(Date targetDate) {
		return holidayDAO.existHolidayByCloseDate(targetDate);
	}
	
	public void deleteHolidayByCloseDate(Date targetDate) {
		holidayDAO.deleteHolidayByCloseDate(targetDate);
	}
	
	public void insertHoliday(Date targetDate) {
		holidayDAO.insertHoliday(targetDate);
	}
}
