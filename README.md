
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
