package com.studymatch.backend_api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studymatch.backend_api.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
