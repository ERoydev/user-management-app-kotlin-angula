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
  
  <li>
    Ensure PostgreSQL is running and configure your database connection in the <code>application.properties</code> file:
    <pre><code>
spring.datasource.url=jdbc:postgresql://localhost:5432/yourdb
spring.datasource.username=your_username
spring.datasource.password=your_password
    </code></pre>
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
