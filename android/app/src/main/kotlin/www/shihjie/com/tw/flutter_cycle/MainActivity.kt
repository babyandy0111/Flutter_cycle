package www.shihjie.com.tw.flutter_cycle

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        // super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                result.success(200)
            }
            // result.error("UNAVAILABLE", "Battery level not available.", null)
            // result.notImplemented()
        }

        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}