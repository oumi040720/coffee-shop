package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.StaffEntity;

@Repository
public interface IStaffRepository extends JpaRepository<StaffEntity, Long> {

	public List<StaffEntity> findAllByFlagDeleteIs(Boolean flagDelete);

	public Page<StaffEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);

	public List<StaffEntity> findAllByFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(String fullname, String email,
																						String phone, String address);
	
	public Page<StaffEntity> findAllByFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(String fullname, String email, String phone, 
																						String address, Pageable pageable);
	
	public List<StaffEntity> findAllByFlagDeleteAndFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(Boolean flagDelete, String fullname,
																						String email, String phone, String address);

	public Page<StaffEntity> findAllByFlagDeleteAndFullnameLikeOrEmailLikeOrPhoneLikeOrAddressLike(Boolean flagDelete, String fullname, 
																									String email, String phone, 
																									String address, Pageable pageable);

}