package tw.com.qtcomm.sid9.repository

import tw.com.qtcomm.sid9.model.CroppedResult
import tw.com.qtcomm.sid9.model.LuminanceSourceResult


interface ImageTransformationRepository {
    fun getCroppedResult(width: Int, height: Int): CroppedResult
    fun getRotatedByteArray(originalData: ByteArray, height: Int, width: Int): ByteArray
    fun getLuminanceSourceResult(
        data: ByteArray,
        width: Int,
        height: Int,
        croppedResult: CroppedResult
    ): LuminanceSourceResult
}