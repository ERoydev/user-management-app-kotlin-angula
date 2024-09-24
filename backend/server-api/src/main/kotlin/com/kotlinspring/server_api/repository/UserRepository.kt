package com.kotlinspring.markovski_rest_app.repository

import com.kotlinspring.markovski_rest_app.model.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

/*
I Use Repository layer to interact with the database.
This UserRepository interface will interact with the User Entity
 */

// Its good idea to create a service package UserService that will interact with userRepository in UserController instead.
@Repository // JPA handles all basic Crud operations
interface UserRepository: JpaRepository<User, Long> {

    // Raw Query
    @Query("SELECT u FROM User u WHERE u.firstName LIKE %:searchTerm% OR u.lastName LIKE %:searchTerm% OR u.email LIKE %:searchTerm% OR u.phoneNumber LIKE %:searchTerm%")
    fun searchBySearchTerm(@Param("searchTerm") searchTerm: String): List<User>
}

// I Use Repositories to interact with the database