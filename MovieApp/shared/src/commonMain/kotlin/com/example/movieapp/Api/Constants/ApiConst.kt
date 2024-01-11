package com.example.movieapp.Api.Constants

import com.example.movieapp.getPlatform

object ApiConst {
    val BASE_URL: String
        get() {
            return if (getPlatform().id == "Android") {
                "http://10.0.2.2:8888/" // Specific case of android emulator.
            } else {
                "http://localhost:8888"
            }
        }
    // Path
    const val GENRES_PATH: String = "genres"
    const val POPULAR_MOVIES_PATH: String = "movies/popular"
    const val TOP_RATED_MOVIES_PATH: String = "movies/rated"
    const val UPCOMING_MOVIES_PATH: String = "movies/upcoming"
    const val THEATER_MOVIES_PATH: String = "movies/theater"

    // Parameters
    const val BEGIN_RELEASE_DATE_KEY: String = "beginReleaseDate"
    const val END_RELEASE_DATE_KEY: String = "endReleaseDate"
    const val COUNTRY_KEY: String = "origin_country"
}
