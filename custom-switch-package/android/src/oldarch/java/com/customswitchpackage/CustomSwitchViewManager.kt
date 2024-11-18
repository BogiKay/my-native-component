package com.customswitchpackage

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.common.MapBuilder
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.UIManagerHelper
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp

@ReactModule(name = "CustomSwitchComponent")
class CustomSwitchViewManager : SimpleViewManager<CustomSwitchView>() {

    override fun createViewInstance(reactContext: ThemedReactContext): CustomSwitchView {
        return CustomSwitchView(reactContext)
    }

    override fun getName(): String {
        return NAME
    }

    @ReactProp(name = "value")
    fun setValue(view: CustomSwitchView?, value: Boolean) {
        view?.setChecked(value)
    }

    override fun addEventEmitters(reactContext: ThemedReactContext, view: CustomSwitchView) {
        fun listener(value: Boolean) {
            UIManagerHelper.getEventDispatcherForReactTag(reactContext, view.id)
                ?.dispatchEvent(
                    CustomSwitchValueChangeEvent(UIManagerHelper.getSurfaceId(view), view.id, value)
                )
        }

        view?.setListener { buttonView, isChecked ->
            listener(isChecked)
        }
    }

    override fun getExportedCustomBubblingEventTypeConstants(): Map<String, Any> {
        return mapOf(
            CustomSwitchValueChangeEvent.EVENT_NAME to mapOf(
                "phasedRegistrationNames" to mapOf(
                    "bubbled" to "onValueChange"
                )
            )
        )
    }

    companion object {
        val NAME = CustomSwitchView.NAME
    }
}