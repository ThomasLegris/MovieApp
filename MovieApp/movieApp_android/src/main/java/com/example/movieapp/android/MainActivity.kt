package com.example.movieapp.android

import android.content.ContentValues.TAG
import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import com.example.movieapp.Api.Managers.MoviesRepositoryImpl
import com.example.movieapp.Api.Models.ApiGenres
import io.ktor.client.plugins.ClientRequestException
import io.ktor.client.plugins.ServerResponseException
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            Surface(
                modifier = Modifier.fillMaxSize(),
                color = Color.White
            ) {
                MainView()
            }
        }
    }
}

@Composable
fun MainView() {
    val genres: ApiGenres? by remember {
        mutableStateOf(null)
    }

    Column(
        Modifier
            .fillMaxWidth()
    ) {

        Button(
            onClick = {
                GlobalScope.launch {
                    try {
                        println(MoviesRepositoryImpl().popularMovies())
                    } catch (e: ClientRequestException) {
                        Log.d(TAG, "ClientRequestException ${e.message}")
                    } catch (e: ServerResponseException) {
                        Log.d(TAG, "ServerResponseException ${e.message}")
                    } catch (e: ServerResponseException) {
                        Log.d(TAG, "ServerResponseException ${e.message}")
                    } catch (e: Exception) {
                        Log.d(TAG, "Exception ${e.message}")
                    }
                }
            },
            modifier = Modifier
                .fillMaxWidth()
        ) {
            Text("Popular request")
        }

        Button(
            onClick = {
                GlobalScope.launch {
                    try {
                        println(MoviesRepositoryImpl().topRatedMoviesAtDates())
                    } catch (e: ClientRequestException) {
                        Log.d(TAG, "ClientRequestException ${e.message}")
                    } catch (e: ServerResponseException) {
                        Log.d(TAG, "ServerResponseException ${e.message}")
                    } catch (e: ServerResponseException) {
                        Log.d(TAG, "ServerResponseException ${e.message}")
                    } catch (e: Exception) {
                        Log.d(TAG, "Exception ${e.message}")
                    }
                }
            },
            modifier = Modifier
                .fillMaxWidth()
        ) {
            Text("Top rated request")
        }

        genres?.let {
            GenreView(genres = it)
        }
    }
}
