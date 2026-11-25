
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch | Manage Courses</title>

    <link rel="stylesheet" href="/student/styles.css">
    <link rel="stylesheet" href="/sysadmin/styles.css">

    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js" defer></script>
</head>

<body class="dashboard-page admin-page manage-courses-page">

<div class="app-layout">

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

                <a href="/courses" class="nav-link active" aria-current="page">
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

            <nav class="sidebar-nav" aria-label="Quick actions">
                <a href="/courses/new" class="nav-link">
                    <i data-lucide="plus-circle"></i>
                    Add Course
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

    <main class="dashboard-main">

        <div class="topbar">
            <div class="breadcrumb">
                <span>Administration</span>
                <i data-lucide="chevron-right"></i>
                <strong>Manage Courses</strong>
            </div>

            <span class="admin-account-icon" aria-label="Administrator">
                <i data-lucide="shield-check"></i>
            </span>
        </div>

        <!-- INTRO -->
        <section class="courses-heading">

            <span class="eyebrow">
                <i data-lucide="sparkles"></i>
                ADMIN COURSE WORKSPACE
            </span>

            <h1>Keep the course catalog organized.</h1>

            <p>
                Browse and manage the course listings available
                on StudyMatch. A well-organized course catalog
                makes connecting with classmates easier.
            </p>

        </section>

        <!-- OVERVIEW -->
        <section class="courses-overview">

            <div class="courses-overview-icon">
                <i data-lucide="library-big"></i>
            </div>

            <div class="courses-overview-copy">
                <span>COURSE CATALOG</span>
                <h2>Every course is a connection.</h2>
                <p>
                    Keep course information up to date so
                    students can find their classmates.
                </p>
            </div>

            <div class="courses-overview-count">
                <strong>${courses?size}</strong>
                <span>Course listings</span>
            </div>

        </section>

        <!-- SUCCESS MESSAGE -->
        <#if message??>
            <div class="courses-success-message">
                ${message}
            </div>
        </#if>

        <!-- SEARCH -->
        <section class="courses-tools">

            <div class="courses-tools-heading">
                <div class="courses-tools-icon">
                    <i data-lucide="book-open"></i>
                </div>

                <div>
                    <h2>Manage course listings</h2>
                    <p>Search, edit, or remove a course.</p>
                </div>
            </div>

            <div class="courses-tools-actions">

                <div class="courses-search-wrap">
                    <i data-lucide="search"></i>
                    <input
                        type="search"
                        id="courseSearch"
                        aria-label="Search courses"
                        placeholder="Search courses or instructors...">
                </div>

                <a href="/courses/new" class="courses-add-button">
                    <i data-lucide="plus"></i>
                    Add Course
                </a>

            </div>

        </section>

        <!-- COURSE LIST -->
        <section class="courses-list-section">

            <div class="courses-results-heading">
                <div>
                    <span class="section-kicker">ALL COURSE LISTINGS</span>
                    <h2>Course catalog</h2>
                    <p>Explore the courses available on StudyMatch.</p>
                </div>

                <span class="courses-results-count"
                      id="visibleCourseCount"
                      aria-live="polite">
                    ${courses?size} courses
                </span>
            </div>

            <div class="managed-courses-grid" id="courseList">

                <#list courses as course>

                    <article class="managed-course-card">

                        <div class="managed-course-top">

                            <span class="managed-course-icon">
                                <i data-lucide="book-open"></i>
                            </span>

                            <span class="managed-course-badge">
                                ${course.courseNumber}
                            </span>

                        </div>

                        <h3>${course.courseName}</h3>

                        <p class="managed-course-code">
                            ${course.courseNumber}
                        </p>

                        <div class="managed-course-divider"
                             aria-hidden="true"></div>

                        <div class="managed-course-instructor">
                            <span>INSTRUCTOR</span>
                            <strong>${course.instructor}</strong>
                        </div>

                        <div class="managed-course-actions">

                            <a href="/courses/${course.id}/edit"
                               class="course-edit-button">
                                Edit
                            </a>

                            <form action="/courses/${course.id}/delete"
                                  method="post"
                                  onsubmit="return confirm('Are you sure you want to remove this course?');">

                                <button type="submit"
                                        class="course-remove-button">
                                    Remove
                                </button>

                            </form>

                        </div>

                    </article>

                </#list>

            </div>

            <div class="courses-empty-state"
                 id="noCourses"
                 <#if courses?has_content>hidden</#if>>

                <span class="courses-empty-icon">
                    <i data-lucide="search-x"></i>
                </span>

                <h3 id="emptyTitle">No courses found</h3>

                <p id="emptyMessage">
                    Try a different search to find a course.
                </p>

                <button type="button" id="clearCourseSearch">
                    Clear Search
                </button>

            </div>

        </section>

        <!-- BOTTOM BANNER -->
        <section class="courses-bottom-banner">

            <div class="courses-bottom-icon">
                <i data-lucide="plus-circle"></i>
            </div>

            <div>
                <h2>Have another course to add?</h2>
                <p>Help grow the StudyMatch course catalog.</p>
            </div>

            <a href="/courses/new" class="courses-bottom-link">
                Add a Course
                <i data-lucide="arrow-up-right"></i>
            </a>

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

        const searchInput = document.getElementById("courseSearch");
        const courseCards = document.querySelectorAll(".managed-course-card");
        const visibleCount = document.getElementById("visibleCourseCount");
        const emptyState = document.getElementById("noCourses");
        const emptyTitle = document.getElementById("emptyTitle");
        const emptyMessage = document.getElementById("emptyMessage");
        const clearButton = document.getElementById("clearCourseSearch");

        function filterCourses() {

            const query = searchInput.value.trim().toLowerCase();
            let visible = 0;

            courseCards.forEach(function (card) {

                const text = card.textContent.toLowerCase();
                const matches = text.includes(query);

                card.hidden = !matches;

                if (matches) {
                    visible++;
                }

            });

            visibleCount.textContent =
                visible + (visible === 1 ? " course" : " courses");

            emptyState.hidden = visible !== 0;

            if (courseCards.length === 0) {
                emptyTitle.textContent = "No courses have been added yet";
                emptyMessage.textContent =
                    "Add a course to start building the catalog.";
                clearButton.hidden = true;
            } else {
                emptyTitle.textContent = "No courses found";
                emptyMessage.textContent =
                    "Try a different search to find a course.";
                clearButton.hidden = false;
            }
        }

        searchInput.addEventListener("input", filterCourses);

        clearButton.addEventListener("click", function () {
            searchInput.value = "";
            filterCourses();
            searchInput.focus();
        });

        filterCourses();

    });
</script>


</body>
</html>
