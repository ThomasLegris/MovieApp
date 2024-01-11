package com.example.movieapp.android

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.movieapp.Api.Models.ApiGenres
import com.example.movieapp.Api.Models.MovieCategory

@Composable
fun GenreView(genres: ApiGenres) {
    LazyColumn(
        modifier = Modifier.fillMaxWidth(),
        contentPadding = PaddingValues(16.dp)
    ) {
        items(genres.genres) {
            Row(
                modifier = Modifier
                    .wrapContentHeight()
                    .fillMaxWidth()
                    .padding(vertical = 8.dp)
                    .background(Color.LightGray),
                horizontalArrangement = Arrangement.Center,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(text = it.name)
            }
        }
    }
}

@Preview
@Composable
fun GenreViewPreview() {
    GenreView(genres = ApiGenres(listOf(MovieCategory(identifier = 1, name = "Test"))))
}