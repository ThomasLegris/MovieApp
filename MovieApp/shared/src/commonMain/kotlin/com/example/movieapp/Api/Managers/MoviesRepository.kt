package com.example.movieapp.Api.Managers

import com.example.movieapp.Api.Constants.ApiCountryCode
import com.example.movieapp.Api.Models.ApiGenres
import com.example.movieapp.Api.Models.ApiMovies

interface MoviesRepository {
    /// Called to get list of all available movie genres.
    suspend fun movieGenres(): ApiGenres

    /// Called to get list of now popular movies.
    suspend fun popularMovies(): ApiMovies

    /// Called to get the list of top rated movies at a specific range of dates.
    /// Dates are optional, user can provide, min and/or max or nothing to get whole time top ranked.
    /// Can provide country to see the a top by country release.
    suspend fun topRatedMoviesAtDates(
        beginDateString: String? = null,
        endDateString: String? = null,
        countryCode: ApiCountryCode? = null
    ): ApiMovies

    /// Called to get list of new film upcoming in next weeks
    suspend fun upcomingMovies(): ApiMovies

    /// Called to get list of now in theater movies.
    suspend fun theaterMovies(): ApiMovies
}