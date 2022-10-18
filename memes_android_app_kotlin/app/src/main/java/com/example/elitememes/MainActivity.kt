package com.example.elitememes

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.ImageView
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.bumptech.glide.Glide
import org.json.JSONObject


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun nextMeme(view: View) {
        val api: String = "https://meme-api.herokuapp.com/gimme"
        val imgView = findViewById<ImageView>(R.id.imageView)

        val queue = Volley.newRequestQueue(this)

// Request a string response from the provided URL.
        val stringRequest = StringRequest(
            Request.Method.GET,
            api,
            { response: String ->
                // Display the first 500 characters of the response string.
                val obj = JSONObject(response)
                val img = obj.getString("url")
                Glide.with(this).load(img).into(imgView)
            },
            { println("That didn't work!") }
        )
// Add the request to the RequestQueue.
        queue.add(stringRequest)

    }


}