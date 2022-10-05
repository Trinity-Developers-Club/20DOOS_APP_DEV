package com.japneet.pythoncompiler;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.chaquo.python.PyObject;
import com.chaquo.python.Python;
import com.chaquo.python.android.AndroidPlatform;
import com.google.android.material.textfield.TextInputEditText;

public class MainActivity extends AppCompatActivity {

    Button run;
    TextInputEditText input;
    TextView output;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();

        run = findViewById(R.id.run);
        input = findViewById(R.id.input);
        output = findViewById(R.id.output);

        if(!Python.isStarted())
            Python.start(new AndroidPlatform(this));


        run.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String inputt = input.getText().toString();
                Python py = Python.getInstance();
                PyObject pyObj = py.getModule("script");
                PyObject obj = pyObj.callAttr("main",inputt);
                output.setText(obj.toString());
            }
        });



    }
}