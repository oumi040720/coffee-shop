package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.StaffLogEntity;

@Repository
public interface IStaffLogRepository extends JpaRepository<StaffLogEntity, Long> {

	public List<StaffLogEntity> findAllByOldFlagDeleteIs(Boolean oldFlagDelete);
	
	public Page<StaffLogEntity> findAllByOldFlagDeleteIs(Boolean oldFlagDelete, Pageable pageable);
	
	public List<StaffLogEntity> findAllByStaffID(Long staffID);
	
	public Page<StaffLogEntity> findAllByStaffID(Long staffID, Pageable pageable);
	
	public List<StaffLogEntity> findAllByOldFlagDeleteIsAndStaffID(Boolean oldFlagDelete, Long staffID);
	
	public Page<StaffLogEntity> findAllByOldFlagDeleteIsAndStaffID(Boolean oldFlagDelete, Long staffID, Pageable pageable);
	
}
