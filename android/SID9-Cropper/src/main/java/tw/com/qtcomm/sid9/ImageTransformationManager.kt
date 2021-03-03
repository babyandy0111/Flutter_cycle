package tw.com.qtcomm.sid9

import tw.com.qtcomm.sid9.repository.ImageTransformationRepository
import tw.com.qtcomm.sid9.extension.toRect
import tw.com.qtcomm.sid9.lib.PlanarYUVLuminanceSource
import tw.com.qtcomm.sid9.model.CroppedResult
import tw.com.qtcomm.sid9.model.LuminanceSourceResult
import kotlin.math.roundToInt

object ImageTransformationManager : ImageTransformationRepository {

    /**
     * cropped as a 10:6 rectangle
     */
    override fun getCroppedResult(width: Int, height: Int): CroppedResult {
        val longSide = if (width >= height) width else height
        val shortSide = if (width < height) width else height
        val isVertical = width <= height

        val top: Int
        val bottom: Int
        val left: Int
        val right: Int

        if (isVertical) {
            top = longSide / 2 - (shortSide * 0.3).roundToInt()
            bottom = longSide / 2 + (shortSide * 0.3).roundToInt()
            left = 0
            right = shortSide
        } else {
            top = 0
            bottom = shortSide
            left = longSide / 2 - (shortSide * 0.3).roundToInt()
            right = longSide / 2 + (shortSide * 0.3).roundToInt()
        }
        return CroppedResult(left, top, right, bottom)
    }

    override fun getRotatedByteArray(originalData: ByteArray, height: Int, width: Int): ByteArray {
        return ByteArray(originalData.size).apply {
            for (y in 0 until height) {
                for (x in 0 until width) {
                    this[x * height + height - y - 1] = originalData[x + y * width]
                }
            }
        }
    }

    override fun getLuminanceSourceResult(
        data: ByteArray,
        width: Int,
        height: Int,
        croppedResult: CroppedResult
    ): LuminanceSourceResult {
        return croppedResult.toRect()
            .let {
                PlanarYUVLuminanceSource(
                    data,
                    width,
                    height,
                    it.left,
                    it.top,
                    it.width(),
                    it.height()
                )
            }
            .let { LuminanceSourceResult(it.renderCroppedBytes(), it.width, it.height) }
    }
}