package com.example.videoconferencingapp;

import androidx.appcompat.app.AppCompatActivity;
import android.view.View;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;

import org.jitsi.meet.sdk.JitsiMeetActivity;
import org.jitsi.meet.sdk.JitsiMeetConferenceOptions;

import java.net.MalformedURLException;
import java.net.URL;


public class MainActivity extends AppCompatActivity {
    EditText t1;
    Button b1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //  To handle exceptions
        try {
            JitsiMeetConferenceOptions options = new JitsiMeetConferenceOptions.Builder()
                    .setServerURL(new URL(""))
                    .setWelcomePageEnabled(false)
                    .build();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
    }
        public void onClick(View v){
            t1 = findViewById(R.id.room_name);
            String text = t1.getText().toString();

            if(text.length() > 0){
                JitsiMeetConferenceOptions options = new JitsiMeetConferenceOptions.Builder()
                        .setRoom(text)
                        .setWelcomePageEnabled(true)
                        .build();
                JitsiMeetActivity.launch(this, options);
            }

        }


}