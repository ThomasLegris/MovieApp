package com.example.movieapp.Api.Models
import kotlinx.serialization.*

@Serializable
data class ApiMovies(var page: Int,
                     var results: List<ApiMovie>?,
                     @SerialName("total_results")
                     var totalResults: Int,
                     @SerialName("total_pages")
                     var totalPages: Int)
@Serializable
data class ApiMovie(var id: Int,
                    var title: String,
                    @SerialName("release_date")
                    var releaseDate: String,
                    var overview: String,
                    @SerialName("poster_path")
                    var poster: String?,
                    @SerialName("backdrop_path")
                    var backdrop: String?,
                    @SerialName("original_language")
                    var originalLang: String,
                    @SerialName("original_title")
                    var originalTitle: String,
                    @SerialName("vote_average")
                    var voteAverage: Float,
                    @SerialName("vote_count")
                    var voteCount: String,
                    var popularity: Float,
                    @SerialName("genre_ids")
                    var genreIds: List<Int>,
                    var video: Boolean,
                    var adult: Boolean)