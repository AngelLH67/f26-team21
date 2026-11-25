<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch | Edit Course</title>

    <link rel="stylesheet" href="/student/styles.css">
    <link rel="stylesheet" href="/sysadmin/styles.css">

    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js" defer></script>
</head>

<body class="dashboard-page admin-page add-course-page">

    <div class="app-layout">

        <!-- SIDEBAR -->
        <aside class="sidebar">

            <a href="/admin" class="brand">
                <span class="brand-icon">
                    <i data-lucide="sprout"></i>
                </span>
                <span>StudyMatch</span>
            </a>

            <div class="sidebar-content">

                <p class="sidebar-label">ADMIN WORKSPACE</p>

                <nav class="sidebar-nav" aria-label="Admin navigation">

                    <a href="/admin" class="nav-link">
                        <i data-lucide="layout-dashboard"></i>
                        Overview
                    </a>

                    <a href="/registered-users" class="nav-link">
                        <i data-lucide="users-round"></i>
                        Registered Users
                    </a>

                    <a href="/courses" class="nav-link">
                        <i data-lucide="book-open"></i>
                        Course Listings
                    </a>

                    <a href="/remove-groups" class="nav-link">
                        <i data-lucide="messages-square"></i>
                        Study Groups
                    </a>

                    <a href="/reported-users" class="nav-link">
                        <i data-lucide="shield-alert"></i>
                        Reported Users
                    </a>

                </nav>

                <p class="sidebar-label sidebar-label-spaced">
                    QUICK ACTIONS
                </p>

                <nav class="sidebar-nav">
                    <a href="/courses" class="nav-link active" aria-current="page">
                        <i data-lucide="book-pen"></i>
                        Edit Course
                    </a>
                </nav>

            </div>

            <div class="sidebar-bottom">
                <div class="sidebar-note">
                    <i data-lucide="heart-handshake"></i>
                    <p>Better together.</p>
                    <span>Find your people and make studying easier.</span>
                </div>

                <p class="sidebar-copyright">© 2026 StudyMatch</p>
            </div>

        </aside>

        <!-- MAIN CONTENT -->
        <main class="dashboard-main">

            <div class="topbar">
                <div class="breadcrumb">
                    <span>Administration</span>
                    <i data-lucide="chevron-right"></i>
                    <strong>Edit Course</strong>
                </div>

                <span class="admin-account-icon" aria-label="Administrator">
                    <i data-lucide="shield-check"></i>
                </span>
            </div>

            <!-- PAGE HEADING -->
            <section class="courses-heading">

                <span class="eyebrow">
                    <i data-lucide="sparkles"></i>
                    ADMIN COURSE WORKSPACE
                </span>

                <h1>Keep the StudyMatch course catalog up to date.</h1>

                <p>
                    Update the course information so students can find
                    classmates taking the same classes.
                </p>

            </section>

            <!-- FORM OVERVIEW -->
            <section class="courses-overview">

                <div class="courses-overview-icon">
                    <i data-lucide="book-plus"></i>
                </div>

                <div class="courses-overview-copy">
                    <span>UPDATE COURSE LISTING</span>
                    <h2>Every course is a connection.</h2>
                    <p>
                        Update the course information below to keep
                        the StudyMatch catalog accurate.
                    </p>
                </div>

            </section>

            <!-- EDIT COURSE FORM -->
            <section class="add-course-form-section">

                <div class="add-course-form-heading">
                    <div class="courses-tools-icon">
                        <i data-lucide="clipboard-list"></i>
                    </div>

                    <div>
                        <h2>Course information</h2>
                        <p>Update the fields below to edit this course listing.</p>
                    </div>
                </div>

                <form action="/courses/${course.id}/edit" method="post" class="add-course-form">

                    <div class="add-course-field">
                        <label for="courseNumber">Course Number</label>
                        <input type="text" id="courseNumber" name="courseNumber" value="${course.courseNumber}"
                            required>
                    </div>

                    <div class="add-course-field">
                        <label for="courseName">Course Name</label>
                        <input type="text" id="courseName" name="courseName" value="${course.courseName}" required>
                    </div>

                    <div class="add-course-field">
                        <label for="instructor">Instructor</label>
                        <input type="text" id="instructor" name="instructor" value="${course.instructor}" required>
                    </div>

                    <div class="add-course-field">
                        <label for="description">Course Description</label>
                        <textarea id="description" name="description" rows="5" required>${course.description}</textarea>
                    </div>

                    <div class="add-course-form-actions">

                        <a href="/courses" class="add-course-cancel">
                            Cancel
                        </a>

                        <button type="submit" class="add-course-submit">
                            <i data-lucide="save"></i>
                            Save Changes
                        </button>

                    </div>

                </form>

            </section>

            <footer class="dashboard-footer">
                <span>Made for students, by students.</span>
                <span>StudyMatch © 2026</span>
            </footer>

        </main>

    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            if (window.lucide) {
                lucide.createIcons();
            }
        });
    </script>

</body>

</html>