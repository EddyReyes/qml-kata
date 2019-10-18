import QtQuick 2.2
import QtGraphicalEffects 1.0 

Rectangle {
    width: 800
    height: 800
    color: '#6FE9F7'

    Image {
        width: 300
        height: 300
        id: circleImg
        source: "images/circle_arc.png"
        //source: "images/circle_full.png"
        anchors.centerIn: parent
        visible: false
    }
    ConicalGradient {
        id: circleMask
        anchors.fill: parent
        angle: 200.0
        visible: false
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FF000000" }
            GradientStop { position: 1.0; color: "#00000000" }
        }
    }
    ThresholdMask {
        anchors.fill: circleImg
        source: circleImg
        maskSource: circleMask
        spread: 0.0
        threshold: 1.0
        SequentialAnimation on threshold {
            loops: Animation.Infinite
            NumberAnimation {
                to: 0.0
                duration: 10000
                easing.type: Easing.InQuad
            }
            NumberAnimation {
                to: 1.0
                duration: 10000
                easing.type: Easing.InQuad
            }
            NumberAnimation {
                to: 0.0
                duration: 10000
                easing.type: Easing.OutQuad
            }
        }
    }
}
