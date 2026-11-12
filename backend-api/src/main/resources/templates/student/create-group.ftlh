
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch | Create Study Group</title>

    <link rel="stylesheet" href="/student/styles.css">

    <script
        src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js"
        defer>
    </script>
</head>

<body class="dashboard-page profile-page">

    <div class="app-layout">

        <!-- SIDEBAR -->
        <aside class="sidebar">

            <a href="/student/create-profile" class="brand">
                <span class="brand-icon">
                    <i data-lucide="sprout"></i>
                </span>
                <span>StudyMatch</span>
            </a>

            <div class="sidebar-content">

                <p class="sidebar-label">WORKSPACE</p>

                <nav class="sidebar-nav" aria-label="Main navigation">

                    <a href="/student/create-profile" class="nav-link">
                        <i data-lucide="user-round-plus"></i>
                        Create Profile
                    </a>

                    <a href="/student/edit-profile?id=${student.id?c}"
                       class="nav-link">
                        <i data-lucide="user-round-pen"></i>
                        Edit Profile
                    </a>

                    <a href="/student/create-group"
                       class="nav-link active"
                       aria-current="page"
                       id="groupSidebarLink">
                        <i data-lucide="users-round"></i>
                        Create Study Group
                    </a>

                </nav>

            </div>

            <div class="sidebar-bottom">
                <div class="sidebar-note">
                    <i data-lucide="heart-handshake"></i>
                    <p>Better together.</p>
                    <span>
                        Find your people and make studying easier.
                    </span>
                </div>

                <p class="sidebar-copyright">
                    © 2026 StudyMatch
                </p>
            </div>
        </aside>

        <!-- MAIN CONTENT -->
        <main class="dashboard-main">

            <div class="topbar">
                <div class="breadcrumb">
                    <span>Study Groups</span>
                    <i data-lucide="chevron-right"></i>
                    <strong>Create Study Group</strong>
                </div>
            </div>

            <!-- PAGE HEADING -->
            <section class="profile-heading">

                <span class="eyebrow">
                    <i data-lucide="sparkles"></i>
                    STUDY BETTER TOGETHER
                </span>

                <h1>Bring your study group together.</h1>

                <p>
                    Organize a study session, choose your course,
                    and connect with classmates.
                </p>

            </section>

            <div class="profile-layout">

                <!-- GROUP FORM -->
                <section class="profile-form-card">

                    <div class="form-card-heading">
                        <div class="form-heading-icon">
                            <i data-lucide="users-round"></i>
                        </div>

                        <div>
                            <h2>Create a study group</h2>
                            <p>
                                Plan your next study session.
                            </p>
                        </div>
                    </div>

                    <#if createdGroup??>
                        <div role="status"
                             style="padding:16px;
                                    margin-bottom:22px;
                                    background:#E8EDE5;
                                    border-radius:12px;
                                    color:#426D4B;">

                            <strong>
                                Study group created successfully!
                            </strong>

                            <p>
                                Group ID: ${createdGroup.id?c}
                            </p>

                            <p>
                                Group:
                                ${createdGroup.groupName}
                            </p>

                            <p>
                                Course:
                                ${createdGroup.course.courseNumber}
                            </p>

                            <p>
                                Created by:
                                ${createdGroup.creator.name}
                            </p>
                        </div>
                    </#if>

                    <#if errorMessage??>
                        <p role="alert"
                           style="color:#A65A4B;
                                  margin-bottom:20px;">
                            ${errorMessage}
                        </p>
                    </#if>

                    <form action="/student/create-group"
                          method="post"
                          id="createGroupForm">

                        <input type="hidden"
                               name="studentId"
                               value="${student.id?c}">

                        <div class="form-section-heading">
                            <span class="form-section-number">01</span>
                            <div>
                                <h3>Group Details</h3>
                                <p>Give your group a name and course.</p>
                            </div>
                        </div>

                        <div class="profile-form-grid">

                            <div class="profile-field profile-field-full">
                                <label for="groupName">
                                    Group Name
                                </label>

                                <input
                                    type="text"
                                    id="groupName"
                                    name="groupName"
                                    value="${groupNameValue!''}"
                                    placeholder="e.g. CSC 340 Exam Prep"
                                    required>
                            </div>

                            <div class="profile-field profile-field-full">

                                <label for="courseId">Course</label>

                                <select id="courseId"
                                        name="courseId"
                                        required>

                                    <option value="" disabled
                                        <#if !(courseIdValue??)>selected</#if>>
                                        Select a course
                                    </option>

                                    <#list courses as course>
                                        <option
                                            value="${course.id?c}"
                                            <#if courseIdValue??
                                                && courseIdValue == course.id>
                                                selected
                                            </#if>>
                                            ${course.courseNumber}
                                            -
                                            ${course.courseName}
                                        </option>
                                    </#list>

                                </select>

                                <#if !courses?has_content>
                                    <span class="field-hint">
                                        No courses are available yet.
                                        Add a course to the database
                                        before creating a group.
                                    </span>
                                </#if>
                            </div>
                        </div>

                        <div class="form-section-heading preferences-heading">
                            <span class="form-section-number">02</span>
                            <div>
                                <h3>Meeting Information</h3>
                                <p>
                                    Decide when and where to meet.
                                </p>
                            </div>
                        </div>

                        <div class="profile-form-grid">

                            <div class="profile-field">
                                <label for="date">Date</label>

                                <input
                                    type="date"
                                    id="date"
                                    name="date"
                                    value="${dateValue!''}"
                                    required>
                            </div>

                            <div class="profile-field">
                                <label for="time">Time</label>

                                <input
                                    type="time"
                                    id="time"
                                    name="time"
                                    value="${timeValue!''}"
                                    required>
                            </div>

                            <div class="profile-field profile-field-full">
                                <label for="location">
                                    Location
                                </label>

                                <input
                                    type="text"
                                    id="location"
                                    name="location"
                                    value="${locationValue!''}"
                                    placeholder="e.g. Jackson Library"
                                    required>
                            </div>

                            <div class="profile-field profile-field-full">
                                <label for="description">
                                    Group Description
                                </label>

                                <textarea
                                    id="description"
                                    name="description"
                                    rows="5"
                                    placeholder="Describe what your group will be studying.">${descriptionValue!''}</textarea>
                            </div>

                        </div>

                        <div class="profile-form-actions">

                            <a href="/student/edit-profile?id=${student.id?c}"
                               class="profile-cancel">
                                Cancel
                            </a>

                            <button type="submit"
                                    class="profile-save">
                                <i data-lucide="plus-circle"></i>
                                Create Group
                            </button>

                        </div>

                    </form>
                </section>

                <!-- INFORMATION PANEL -->
                <aside class="profile-tips">

                    <div class="tips-icon">
                        <i data-lucide="heart-handshake"></i>
                    </div>

                    <span class="tips-label">
                        STUDY TOGETHER
                    </span>

                    <h2>Better studying starts here.</h2>

                    <p>
                        Create a welcoming space for classmates
                        to share ideas and prepare for exams.
                    </p>

                    <div class="tips-divider"></div>

                    <div class="tip-item">
                        <i data-lucide="check-circle-2"></i>
                        <span>Choose a clear group name.</span>
                    </div>

                    <div class="tip-item">
                        <i data-lucide="check-circle-2"></i>
                        <span>Pick a course from your catalog.</span>
                    </div>

                    <div class="tip-item">
                        <i data-lucide="check-circle-2"></i>
                        <span>Plan a convenient meeting time.</span>
                    </div>

                </aside>

            </div>

            <footer class="dashboard-footer">
                <span>Made for students, by students.</span>
                <span>StudyMatch © 2026</span>
            </footer>

        </main>
    </div>

    <script>
        window.addEventListener("DOMContentLoaded", function () {
            if (window.lucide) {
                lucide.createIcons();
            }

            const studentId = document.querySelector(
                'input[name="studentId"]'
            ).value;

            document.getElementById("groupSidebarLink").href =
                "/student/create-group?studentId=" +
                encodeURIComponent(studentId);
        });
    </script>

</body>
</html>
