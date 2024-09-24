package com.kotlinspring.markovski_rest_app.controller

// My packages
import com.kotlinspring.markovski_rest_app.model.User
import com.kotlinspring.markovski_rest_app.repository.UserRepository
import org.slf4j.Logger
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

// My logger
import org.slf4j.LoggerFactory
import org.springframework.data.domain.Sort
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestParam
import java.util.*

// @ResponseEntity => Gives me full control of what is returned to the client including status, code, headers, body
// Instead of just returning the body (list of users, a single user or something else)

@CrossOrigin(origins = ["http://localhost:4200"])  // Apply CORS for this controller
@RestController
@RequestMapping("/users")
class UserController(private val userRepository: UserRepository) {
    // I create my logger
    private val logger = LoggerFactory.getLogger(UserController::class.java)

    init {
        println("<===== UserController is initialized successfully! =====>")
    }

    // CREATE
    @PostMapping("")
    fun createUser(@RequestBody user: User): ResponseEntity<Any> { // I specify (types and what fun return) like i do in TypeScript
        println(user)
        return try {
            val savedUser = userRepository.save(user)
            logger.info("Successfully created user with email: ${savedUser.email}!")
            ResponseEntity.ok(savedUser) // I return 200 OK with saved user
        } catch (e: Exception) {
            logger.error("Error creating user", e)
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error creating user") // HTTP 500
        }
    }

    // READ
    @GetMapping("")
    fun getAllUsers(): ResponseEntity<Any> {
        return try {
            val sort = Sort.by("lastName", "DateOfBirth") // Since the assign says sorting is included for `LastName` and `Birth Date`
            val users = userRepository.findAll(sort)
            logger.info("Users fetched successfully!")
            ResponseEntity.ok(users)
        } catch (e: Exception) {
            logger.error("Error fetching all the users", e)
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching users")
        }
    }

    @GetMapping("/{id}")
    fun getUser(@PathVariable(value = "id") id: Long): ResponseEntity<Any> {
        return try {
            val user = userRepository.findById(id)
            if (user.isPresent) {
                logger.info("Successfully fetched user!")
                ResponseEntity.ok(user.get()) // 200
            } else {
                logger.error("User with this id does not exists!")
                ResponseEntity.status(HttpStatus.NOT_FOUND).body("User with this id does not exists!")
            }
        } catch (e: Exception) {
            logger.error("Error fetching user with id $id", e)
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching user!")
        }
    }

    // UPDATE
    @PutMapping("/{id}")
    fun updateUser(@PathVariable(value = "id") id: Long, @RequestBody newUserData: User): ResponseEntity<Any> {
        return try {
            val existingUser: User =
                userRepository.findById(id).orElseThrow { RuntimeException("User with this id doesn't exists.") }

            val updatedUser = existingUser.copy(
                firstName = newUserData.firstName,
                lastName = newUserData.lastName,
                dateOfBirth = newUserData.dateOfBirth,
                phoneNumber = newUserData.phoneNumber,
                email = newUserData.email
            )

            val savedUser = userRepository.save(updatedUser)
            logger.info("Updating user is successfully!")
            ResponseEntity.ok(savedUser)
        } catch (e: Exception) {
            logger.error("Updating user failed!")
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating user!")
        }
    }

    // DELETE
    @DeleteMapping("/{id}")
    fun deleteUser(@PathVariable(value = "id") id: Long): ResponseEntity<Any> {
        val user: User = userRepository.findById(id).orElseThrow({RuntimeException("User with this id doesn't exists.")})
        userRepository.delete(user)
        return ResponseEntity.ok(user)
    }

    // Search EndPoint
    // I have Configured it to Search for ([firstName, lastName, email, phoneNumber])
    @GetMapping("/search")
    fun searchUser(@RequestParam searchTerm: String): List<User> {
        // I need to trim my searchTerm to remove all whitespaces
        val trimmedSearchTerm = searchTerm.trim()
        return userRepository.searchBySearchTerm(trimmedSearchTerm)
    }
}