# SID9-Cropper
Crop scanning area before pass parameter to SID9 SDK

## How to use
1. Make this project as your submodule.
2. Set `TransformImageAnalyzer` to your `ImageAnalysis` and set `OnTransformListener` to get transformed result.
```
val analyzer = TransformImageAnalyzer()
analyzer.onTransformListener = object : OnTransformListener {
    override fun onTransformed(result: LuminanceSourceResult) {
        // pass the result to SID9 SDK
        D9CodeStarter.getInstance()
            .decodeD9Code(result.croppedData, result.croppedWidth, result.croppedHeight) { tag, scannedResult ->
                // handle your business logic here
            }
    }
}
            
imageAnalysis = ImageAnalysis.Builder()
                .build()
                .also { it.setAnalyzer(cameraExecutor, analyzer) }
```
## Other feature
Provides `CameraMaskView` to handle default frame's UI
