package com.studymatch.backend_api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studymatch.backend_api.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {
}
