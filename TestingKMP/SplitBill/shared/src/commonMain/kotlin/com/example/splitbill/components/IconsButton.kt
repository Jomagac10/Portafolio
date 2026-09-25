package com.example.splitbill.components

import androidx.compose.foundation.layout.size
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowCircleDown
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.splitbill.ui.theme.colors

@Composable
fun IconsButton(
    image: ImageVector,
    description: String,
    onClick :  () -> Unit,
) {
    IconButton(onClick) {
        Icon(
            imageVector = image,
            contentDescription = description,
            modifier = Modifier.size(50.dp)
        )
    }
}

@Composable
@Preview
fun IconsButtonPreview(){
    MaterialTheme(colorScheme = colors) {
        IconsButton(
            onClick = {},
            image = Icons.Default.ArrowCircleDown,
            description = "description"
        )
    }

}