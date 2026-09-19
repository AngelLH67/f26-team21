
# Requirements – Starter Template

**Project Name:** StudyMatch \
**Team:** Angel Lopez - Sysadmin, Ahnestti Lott - Customer/Student \
**Course:** CSC 340\
**Version:** 1.0\
**Date:** 2026-09-17

---

## 1. Overview
**Vision.** StudyMatch is a platform for college students who want to find compatible study partners or study groups. The system will help students connect with others taking the same courses and make studying more convenient and collaborative.

**Glossary** Terms used in the project
- **Study Group:** A group of students who study together for a course or subject.
- **Course:** A college course that students can use to find other students with similar academic needs.
- **User:** A student who uses StudyMatch to find or participate in study groups.

**Primary Users / Roles.**
- **Customer/Student** — Find compatable study partners and study groups for their courses. 
- **SysAdmin** — Maintain the platform, manage access, and review reports and activity

**Scope (this semester).**
- <1> Students can create and manage their user profiles.
- <2> Students can add courses and set availability 
- <3> Students can create or join study groups.
- <4> Students can post study sessions and rsvp them
- <5> SysAdmins can manage user access.
- <6> SysAdmins can manage course and study group listings.
- <7> SysAdmins can review reports of inappropriate users or groups.
- <8> SysAdmins can monitor user activity and engagement.

**Out of scope (deferred).**
- <1> Integration with external college registration systems.
- <2> File sharing in courses/study groups
- <3> Video conferencing or built-in video meetings.

> This document is **requirements‑level** and solution‑neutral; design decisions (UI layouts, API endpoints, schemas) are documented separately.

---

## 2. Functional Requirements (User Stories)


### 2.1 Customer Stories
- **US‑1 — Create a profile**  
  _Story:_ As a student, I want to create a profile so that other students can learn about my study preferences.  
  _Acceptance:_
  ```gherkin
  Scenario: <Student creates a profile>
    Given <the student has an account>
    When  <the student enters their profile information and study preferences>
    Then  <the student's profile is created and can be viewed by other students>
  ```

- **US‑2 — Add Courses**  
  _Story:_ As a student, I want to add my courses so that I can find students taking the same classes.  
  _Acceptance:_
  ```gherkin
  Scenario: <Student adds a course>
    Given <the student is logged into their account>
    When  <the student selects and adds a course>
    Then  <the course is added to the student's profile>
  ```

  - **US‑3 — Browse Study Groups**  
  _Story:_ As a student, I want to browse study groups in my courses so that I can find relevant groups.  
  _Acceptance:_
  ```gherkin
  Scenario: <Student browses study groups>
    Given <the student has added courses to their profile>
    When  <the student views available study groups>
    Then  <the system displays study groups related to the student's courses>
  ```

  - **US‑4 — Create Study Groups**  
  _Story:_ As a student, I want to create study groups so that I can organize sessions with classmates.  
  _Acceptance:_
  ```gherkin
  Scenario: <Student creates a study group>
    Given <the student is logged into their account>
    When  <the student enters the study group information and creates the group>
    Then  <the new study group is available for classmates to view and join>
  ```

  - **US‑5 — Enter Availability**  
  _Story:_ As a student, I want to enter my availability so that I can find sessions that fit my schedule.  
  _Acceptance:_
  ```gherkin
  Scenario: <Student enters availability>
    Given <the student is logged into their account>
    When  <the student enters the times they are available>
    Then  <the system saves the student's availability and shows compatible study sessions>
  ```

### 2.2 SysAdmin Stories
- **US‑6 — Remove Inappropriate Groups**  
  _Story:_ As an administrator, I want to remove inappropriate groups so that the platform remains safe and relevant. 
  _Acceptance:_
  ```gherkin
  Scenario: Administrator removes an inappropriate group
    Given an inappropriate study group exists on the platform
    When  the administrator removes the group
    Then  the group is no longer available on the platform
  ```

- **US‑7 — Manage Course Listings**  
  _Story:_ As an administrator, I want to manage course listings so that all university courses are available for students to join.  
  _Acceptance:_
  ```gherkin
  Scenario: Administrator manages a course listing
    Given a course listing needs to be added or updated
    When  the administrator manages the course listing
    Then  the course information is updated and the course is available for students to join
  ```

- **US‑8 — View Registered Users**  
  _Story:_ As an administrator, I want to view a list of all registered users so that I can track platform usage.
  _Acceptance:_
  ```gherkin
  Scenario: Administrator views registered users
    Given Given users have registered for StudyMatch
    When  the administrator views the registered users list
    Then  the system displays the registered users
  ```

- **US‑9 — Review Reported Users**  
  _Story:_ As an administrator, I want to review reports submitted about users so that inappropriate behavior can be addressed on the platform.
  _Acceptance:_
  ```gherkin
  Scenario: Administrator reviews a reported user
    Given a user has been reported on the platform
    When  the administrator views the report
    Then  the system displays the reported user's information and the reason for the report
  ```

---

## 3. Non‑Functional Requirements (make them measurable)
- **Performance:** The system should display normal pages and search results within 3 seconds under normal usage conditions.
- **Availability/Reliability:** The system should be available during normal usage periods and should not lose saved user or study group information when a valid operation is completed.
- **Security/Privacy:** Users should only be able to access information and functions permitted for their role. User account information should not be publicly exposed without permission.
- **Usability:** A new student should be able to find a course, search for a study group, and view available study partners without needing special instructions.

---

## 4. Assumptions, Constraints, and Policies
- Users are college students using StudyMatch for academic collaboration.
- Users are responsible for providing accurate information in their profiles.
- StudyMatch is intended for academic collaboration and not for replacing official university systems.

---

## 5. Milestones (course‑aligned)
- **M1 Requirements** — this file + stories opened as issues. 
- **M2 High‑fidelity prototype** — core customer/provider flows fully interactive. 
- **M3 Design** — architecture, schema, API outline. 
- **M4 Backend API** — key endpoints + tests. 
- **M5 Increment** — ≥2 use cases end‑to‑end. 
- **M6 Final** — complete system & documentation. 

---

## 6. Change Management
- Stories are living artifacts; changes are tracked via repository issues and linked pull requests.  
- Major changes should update this SRS.