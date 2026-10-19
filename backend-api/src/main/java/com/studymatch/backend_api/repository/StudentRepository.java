
package com.studymatch.backend_api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studymatch.backend_api.entity.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {
}

