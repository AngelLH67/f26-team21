# StudyMatch backend API

# UML Class Diagram

![Class Diagram](../docs/smuml-class.png)

## Deployment

**Render API URL:** https://dragonball-api-5i0o.onrender.com/api/characters  

The API is deployed on Render and uses Neon PostgreSQL for persistent database storage.

### Cold-Start Note

This API uses Render's free tier. The service may sleep after a period of inactivity. The first request after the service has been idle can take up to a minute while it starts.


## Study groups

| Method | Path | Purpose | Response code | Error codes | User story | Implemented by |
| ------ | ---- | ------- | ------------- | ----------- | ---------- | -------------- |
| `DELETE` | `/api/study-groups/{id}` | Remove a study group by ID | `204 No Content` | `404` | **US-6 — Remove Inappropriate Groups** | Angel Lopez |

## Courses

| Method | Path | Purpose | Response code | Error codes | User story | Implemented by |
| ------ | ---- | ------- | ------------- | ----------- | ---------- | -------------- |
| `GET` | `/api/courses` | Retrieve all courses | `200 OK` | — | **US-7 — Manage Course Listings** | Angel Lopez |
| `GET` | `/api/courses/{id}` | Retrieve a course by ID | `200 OK` | `404` | **US-7 — Manage Course Listings** | Angel Lopez |
| `POST` | `/api/courses` | Create a course | `201 Created` | `400` | **US-7 — Manage Course Listings** | Angel Lopez |
| `PUT` | `/api/courses/{id}` | Update a course | `200 OK` | `404` | **US-7 — Manage Course Listings** | Angel Lopez |
| `DELETE` | `/api/courses/{id}` | Delete a course by ID | `204 No Content` | `404` | **US-7 — Manage Course Listings** | Angel Lopez |

### Example Course Request

```http
POST /api/courses
Content-Type: application/json
```

```json
{
  "courseName": "CSC340"
}
```

### Example Course Update Request

```http
PUT /api/courses/2
Content-Type: application/json
```

```json
{
  "courseName": "CSC340 - Software Engineering"
}
```

## Registered users

| Method | Path | Purpose | Response code | Error codes | User story | Implemented by |
| ------ | ---- | ------- | ------------- | ----------- | ---------- | -------------- |
| `GET` | `/api/students` | Retrieve all registered students | `200 OK` | — | **US-8 — View Registered Users** | Angel Lopez |

## Reports

| Method | Path | Purpose | Response code | Error codes | User story | Implemented by |
| ------ | ---- | ------- | ------------- | ----------- | ---------- | -------------- |
| `GET` | `/api/reports` | Retrieve all reports, including the reported student and reporter | `200 OK` | — | **US-9 — Review Reported Users** | Angel Lopez |
| `GET` | `/api/reports/{id}` | Retrieve a report by ID | `200 OK` | `404` | **US-9 — Review Reported Users** | Angel Lopez |
| `POST` | `/api/reports` | Create a report identifying the reported student and reporter | `201 Created` | `400` | **US-9 — Review Reported Users** | Angel Lopez |
| `PUT` | `/api/reports/{id}` | Review a report by updating its details and status | `200 OK` | `404` | **US-9 — Review Reported Users** | Angel Lopez |

### Example Report Request

```http
POST /api/reports
Content-Type: application/json
```

```json
{
  "reason": "Inappropriate behavior in a study group",
  "status": "Pending",
  "date": "2026-10-19",
  "reportedStudent": {
    "id": 2
  },
  "reporter": {
    "id": 1
  }
}
```

### Example Report Review Request

```http
PUT /api/reports/1
Content-Type: application/json
```

```json
{
  "reason": "Inappropriate behavior in a study group",
  "status": "Reviewed",
  "date": "2026-10-19"
}
```

Passwords and database connection strings are intentionally excluded from this documentation.

