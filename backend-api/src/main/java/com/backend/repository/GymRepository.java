package com.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.backend.entities.GymEntity;


@Repository
public interface GymRepository extends JpaRepository<GymEntity, Integer>{


}
