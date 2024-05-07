# TodoList

### Step 1: Project Setup
1. Create a new Maven or Gradle project in your preferred IDE.
2. Add required dependencies such as Servlet API and JSTL (JavaServer Pages Standard Tag Library) to your `pom.xml` or `build.gradle` file.
3. Create package directories (`com.servlet`, `com.DAO`, `com.entity`, etc.) for organizing your Java classes.

### Step 2: Create Entity Class
1. Create a Java class `TodoDetails` in the `com.entity` package to represent a Todo item. Include fields such as `id`, `name`, `todo`, and `status`.
2. Implement getters and setters for the fields.

### Step 3: Create Data Access Object (DAO) Class
1. Create a DAO class `TodoDAO` in the `com.DAO` package to handle CRUD (Create, Read, Update, Delete) operations for Todo items.
2. Implement methods for adding, updating, deleting, and retrieving Todo items from the database using JDBC.

### Step 4: Create JSP Pages
1. Create JSP pages (`index.jsp`, `add_todo.jsp`, `edit.jsp`, `delete.jsp`) in the `webapp` directory for displaying the TodoList UI and forms for adding/editing Todo items.
2. Use JSTL tags to iterate over Todo items and display them in the UI.

### Step 5: Create Servlets
1. Create Servlet classes (`AddServlet`, `UpdateServlet`, `DeleteServlet`) in the `com.servlet` package to handle requests from JSP pages.
2. Implement `doGet` and `doPost` methods in each servlet to process requests and interact with the DAO class for CRUD operations.
3. Map servlets to appropriate URL patterns using `@WebServlet` annotation or `web.xml` deployment descriptor.

### Step 6: Implement UI and Functionality
1. In `index.jsp`, display the list of Todo items fetched from the database. Include options to add, update, and delete Todo items.
2. Implement forms in `add_todo.jsp`, `edit.jsp` for adding/editing Todo items, and in `delete.jsp` for confirming item deletion.
3. Include appropriate form actions to submit data to corresponding servlets for processing.

### Step 7: Style UI (Optional)
1. Use CSS to style the UI components, including the navbar, forms, buttons, and tables.
2. Add Bootstrap or other CSS frameworks for responsive design and pre-styled components.

### Step 8: Testing
1. Test the application by adding, updating, and deleting Todo items to ensure all functionalities work as expected.
2. Debug any errors or issues encountered during testing.

   
![image](https://github.com/Manuraj07/TodoList/assets/87747649/5ee6cd74-22c6-47b4-bfbb-1226af5d5951)

![image](https://github.com/Manuraj07/TodoList/assets/87747649/55d1d91c-bdeb-4bc6-ad50-c03bc0bc9771)


