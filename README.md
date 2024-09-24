<h2>1. Prerequisites for Backend (Kotlin, Gradle, Spring Boot)</h2>

<p>To run the Kotlin-based Spring Boot API locally, ensure the following are installed on your machine:</p>

<ul>
  <li>
    <strong>JDK (Java Development Kit) version 17</strong><br>
    The project uses Java 17. Install JDK 17 from 
    <a href="https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html" target="_blank">Oracle JDK</a> 
    <br>
    Verify installation:
    <pre><code>java -version</code></pre>
  </li>

  <li>
    <strong>PostgreSQL</strong><br>
    PostgreSQL is used as the database. Make sure it is installed and running on your machine. 
    You can download PostgreSQL from the 
    <a href="https://www.postgresql.org/download/" target="_blank">PostgreSQL Official Website</a>.<br>
    Once installed, configure your database connection in the project’s 
    <code>application.properties</code> or <code>application.yml</code> file.
  </li>
  <li>
    <h1><strong>Setup Database</strong><br></h1>
    Make sure you are in the main folder user-management-app-kotlin-angular where setup_database.sql file is located and check if you have install psql. It is required to run the following script.<br>
    <h2>Run this script</h2>
    <pre><code>psql -U postgres -d postgres -f ./setup_database.sql"</code></pre>
  </li>
</ul>

<h2>2. Backend (Spring Boot API with Kotlin)</h2>

<h3>Installation Steps</h3>

<ol>
  <li>
    Clone the project repository:
    <pre><code>git clone https://github.com/ERoydev/user-management-app-kotlin-angula.git</code></pre>
  </li>
  
  <li>
    Navigate to the backend directory (if applicable):
    <pre><code>cd .\backend\server-api\</code></pre>
  </li>
  
  <li>
    Use the Gradle Wrapper to build the project:
    <pre><code>./gradlew build</code></pre>
  </li>
  
</ol>

<h3>Running the API</h3>
<ol>
  <li>
    To run the Spring Boot application go inside the server_api package inside kotlin and run the root App called "MarkovskiRestAppApplication"
  </li>
  
  <li>
    The application will run at <code>http://localhost:8080/</code>.
  </li>
</ol>

<br>
<h1>API Documentation</h1>
<p>I have Springdoc implemented when you run the app you can see, test and explore the API in depth.</p>
<table>
  <thead>
    <tr>
      <th>Endpoint</th>
      <th>HTTP Method</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>/users</td>
      <td>POST</td>
      <td>Create a new user.</td>
    </tr>
    <tr>
      <td>/users</td>
      <td>GET</td>
      <td>Retrieve all users.</td>
    </tr>
    <tr>
      <td>/users/{id}</td>
      <td>GET</td>
      <td>Retrieve a user by ID.</td>
    </tr>
    <tr>
      <td>/users/{id}</td>
      <td>PUT</td>
      <td>Update a user by ID.</td>
    </tr>
    <tr>
      <td>/users/{id}</td>
      <td>DELETE</td>
      <td>Delete a user by ID.</td>
    </tr>
    <tr>
      <td>/users/search?searchTerm={searchTerm}</td>
      <td>GET</td>
      <td>Search users by a search term (name, email, etc.).</td>
    </tr>
  </tbody>
</table>
<hr>

<h1>FrontEnd Angular Client to consume the API</h1><br>

This is an Angular project using Angular version "16.1.6" . It includes Angular Material and TailwindCSS for styling. https://github.com/ERoydev/markovski_repo

## Features
- Modern UI built with Angular and styled using Tailwind CSS.
- Integration with MockAPI for data management.
- Responsive design for various screen sizes.



### Prerequisites
- [Node.js](https://nodejs.org/) (v16.x.x or later is recommended)
- npm (usually comes with Node.js)
- Angular CLI 16.
    ```bash
    npm install -g @angular/cli@16.1.6
    ```

### Steps
1. Clone the repository:
    ```bash
    git clone https://github.com/ERoydev/markovski_repo.git
    ```
2. Navigate to the project directory:
    ```bash
    cd markovski_repo
    ```
3. Install the dependencies:
    ```bash
    npm install
    ```

## Usage

### Running the Application
To start the Angular application, run:
```bash
ng serve
```
### Home page
<br />
<br />


![MarkovskiPicture](https://github.com/user-attachments/assets/553ee9a0-355d-4adb-999e-a01ffa7d1571)
