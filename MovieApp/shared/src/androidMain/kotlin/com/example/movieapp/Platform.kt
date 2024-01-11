package com.example.movieapp

class AndroidPlatform : Platform {
    override val name: String = "Android ${android.os.Build.VERSION.SDK_INT}"
    override var id: String = "Android"
}

actual fun getPlatform(): Platform = AndroidPlatform()