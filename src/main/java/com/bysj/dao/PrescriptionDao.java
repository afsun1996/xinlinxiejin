package com.bysj.dao;

import java.util.List;

import com.bysj.dto.Prescription;

public interface PrescriptionDao {
	
	Prescription selectPrescriptionByName(String name);
	
	List<Prescription> selectPrescriptionVague(String name);
	
	List<Prescription> selectAllPrescriptions();
	
	int insertPrescription(Prescription Prescription);

	int removePrescription(String name);
	
	int updatePrescription(Prescription Prescription);

}
