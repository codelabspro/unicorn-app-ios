package com.codelabspro.unicornkmm

class Greeting {
    private val platform: Platform = getPlatform()

    fun greeting(): String {
        return "Unicorn, ${platform.name}!"
    }
}