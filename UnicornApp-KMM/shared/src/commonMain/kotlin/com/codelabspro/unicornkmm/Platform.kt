package com.codelabspro.unicornkmm

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform