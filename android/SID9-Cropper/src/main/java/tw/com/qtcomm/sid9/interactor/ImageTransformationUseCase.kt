package tw.com.qtcomm.sid9.interactor

import tw.com.qtcomm.sid9.model.CroppedResult
import tw.com.qtcomm.sid9.model.LuminanceSourceResult
import tw.com.qtcomm.sid9.repository.ImageTransformationRepository

class ImageTransformationUseCase(private val imageTransformationRepository: ImageTransformationRepository) {
    fun getCroppedSquare(width: Int, height: Int): CroppedResult =
        imageTransformationRepository.getCroppedResult(width, height)

    fun getRotatedByteArray(originalData: ByteArray, height: Int, width: Int): ByteArray {
        return imageTransformationRepository.getRotatedByteArray(originalData, height, width)
    }

    fun getLuminanceSourceResult(
        data: ByteArray,
        width: Int,
        height: Int,
        croppedResult: CroppedResult
    ): LuminanceSourceResult {
        return imageTransformationRepository.getLuminanceSourceResult(data, width, height, croppedResult)
    }
}