package com.accenture.dao;

import java.util.List;

import com.accenture.domain.Employee;

public interface LotteryDao {
	List<Employee> listAll();
	Object findById(Object object);
	void save(Object object);
	void update(Object object);
	void delelte(Object object);
	Employee findMatchedLoginUser(String userName);
}





