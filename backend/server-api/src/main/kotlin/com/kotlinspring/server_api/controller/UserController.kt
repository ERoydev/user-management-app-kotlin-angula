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
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestParam
import java.util.*

// @ResponseEntity => Gives me full control of what is returned to the client including status, code, headers, body
// Instead of just returning the body (list of users, a single user or something else)

@RestController
@RequestMapping("/users")
class UserController(private val userRepository: UserRepository) {
    // I create my logger
    private val logger = LoggerFactory.getLogger(UserController::class.java)

    init {
        println("<===== UserController is initialized successfully! =====>")
    }

}