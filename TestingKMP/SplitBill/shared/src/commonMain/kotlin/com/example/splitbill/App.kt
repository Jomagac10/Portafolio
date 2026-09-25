package com.example.splitbill

import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.*
import com.example.splitbill.ui.theme.colors
import com.example.splitbill.views.HomeView

@Composable
fun App() {
    MaterialTheme(colors) {
        HomeView()
    }
}