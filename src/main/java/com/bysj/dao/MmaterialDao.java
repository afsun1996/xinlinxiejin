package com.bysj.dao;

import java.util.List;

import com.bysj.dto.Mmaterial;
import com.bysj.dto.Prescription;


public interface MmaterialDao {
	
	Mmaterial selectMmaterialByName(String MaterialName);
	
	List<Mmaterial> selectAllMmaterials();
	
	List<Mmaterial> selectMmaterialVague(String name);
	
	List<Prescription> selectPrescriptionByMmaterial(String name);
	
	int insertMmaterial(Mmaterial Material);

	int removeMmaterial(Mmaterial Material);
	
	int updateMmaterial(Mmaterial Material);
}
