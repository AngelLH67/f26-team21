<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch | Registered Users</title>

    <link rel="stylesheet" href="/student/styles.css">
    <link rel="stylesheet" href="/sysadmin/styles.css">

    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js" defer></script>
</head>

<body class="dashboard-page admin-page manage-users-page">

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

                    <a href="/registered-users" class="nav-link active" aria-current="page">
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
                    <strong>Registered Users</strong>
                </div>

                <span class="admin-account-icon" aria-label="Administrator">
                    <i data-lucide="shield-check"></i>
                </span>
            </div>

            <!-- INTRO -->
            <section class="courses-heading">

                <span class="eyebrow">
                    <i data-lucide="sparkles"></i>
                    ADMIN USER WORKSPACE
                </span>

                <h1>Know who's part of the community.</h1>

                <p>
                    View the students who have joined StudyMatch.
                    Keep track of registrations and see who's
                    becoming part of the community.
                </p>

            </section>

            <!-- OVERVIEW -->
            <section class="courses-overview">

                <div class="courses-overview-icon">
                    <i data-lucide="users-round"></i>
                </div>

                <div class="courses-overview-copy">
                    <span>STUDYMatch COMMUNITY</span>
                    <h2>Every connection starts with a student.</h2>
                    <p>
                        Review registered users and their account
                        information in one place.
                    </p>
                </div>

                <div class="courses-overview-count">
                    <strong>${students?size}</strong>
                    <span>Registered users</span>
                </div>

            </section>


            <!-- USERS TABLE -->
            <section class="courses-list-section">

                <div class="courses-results-heading">
                    <div>
                        <span class="section-kicker">USER DIRECTORY</span>
                        <h2>Registered users</h2>
                        <p>View the accounts currently registered on StudyMatch.</p>
                    </div>

                    <span class="courses-results-count" id="registeredUsersCount">
                        ${students?size} users
                    </span>
                </div>

                <!-- SEARCH -->
                <div class="registered-users-search">
                    <i data-lucide="search"></i>
                    <input type="search" id="userSearch" placeholder="Search by name or email..."
                        aria-label="Search registered users">
                </div>

                <!-- TABLE -->
                <div class="registered-users-table-wrap">
                    <table class="registered-users-table">

                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email Address</th>
                                <th>Role</th>
                                <th>Registered</th>
                            </tr>
                        </thead>

                        <tbody id="registeredUsersList">

                            <#if students?has_content>
                                <#list students as student>
                                    <tr class="registered-user-row">
                                        <td>
                                            <div class="registered-user-name">
                                                <span class="registered-user-avatar">
                                                    <i data-lucide="user-round"></i>
                                                </span>
                                                <strong>${student.name}</strong>
                                            </div>
                                        </td>
                                        <td>${student.email}</td>
                                        <td>
                                            <span class="user-role-badge student-role">
                                                <i data-lucide="graduation-cap"></i>
                                                Student
                                            </span>
                                        </td>
                                        <td>${student.registrationDate!''}</td>
                                    </tr>
                                </#list>
                                <#else>
                                    <tr>
                                        <td colspan="4" class="registered-users-empty">
                                            <i data-lucide="users-round"></i>
                                            <strong>No registered users yet</strong>
                                            <span>New student registrations will appear here.</span>
                                        </td>
                                    </tr>
                            </#if>

                            <tr id="noUsersFound" hidden>
                                <td colspan="4" class="registered-users-empty">
                                    <i data-lucide="search-x"></i>
                                    <strong>No users found</strong>
                                    <span>Try searching with a different name or email.</span>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <footer class="dashboard-footer">
                    <p>Supporting students, one connection at a time.</p>
                    <p>StudyMatch © 2026</p>
                </footer>

            </section>

            <script>
                document.addEventListener("DOMContentLoaded", function () {

                    if (window.lucide) {
                        lucide.createIcons();
                    }

                    const searchInput = document.getElementById("userSearch");
                    const userRows = document.querySelectorAll(".registered-user-row");
                    const noUsersFound = document.getElementById("noUsersFound");
                    const userCount = document.getElementById("registeredUsersCount");

                    function filterUsers() {

                        const query = searchInput.value.trim().toLowerCase();
                        let visible = 0;

                        userRows.forEach(function (row) {

                            const name = row.cells[0].textContent.toLowerCase();
                            const email = row.cells[1].textContent.toLowerCase();

                            const matches =
                                name.includes(query) || email.includes(query);

                            row.hidden = !matches;

                            if (matches) {
                                visible++;
                            }
                        });

                        noUsersFound.hidden =
                            userRows.length === 0 || visible !== 0;

                        userCount.textContent =
                            visible + (visible === 1 ? " user" : " users");
                    }

                    searchInput.addEventListener("input", filterUsers);

                    filterUsers();

                });
            </script>


</body>

</html>