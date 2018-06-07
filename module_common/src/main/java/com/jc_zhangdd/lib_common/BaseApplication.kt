package com.jc_zhangdd.lib_common

import android.app.Application
import android.util.Log
import com.jc_zhangdd.lib_common.util.LogUtils

/**
 * Project: JCProject
 * Created by Zdd on 2018/6/7.
 */
open class BaseApplication() : Application() {
    open val TAG = "BaseApplication"

    override fun onCreate() {
        super.onCreate()
        LogUtils.i(TAG,"base application run")
    }
}