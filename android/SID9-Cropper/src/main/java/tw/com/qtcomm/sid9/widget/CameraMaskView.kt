package tw.com.qtcomm.sid9.widget

import android.content.Context
import android.graphics.*
import android.util.AttributeSet
import android.view.View
import androidx.core.content.ContextCompat
import androidx.core.graphics.drawable.toBitmap
import org.jetbrains.anko.dip
import tw.com.qtcomm.sid9.R

class CameraMaskView @kotlin.jvm.JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : View(context, attrs, defStyleAttr) {


    var leftBottomCorner: Bitmap? = null
    var leftTopCorner: Bitmap? = null
    var rightTopCorner: Bitmap? = null
    var rightBottomCorner: Bitmap? = null
    private lateinit var bitmap: Bitmap
    private val paint = Paint()
    private val maskPaint = Paint()
    lateinit var rectF: RectF

    private var previewWidth: Int = 0
    private var previewHeight: Int = 0
    private var previewTop = 0f

    init {
        paint.xfermode = PorterDuffXfermode(PorterDuff.Mode.XOR)
        paint.color = 0x00FFFFFF

        maskPaint.color = Color.argb(100, 0, 0, 0)
        maskPaint.style = Paint.Style.FILL
    }

    private val xorMode = PorterDuffXfermode(PorterDuff.Mode.DST_OUT)

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)

        if (previewTop == 0f) {
            return
        }

        val previewLeft = dip(14).toFloat()

        if (previewHeight == 0 || previewWidth == 0) {
            previewHeight = dip(176)
            previewWidth = width - dip(28)

            rectF = RectF(
                previewLeft,
                previewTop,
                previewLeft + previewWidth,
                previewTop + previewHeight
            )

            bitmap = Bitmap.createBitmap(height, width, Bitmap.Config.ARGB_8888)
            bitmap.eraseColor(Color.argb(100, 0, 0, 0))

            // rotate corner image into bitmap
            val matrix = Matrix()
            matrix.postRotate(90f)

            leftBottomCorner = ContextCompat.getDrawable(context, R.drawable.ic_aim)?.toBitmap()
            leftTopCorner = leftBottomCorner?.run {
                Bitmap.createBitmap(
                    this,
                    0,
                    0,
                    width,
                    height,
                    matrix,
                    true
                )
            }
            rightTopCorner =
                leftTopCorner?.run { Bitmap.createBitmap(this, 0, 0, width, height, matrix, true) }
            rightBottomCorner =
                rightTopCorner?.run { Bitmap.createBitmap(this, 0, 0, width, height, matrix, true) }
        }

        val saved = canvas.saveLayer(null, null)

        // draw rect with rounded corner on canvas
        canvas.drawRect(0f, 0f, width.toFloat(), height.toFloat(), maskPaint)
        maskPaint.xfermode = xorMode
        canvas.drawRect(rectF, maskPaint)

        maskPaint.xfermode = null

        canvas.restoreToCount(saved)

        // reset after draw rect
        paint.reset()


        // draw corner
        canvas.drawBitmap(leftTopCorner!!, previewLeft - dip(2.5f), previewTop, paint)
        leftBottomCorner?.run {
            canvas.drawBitmap(
                this,
                previewLeft - dip(2.5f),
                previewTop + previewHeight - height,
                paint
            )
        }
        rightTopCorner?.run {
            canvas.drawBitmap(
                this,
                previewLeft + previewWidth - width + dip(2.5f),
                previewTop,
                paint
            )
            leftBottomCorner?.let {
                canvas.drawBitmap(
                    rightBottomCorner!!,
                    previewLeft + previewWidth - width + dip(2.5f),
                    previewTop + previewHeight - it.height,
                    paint
                )
            }
        }
    }

    fun setFrameTop(top: Int) {
        previewTop = top.toFloat()
        invalidate()
    }

}