package com.jc_zhangdd.jcproject;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;

import com.jc_zhangdd.lib_common.glide.GlideApp;


public class MainActivity extends AppCompatActivity {

    private ImageView viewById;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        viewById = ((ImageView) findViewById(R.id.iv));
        GlideApp.with(this).load("https://www.baidu.com/img/bd_logo1.png?where=super").into(viewById);
    }
}
