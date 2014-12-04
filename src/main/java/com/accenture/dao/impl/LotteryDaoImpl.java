//package com.accenture.dao.impl;
//
//import java.util.List;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.PersistenceUnit;
//import javax.persistence.Query;
//
//import org.springframework.transaction.annotation.Transactional;
//
//import com.accenture.dao.LotteryDao;
//import com.accenture.domain.Employee;
//
//public class LotteryDaoImpl extends JpaDaoSupport implements LotteryDao {
//	
//	@PersistenceUnit(unitName="jpa")
//	private EntityManagerFactory entityManagerFactory;
//
//	@Transactional
//	public List<Employee> listAll() {
//		EntityManager entityManager=entityManagerFactory.createEntityManager();
//		String queryString="select * from Employee";
//		Query query=entityManager.createNativeQuery(queryString,Employee.class);
//		List<Employee> empList=query.getResultList();
//		return empList;
//	}
//
//	@Transactional
//	public Object findById(Object object) {
//		Employee employee=(Employee)object;
//		employee=this.getJpaTemplate().find(employee.getClass(),employee.getId());
//		return employee;
//	}
//
//	@Transactional
//	public void save(Object object) {
//		Employee employee=(Employee)object;
//		this.getJpaTemplate().persist(employee);
//	}
//
//	@Transactional
//	public void update(Object object) {
//		Employee employee=(Employee)object;
//		this.getJpaTemplate().merge(employee);
//		
//	}
//
//	@Transactional
//	public void delelte(Object object) {
//		Employee employee=(Employee)object;
//		this.getJpaTemplate().remove(this.getJpaTemplate().merge(employee));
//	}
//
//	public Employee findMatchedLoginUser(String userName) {
//	return this.getJpaTemplate().find(Employee.class, userName);
//	}
//}
