
package com.studymatch.backend_api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.studymatch.backend_api.entity.Student;
import com.studymatch.backend_api.repository.StudentRepository;

@Service
public class StudentService {

    private final StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
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
}

