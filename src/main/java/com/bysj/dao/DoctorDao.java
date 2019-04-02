package com.bysj.dao;

import java.util.List;

import com.bysj.dto.Article;
import com.bysj.dto.Doctor;

public interface DoctorDao {

	Doctor selectDoctorById(Integer id);
	
	List<Doctor> selectDoctorByName(String dname);
	
	List<Article> selectArticleByDoctor(String dname);
	
	Doctor selectDoctorByPrecise(Doctor doctor);
	
	List<Doctor> selectAllDoctors();
	
	int insertDoctor(Doctor doctor);

	int removeDoctor(Doctor doctor);
	
	int updateDoctor(Doctor doctor);

}
