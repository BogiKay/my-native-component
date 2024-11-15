package com.customswitchpackage

import androidx.appcompat.widget.SwitchCompat
import com.facebook.react.uimanager.ThemedReactContext

class CustomSwitchView(context: ThemedReactContext) : SwitchCompat(context) {
    var mListener: OnCheckedChangeListener? = null


    fun setListener(listener: OnCheckedChangeListener) {
        mListener = listener
        super.setOnCheckedChangeListener(mListener)
    }

    companion object {
        val NAME = "CustomSwitchComponent"
    }
}