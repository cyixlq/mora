package top.cyixlq.mora

import io.flutter.app.FlutterApplication
import com.didichuxing.doraemonkit.DoraemonKit

class MyApplication : FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        DoraemonKit.install(this)
    }
}