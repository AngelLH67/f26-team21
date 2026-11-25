
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch - Edit Course</title>
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
        <h2>Edit Course</h2>
        <p>Update the course listing information.</p>

        <div class="form-container">

            <form action="/courses/${course.id}/edit" method="post">

                <div class="form-group">
                    <label for="courseNumber">Course Number</label>
                    <input type="text" id="courseNumber"
                           name="courseNumber"
                           value="${course.courseNumber}" required>
                </div>

                <div class="form-group">
                    <label for="courseName">Course Name</label>
                    <input type="text" id="courseName"
                           name="courseName"
                           value="${course.courseName}" required>
                </div>

                <div class="form-group">
                    <label for="instructor">Instructor</label>
                    <input type="text" id="instructor"
                           name="instructor"
                           value="${course.instructor}" required>
                </div>

                <div class="form-group">
                    <label for="description">Course Description</label>
                    <textarea id="description" name="description"
                              rows="5" required>${course.description}</textarea>
                </div>

                <button class="action-button" type="submit">
                    Save Changes
                </button>

                <a class="back-button" href="/courses">Cancel</a>

            </form>

        </div>
    </main>

</body>
</html>
