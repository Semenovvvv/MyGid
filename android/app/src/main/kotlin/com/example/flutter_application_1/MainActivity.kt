package com.example.flutter_application_1

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
   override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
      MapKitFactory.setLocale("YOUR_LOCALE")
      MapKitFactory.setApiKey("f25ab49a-7d0b-4859-8be3-779aab08758b")
      super.configureFlutterEngine(flutterEngine)
    }
}
