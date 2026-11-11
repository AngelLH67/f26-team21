
package com.studymatch.backend_api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.studymatch.backend_api.service.StudentService;

@Controller
public class StudentUIController {

    private final StudentService studentService;

    public StudentUIController(StudentService studentService) {
        this.studentService = studentService;
    }

    // Display the registered users page
    @GetMapping("/registered-users")
    public String registeredUsers(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "registered-users";
    }
}
