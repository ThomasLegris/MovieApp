package com.example.movieapp.Api.Managers

import com.example.movieapp.Api.Constants.ApiConst
import com.example.movieapp.Api.Constants.ApiCountryCode
import com.example.movieapp.Api.Models.ApiGenres
import com.example.movieapp.Api.Models.ApiMovies
import com.example.movieapp.getPlatform
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.plugins.HttpResponseValidator
import io.ktor.client.plugins.ResponseException
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.observer.ResponseObserver
import io.ktor.client.request.get
import io.ktor.client.request.headers
import io.ktor.client.request.parameter
import io.ktor.client.statement.HttpResponse
import io.ktor.client.statement.bodyAsText
import io.ktor.http.HttpHeaders
import io.ktor.http.URLProtocol
import io.ktor.http.appendPathSegments
import io.ktor.http.isSuccess
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json


class HttpExceptions(
    response: HttpResponse,
    failureReason: String?,
    cachedResponseText: String
) :
    ResponseException(response = response, cachedResponseText = cachedResponseText) {

    override val message: String = "Status: ${response.status}." + "Failure: $failureReason"
}

/// Implementation of `ApiManager` interface used to perform api call.
class MoviesRepositoryImpl : MoviesRepository {
    /**
     * Private Properties
     */
    /// Client property used to do api call
    private val client = HttpClient {
        expectSuccess = false
        install(ContentNegotiation) // Plugin to serialize data in a specific format.
        {
            json(Json {
                prettyPrint = true
                isLenient = true
                ignoreUnknownKeys = true
                useAlternativeNames = false
            })
        }
        install(ResponseObserver) {
            onResponse { httpResponse ->
                println("Movie Request url: ${httpResponse.call.request.url}")
                println("Movie Response Code: ${httpResponse.status}")
                println("platform ${getPlatform()}")
            }
        }
        HttpResponseValidator {
            validateResponse { response ->
                if (!response.status.isSuccess()) {
                    val httpFailureReason = "${response.status.value}"

                    throw HttpExceptions(
                        response = response,
                        failureReason = httpFailureReason,
                        cachedResponseText = response.bodyAsText()
                    )
                }
            }
        }
    }

    /**
     * Override Functions
     */
    override suspend fun movieGenres(): ApiGenres {
        val response = client.get(ApiConst.BASE_URL) {
            headers {
                append(HttpHeaders.Accept, "application/json")
            }
            url {
                protocol = URLProtocol.HTTP
                appendPathSegments(ApiConst.GENRES_PATH)
            }
        }.body<ApiGenres>()

        return response
    }

    override suspend fun popularMovies(): ApiMovies {
        return fetchMovies(path = ApiConst.POPULAR_MOVIES_PATH)
    }

    override suspend fun topRatedMoviesAtDates(
        beginDateString: String?,
        endDateString: String?,
        countryCode: ApiCountryCode?
    ): ApiMovies {
        val datesParams: MutableMap<String, Any> = mutableMapOf()
        beginDateString?.let {
            datesParams[ApiConst.BEGIN_RELEASE_DATE_KEY] = it
        }
        endDateString?.let {
            datesParams[ApiConst.END_RELEASE_DATE_KEY] = it
        }
        countryCode?.let {
            datesParams[ApiConst.COUNTRY_KEY] = it.name
        }

        return fetchMovies(
            path = ApiConst.TOP_RATED_MOVIES_PATH,
            parameters = datesParams
        )
    }

    override suspend fun upcomingMovies(): ApiMovies {
        return fetchMovies(path = ApiConst.UPCOMING_MOVIES_PATH)
    }

    override suspend fun theaterMovies(): ApiMovies {
        return fetchMovies(path = ApiConst.THEATER_MOVIES_PATH)
    }

    /**
     * Private Functions
     */
    /// Create client request to fetch movies according to a selected path.
    private suspend fun fetchMovies(path: String, parameters: Map<String, Any>? = null): ApiMovies {
        val response = client.get(ApiConst.BASE_URL) {
            headers {
                append(HttpHeaders.Accept, "application/json")
            }
            url {
                protocol = URLProtocol.HTTP
                appendPathSegments(path)
                parameters?.forEach {
                    parameter(it.key, it.value)
                }
            }
        }.body<ApiMovies>()
        return response
    }
}