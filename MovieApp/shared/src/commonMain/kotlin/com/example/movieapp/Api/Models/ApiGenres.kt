package com.example.movieapp.Api.Models
import kotlinx.serialization.*

@Serializable
data class ApiGenres(var genres: List<MovieCategory>)

@Serializable
data class MovieCategory (
    @SerialName("id")
    var identifier: Int,
    var name: String
    )