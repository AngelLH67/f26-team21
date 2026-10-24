
package com.studymatch.backend_api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.studymatch.backend_api.entity.Student;
import com.studymatch.backend_api.repository.StudentRepository;
import com.studymatch.backend_api.entity.Course;
import com.studymatch.backend_api.repository.CourseRepository;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StudentService {

    private final StudentRepository studentRepository;
    private final CourseRepository courseRepository;

    public StudentService(StudentRepository studentRepository,
                          CourseRepository courseRepository) {
        this.studentRepository = studentRepository;
        this.courseRepository = courseRepository;
    }

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    public Optional<Student> getStudentById(Long id) {
        return studentRepository.findById(id);
    }

    public Student saveStudent(Student student) {
        return studentRepository.save(student);
    }

    public Optional<Student> updateStudent(Long id, Student updatedStudent) {
    return studentRepository.findById(id).map(student -> {
        student.setName(updatedStudent.getName());
        student.setEmail(updatedStudent.getEmail());
        student.setStudyPreferences(updatedStudent.getStudyPreferences());
        student.setAvailability(updatedStudent.getAvailability());

        return studentRepository.save(student);
    });
    }
    
    @Transactional
    public Optional<Student> enrollStudentInCourse(Long studentId, Long courseId) {
        Optional<Student> studentOptional = studentRepository.findById(studentId);
        Optional<Course> courseOptional = courseRepository.findById(courseId);

        if (studentOptional.isEmpty() || courseOptional.isEmpty()) {
        return Optional.empty();
        }

        Student student = studentOptional.get();
        Course course = courseOptional.get();

        student.getCourses().add(course);

        return Optional.of(studentRepository.save(student));
    }

}

