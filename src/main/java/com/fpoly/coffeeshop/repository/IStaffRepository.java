package com.fpoly.coffeeshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.StaffEntity;

@Repository
public interface IStaffRepository extends JpaRepository<StaffEntity, Long> {

}
