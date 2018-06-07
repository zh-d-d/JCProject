package com.jc_zhangdd.jcproject

import android.app.Application
import android.util.Log
import com.jc_zhangdd.lib_common.BaseApplication
import com.jc_zhangdd.lib_common.util.LogUtils

/**
 * Project: JCProject
 * Created by Zdd on 2018/6/7.
 */
class AppApplication() : BaseApplication() {
    override val TAG = "AppApplication"

    override fun onCreate() {
        super.onCreate()
        LogUtils.i(TAG, "app application run")
    }
}