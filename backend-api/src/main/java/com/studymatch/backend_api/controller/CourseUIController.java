
package com.studymatch.backend_api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.studymatch.backend_api.entity.Course;
import com.studymatch.backend_api.service.CourseService;

@Controller
public class CourseUIController {

    private final CourseService courseService;

    public CourseUIController(CourseService courseService) {
        this.courseService = courseService;
    }

    // Display the manage courses page
    @GetMapping("/courses")
    public String manageCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "manage-courses";
    }

    // Display the add course form
    @GetMapping("/courses/new")
    public String showAddCourseForm() {
        return "add-courses";
    }

    // Save a new course
    @PostMapping("/courses")
    public String addCourse(@ModelAttribute Course course) {
        courseService.saveCourse(course);
        return "redirect:/courses";
    }

    // Display the edit course form
    @GetMapping("/courses/{id}/edit")
    public String showEditCourseForm(@PathVariable Long id, Model model) {
        return courseService.getCourseById(id).map(course -> {
            model.addAttribute("course", course);
            return "edit-course";
        }).orElse("redirect:/courses");
    }

    // Update an existing course
    @PostMapping("/courses/{id}/edit")
    public String updateCourse(@PathVariable Long id,
                               @ModelAttribute Course updatedCourse) {

        return courseService.getCourseById(id).map(course -> {
            course.setCourseNumber(updatedCourse.getCourseNumber());
            course.setCourseName(updatedCourse.getCourseName());
            course.setInstructor(updatedCourse.getInstructor());
            course.setDescription(updatedCourse.getDescription());

            courseService.saveCourse(course);
            return "redirect:/courses";
        }).orElse("redirect:/courses");
    }

    // Remove a course
    @PostMapping("/courses/{id}/delete")
    public String deleteCourse(@PathVariable Long id) {
        courseService.deleteCourse(id);
        return "redirect:/courses";
    }
}
