package com.example.movieapp.android

import android.os.Bundle
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
    var genres: ApiGenres? by remember {
        mutableStateOf(null)
    }

    Column(
        Modifier
            .fillMaxWidth()
    ) {

        Button(onClick = {
            GlobalScope.launch {
                println(MoviesRepositoryImpl().popularMovies())
            }
        },
        modifier = Modifier
            .fillMaxWidth()) {
            Text("Popular request")
        }

        Button(onClick = {
            GlobalScope.launch {
                println(MoviesRepositoryImpl().topRatedMoviesAtDates())
            }
        },
            modifier = Modifier
                .fillMaxWidth()) {
            Text("Top rated request")
        }

        genres?.let {
            GenreView(genres = it)
        }
    }
}
