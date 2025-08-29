# Candidate Coding Test (Rails API)

## Pre-requisites
- Ruby 3.4.1


## Setup
```bash
bundle install
rails db:create db:migrate db:seed
rspec
rails s
```

## The coding exercise
*Time limit: 50 minutes.*

You are tasked with creating a simple Rails API application to manage projects and tasks.
The application should allow users to perform CRUD operations on projects and tasks. Each project can have multiple tasks associated with it.
Some starter code has been provided to help you get started.

### Requirements
1. **Models**:
Create two models: `Project` and `Task`.
   - A `Project` should have the following attributes:
     - `title` (string, required, unique)
      
   - A `Task` should have the following attributes:
     - `title` (string, required, unique within the scope of a project)
     - `completed_at` (datetime, default: nil)
     - `due_at` (datetime, default: nil)
     - `project_id` (foreign key to Project, required)


2. **Associations**:
   - A `Project` has many `Tasks`.
   - A `Task` belongs to a `Project`.
   - When a `Project` is deleted, all associated `Tasks` should also be deleted (cascade delete).


3. **Validations**:
   - Ensure that the `title` attribute is present for both `Project` and `Task` models.
   - Ensure that the `title` of a `Project` is unique.
   - Ensure that the `title` of a `Task` is unique within the scope of its associated `Project`.
   - Ensure that the `due_at` attribute of a `Task`, if provided, is a future date/time.


4. **API Endpoints**:
   - Implement the following RESTful API endpoints:
     - `GET /projects`: List all projects. 
     - `POST /projects`: Create a new project.
     - `GET /projects/:id/tasks`: Retrieve all tasks for a specific project.
     - `POST /projects/:id/tasks`: Create a new task for a specific project.
     **Read #5 for more details about this endpoint.**
     - `GET /projects/:id/summary`: Retrieve a specific project by ID along with the count of completed and pending tasks.
     **Read #6 for more details about this endpoint.**


5. **Task Creation Service Object**:
   - Create a service object that can be called to create a `Task` for a specific `Project`.
   - This should queue a background job that's scheduled to run 1 hour before the
   task's `due_at` time to send a reminder email (`TaskMailer#due_date_reminder`).


6. **Project Summary Service Object**:
   - Create a service object that can be called to get a summary of a project.
   - The summary should include:
     - Project title
     - Total number of tasks
     - Number of completed tasks (Use a scope in the Task model to determine if a task is completed)
     - Number of pending tasks (Use a scope in the Task model to determine if a task is pending)
     - Number of overdue tasks (Use a scope in the Task model to determine if a task is overdue)


7. **Testing**:
   - Write full RSpec tests to cover the models, **service objects**, and API endpoints.


8. **Assumptions**:
   - You can use any gems or libraries that you find suitable for the task.
   - Focus on writing clean, maintainable, and well-documented code.


9. **Bonus**:
    - The Project Summary Service Object should be able to filter by completed date range if provided (e.g., tasks completed within the last week).
    - Implement pagination for the `GET /projects` endpoint.


