package com.accenture.service.impl;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accenture.dao.impl.LotteryDaoImpl;
import com.accenture.domain.Employee;
import com.accenture.service.LotteryService;

@Service
public class LotteryServiceImpl implements LotteryService {

	@Autowired
	private LotteryDaoImpl lotteryDao;

	public String findRandomEmployeeID() {
		List<Employee> empList = lotteryDao.listAll();
		int listSize = empList.size();
		// get the random number between 0-listsize
		Random randomInt = new Random();
		int empIDIndex = randomInt.nextInt(listSize);
		Employee emp = empList.get(empIDIndex);
		return emp.getId();
	}

	public boolean hasMatchedLoginUser(String userName, String password) {
		Employee emp = this.lotteryDao.findMatchedLoginUser(userName);
		if (emp.getPassword().equals(password)) {
			return true;
		} else {
			return false;
		}
	}
}
