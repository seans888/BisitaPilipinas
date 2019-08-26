package com.apc.edu.ph.violationsystem;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    EditText email,pass;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        email = findViewById(R.id.txtEmail);
        pass = findViewById(R.id.txtPassword);
    }

    public void login(View view) {
        RequestQueue queue = Volley.newRequestQueue(MainActivity.this);
        String url = "http://192.168.1.9/apcviosystem/login.php";

        StringRequest postRequest = new StringRequest(Request.Method.POST, url,
        new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.d("APPLOG",response);
            }

            },
            new Response.ErrorListener()
            {
                @Override
                public void onErrorResponse(VolleyError error)
                {
                    Log.d("APPLOG",error.toString());
                }
            }

        ){
            @Override
            protected Map<String, String> getParams ()
            {
                Map<String, String> params = new HashMap<String, String>();
                params.put("post.email", email.getText().toString().trim());
                params.put("post_passwd", pass.getText().toString().trim());
                return params;
            }
        };
        queue.add(postRequest);
    }
}
