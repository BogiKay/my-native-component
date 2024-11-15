package com.customswitchpackage

import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.WritableMap
import com.facebook.react.uimanager.events.Event

class CustomSwitchValueChangeEvent(surfaceId: Int, viewId: Int, val value: Boolean) : Event<CustomSwitchValueChangeEvent>(surfaceId, viewId) {
    override fun getEventName(): String {
        return EVENT_NAME
    }

    override fun getEventData(): WritableMap? {
        return Arguments.createMap().apply {
            putBoolean(PROP_NAME, value)
        }
    }

    companion object {
        // This name must be like JS name but we replace "on" prefix with "top"
        // So if I defined on JS spec handle called "onValueChange", we need to define event's name as
        // "topValueChange"
        val EVENT_NAME = "topValueChange"
        val PROP_NAME = "value"
    }
}