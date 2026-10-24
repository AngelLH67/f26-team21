
package com.studymatch.backend_api.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PutMapping;

import com.studymatch.backend_api.entity.Student;
import com.studymatch.backend_api.service.StudentService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/students")
public class StudentController {

    private final StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping
    public List<Student> getAllStudents() {
        return studentService.getAllStudents();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Student> getStudentById(@PathVariable Long id) {
        return studentService.getStudentById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Student createStudent(@Valid @RequestBody Student student) {
        return studentService.saveStudent(student);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Student> updateStudent(
        @PathVariable Long id,
        @Valid @RequestBody Student updatedStudent) {

    return studentService.updateStudent(id, updatedStudent)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }

    
    @PostMapping("/{studentId}/courses/{courseId}")
    public ResponseEntity<Student> enrollStudentInCourse(
            @PathVariable Long studentId,
            @PathVariable Long courseId) {

        return studentService.enrollStudentInCourse(studentId, courseId)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

}

