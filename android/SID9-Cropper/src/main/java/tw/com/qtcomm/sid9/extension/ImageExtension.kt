package tw.com.qtcomm.sid9.extension

import android.graphics.*
import tw.com.qtcomm.sid9.model.CroppedResult
import tw.com.qtcomm.sid9.model.LuminanceSourceResult
import java.io.ByteArrayOutputStream

fun CroppedResult.toRect(): Rect {
    return Rect(left, top, right, bottom)
}

fun LuminanceSourceResult.toBitmap(jpegQuality: Int = 100): Bitmap {
    return ByteArrayOutputStream().let {
        YuvImage(croppedData, ImageFormat.NV21, croppedWidth, croppedHeight, null).apply {
            compressToJpeg(Rect(0, 0, width, height), jpegQuality, it)
        }
        it.toByteArray().let { BitmapFactory.decodeByteArray(it, 0, it.size) }
    }
}