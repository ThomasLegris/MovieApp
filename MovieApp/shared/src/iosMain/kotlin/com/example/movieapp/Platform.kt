package com.example.movieapp

import platform.UIKit.UIDevice

class IOSPlatform: Platform {
    override val name: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice
    override var id: String = "iOS"
}

actual fun getPlatform(): Platform = IOSPlatform()