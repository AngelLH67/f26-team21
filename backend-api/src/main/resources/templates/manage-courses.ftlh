
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch - Manage Courses</title>
    <link rel="stylesheet" href="/styles.css">
</head>

<body>

    <header>
        <h1>StudyMatch</h1>
        <nav>
            <a href="/admin">Dashboard</a>
        </nav>
    </header>

    <main>
        <h2>Manage Course Listings</h2>
        <p>Manage the courses available to StudyMatch users.</p>

        <#if message??>
            <p class="success-message">${message}</p>
        </#if>

        <table>
            <thead>
                <tr>
                    <th>Course</th>
                    <th>Course Name</th>
                    <th>Instructor</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>
                <#if courses?has_content>
                    <#list courses as course>
                        <tr>
                            <td>${course.courseNumber}</td>
                            <td>${course.courseName}</td>
                            <td>${course.instructor}</td>
                            <td>
                                <a class="action-button"
                                   href="/courses/${course.id}/edit">Edit</a>

                                <form action="/courses/${course.id}/delete"
                                      method="post" style="display:inline;">
                                    <button class="action-button delete-button"
                                            type="submit">
                                        Remove
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </#list>
                <#else>
                    <tr>
                        <td colspan="4">No courses have been added yet.</td>
                    </tr>
                </#if>
            </tbody>
        </table>

        <a class="action-button add-course-button" href="/courses/new">
            + Add Course
        </a>

        <div>
            <a class="back-button" href="/admin">
                Back to Dashboard
            </a>
        </div>
    </main>

</body>
</html>
