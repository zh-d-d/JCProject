package com.jc_zhangdd.lib_common

import android.app.Application
import android.util.Log

/**
 * Project: JCProject
 * Created by Zdd on 2018/6/7.
 */
open class BaseApplication() : Application() {
    open val TAG = "BaseApplication"

    override fun onCreate() {
        super.onCreate()

        Log.i(TAG, "base application run")
    }
}