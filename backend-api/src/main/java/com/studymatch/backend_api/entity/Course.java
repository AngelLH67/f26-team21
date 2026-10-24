
package com.studymatch.backend_api.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;

import java.util.HashSet;
import java.util.Set;

@Entity
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String courseNumber;

    private String courseName;

    private String instructor;

    @Column(length = 1000)
    private String description;

    @ManyToMany(mappedBy = "courses")
    @JsonIgnore
    private Set<Student> students = new HashSet<>();

    public Course() {
    }

    public Course(String courseNumber, String courseName,
                  String instructor, String description) {
        this.courseNumber = courseNumber;
        this.courseName = courseName;
        this.instructor = instructor;
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public String getCourseNumber() {
        return courseNumber;
    }

    public void setCourseNumber(String courseNumber) {
        this.courseNumber = courseNumber;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Student> getStudents() {
        return students;
    }

    public void setStudents(Set<Student> students) {
        this.students = students;
    }

}

