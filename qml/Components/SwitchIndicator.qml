/** 
 * Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com 
 */

import QtQuick 2.12
import QtQuick.Controls 2.12

import QtGraphicalEffects 1.12

import QQuickMaterialHelper.Style 1.12
import QQuickMaterialHelper.Core 1.12

Item 
{
    id: indicator
    implicitWidth: MaterialStyle.switchIndicator.implicitWidth
    implicitHeight: MaterialStyle.switchIndicator.implicitHeight

    property Item control
    property alias handle: handle

    property int elevation: control.enabled ? 1 : 0

    Rectangle 
    {
        width: parent.width
        height: MaterialStyle.switchIndicator.trackHeight
        radius: height / 2
        y: parent.height / 2 - height / 2
        color: control.enabled ? (control.checked ? MaterialStyle.switchIndicator.switchCheckedTrackColor : MaterialStyle.switchIndicator.switchUncheckedTrackColor)
                               : MaterialStyle.switchIndicator.switchDisabledTrackColor
    } // Rectangle

    Rectangle 
    {
        id: handle
        x: Math.max(0, Math.min(parent.width - width, control.visualPosition * parent.width - (width / 2)))
        y: (parent.height - height) / 2
        width: MaterialStyle.switchIndicator.handleRadius
        height: MaterialStyle.switchIndicator.handleRadius
        radius: width / 2
        color: control.enabled ? (control.checked ? MaterialStyle.switchIndicator.switchCheckedHandleColor : MaterialStyle.switchIndicator.switchUncheckedHandleColor)
                               : MaterialStyle.switchIndicator.switchDisabledHandleColor

        Behavior on x 
        {
            enabled: !control.pressed
            SmoothedAnimation { duration: 300 }
        } // Behavior
        layer.enabled: indicator.elevation > 0
        layer.effect: ElevationEffect 
        {
            elevation: indicator.elevation
        } // ElevationEffect
    } // Rectangle
} // Item
