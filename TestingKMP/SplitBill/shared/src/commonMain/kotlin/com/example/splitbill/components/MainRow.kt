package com.example.splitbill.components

import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview

import androidx.compose.ui.unit.dp
import com.example.splitbill.ui.theme.colors

@Composable
fun MainRow(title: String, total: Double) {
    Row(
        modifier = Modifier.fillMaxWidth()
            .padding(all = 10.dp)
    ) {
        Text(
            text = title,
            color = Color.Gray,
            modifier = Modifier.weight(weight = 2f)
        )
        Text(
            text = "$$total",
            fontWeight = FontWeight.Bold
        )
    }
}

@Composable
@Preview
fun MainRowPreview(){
    MaterialTheme (colors) {
        MainRow(title = "title", total = 10.0)
    }
}
