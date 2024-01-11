package com.example.movieapp

interface Platform {
    val name: String
    var id: String
}

expect fun getPlatform(): Platform