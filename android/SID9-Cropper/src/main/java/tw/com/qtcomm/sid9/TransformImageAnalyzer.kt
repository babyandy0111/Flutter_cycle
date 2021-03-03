package tw.com.qtcomm.sid9

import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import tw.com.qtcomm.sid9.model.LuminanceSourceResult
import java.nio.ByteBuffer

class TransformImageAnalyzer : ImageAnalysis.Analyzer {
    var onTransformListener: OnTransformListener? = null
    private fun ByteBuffer.toByteArray(): ByteArray {
        rewind()    // Rewind the buffer to zero
        val data = ByteArray(remaining())
        get(data)   // Copy the buffer into a byte array
        return data // Return the byte array
    }

    override fun analyze(image: ImageProxy) {
        val buffer = image.planes[0].buffer
        val data = buffer.toByteArray()
        image.close()

        // 1. rotate the image
        val rotatedData =
            ImageTransformationManager.getRotatedByteArray(data, image.height, image.width)

        // swap width and height because image has rotated
        val newWidth = image.height
        val newHeight = image.width

        // 2. get view's cropped area
        val croppedResult = ImageTransformationManager.getCroppedResult(newWidth, newHeight)

        // 3. crop the image
        ImageTransformationManager.getLuminanceSourceResult(
            rotatedData,
            newWidth,
            newHeight,
            croppedResult
        ).let { onTransformListener?.onTransformed(it) }
    }
}

interface OnTransformListener {
    fun onTransformed(result: LuminanceSourceResult)
}