package com.example.splitbill.views

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowCircleDown
import androidx.compose.material.icons.filled.ArrowCircleUp
import androidx.compose.material3.Button
import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilterChip
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.splitbill.components.IconsButton
import com.example.splitbill.components.MainCard
import com.example.splitbill.components.MainRow
import com.example.splitbill.ui.theme.colors

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeView() {
    Scaffold(
        topBar = {
            CenterAlignedTopAppBar(
                title = { Text(text = "Title split", fontWeight = FontWeight.Bold) }
            )
        }
    ) { paddingValues ->
        ContentHomeView(modifier = Modifier.padding(paddingValues))
    }
}

@Composable
fun ContentHomeView(
    modifier: Modifier
) {
    //var amount by remember { mutableStateOf(value = "") }
    var amount by rememberSaveable { mutableStateOf(value = "") }
    val options = listOf(0, 10, 15, 25, 30)
    var selectedTip by rememberSaveable { mutableStateOf(value = 0) }
    var peopleNumber by rememberSaveable { mutableStateOf(value = 1) }
    var totalTip by rememberSaveable { mutableStateOf(value = 0.0) }
    var total by rememberSaveable { mutableStateOf(value = 0.0) }
    var totalEach by rememberSaveable { mutableStateOf(value = 0.0) }

    Column(
        modifier = modifier.padding(all = 20.dp)
            .fillMaxWidth(),
        verticalArrangement = Arrangement.Top,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        MainCard(title = "Total bill amount") {
            OutlinedTextField(
                value = amount,
                onValueChange = { amount = it },
                label = { Text(text = "amount") },
                modifier = Modifier.fillMaxWidth(),
                keyboardOptions = KeyboardOptions.Default.copy(
                    keyboardType = KeyboardType.Decimal
                )
            )
            Row(
                horizontalArrangement = Arrangement.spacedBy(2.dp)
            ) {
                options.forEach { option ->
                    FilterChip(
                        selected = selectedTip == option,
                        onClick = { selectedTip = option },
                        label = {
                            Text(
                                text = "$option%",
                                maxLines = 1,
                                fontSize = 10.sp,
                                textAlign = TextAlign.Center
                            )
                        },
                        modifier = Modifier.width(55.dp),
                    )
                }
            }
            Text("Number of persons")
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(30.dp)
            ) {

                IconsButton(
                    image = Icons.Default.ArrowCircleDown,
                    description = "down"
                ) {
                    if (peopleNumber > 1) {
                        peopleNumber--
                    }
                }

                Text(
                    text = "$peopleNumber",
                    fontSize = 50.sp
                )

                IconsButton(
                    image = Icons.Default.ArrowCircleUp,
                    description = "up"
                ) {
                    peopleNumber++
                }

            }
            Button(onClick = {
                totalTip = amount.toDouble() * (selectedTip.toDouble()/100)
                total = amount.toDouble() + totalTip
                totalEach = getPayment(amount,selectedTip,peopleNumber)
            }) {
                Text(
                    text = "Calculate",
                    color = colors.background
                )
            }
        }
        MainCard(title = "Bill summary") {
            MainRow(
                title = "tip Amount",
                total = totalTip
            )
            MainRow(
                title = "total",
                total = total
            )
            Surface (
                color = Color(color = 0XFFE5F9E7),
                shape = RoundedCornerShape(size = 16.dp),
                modifier = Modifier.fillMaxWidth(),
            ) {

                Text(text = "Each person pays: $${totalEach}",
                    textAlign = TextAlign.Center,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(10.dp))
            }
        }
    }
}

fun getPayment(amount: String, tip: Int, people: Int) : Double {
    val tipRes = amount.toDouble() * (tip.toDouble()/100)
    val total = amount.toDouble() + tipRes
    return total / people
}

@Composable
@Preview
fun HomeViewPreview() {
    MaterialTheme(colors) {
        HomeView()
    }
}