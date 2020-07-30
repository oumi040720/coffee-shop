package com.fpoly.coffeeshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.StaffLogEntity;

@Repository
public interface IStaffLogRepository extends JpaRepository<StaffLogEntity, Long> {

}
