
package com.studymatch.backend_api.service;

import java.util.List;
import java.util.Optional;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studymatch.backend_api.entity.Course;
import com.studymatch.backend_api.repository.CourseRepository;

@Service
public class CourseService {

    private final CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Optional<Course> getCourseById(Long id) {
        return courseRepository.findById(id);
    }

    public Course saveCourse(Course course) {
        return courseRepository.save(course);
    }

    public boolean deleteCourse(Long id) {
        if (courseRepository.existsById(id)) {
            courseRepository.deleteById(id);
            return true;
        }

        return false;
    }
 
    @Transactional(readOnly = true)
    public Optional<List<Map<String, Object>>> getStudentsInCourse(Long courseId) {
        return courseRepository.findById(courseId).map(course -> {
            List<Map<String, Object>> students = new ArrayList<>();

            for (var student : course.getStudents()) {
                students.add(Map.of(
                    "id", student.getId(),
                    "name", student.getName(),
                    "email", student.getEmail()
                ));
            }

            return students;
        });
    }

}

