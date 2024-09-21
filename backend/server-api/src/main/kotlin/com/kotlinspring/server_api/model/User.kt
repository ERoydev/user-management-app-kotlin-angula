package com.kotlinspring.markovski_rest_app.model

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table
import java.time.LocalDate

// Entity or Domain. I use this to represent the data that i work with in my application.
// Maps to database tables and defines the structure of my objects.

@Entity // I put this to Mark the class as JPA entity (a table in database) same as models in Django
@Table(name = "users")
data class User(
    // With GeneratedValue annotation i tell to JPA to generate the value for this field
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) // Indicates the PK
    val id: Int? = null, // i need to set it to null because i use GeneratedValue and the ID will be generated when the entity is first saved.

    /*
        Since i use snake case in my postgres and i use camelCase here
        I can use @Column annotation to map camel case to snake case field names in my kotlin code
     */
    @Column(name="first_name") // Mapping...
    val firstName: String,

    @Column(name="last_name") // Mapping...
    val lastName: String,

    @Column(name="date_of_birth")
    val dateOfBirth: LocalDate,

    @Column(name="phone_number")
    val phoneNumber: String,

    val email: String,
) {}