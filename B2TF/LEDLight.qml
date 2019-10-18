import QtQuick 2.7
import QtGraphicalEffects 1.0

Item {
    id: root
    property alias size: light.width
    property alias color: light.color
    property bool on: true
    width: lightContainer.width
    height: lightContainer.height

    Item {
        id: lightContainer
        width: light.width * 1.5
        height: light.height * 1.5
        Rectangle {
            width: light.width * 1.05
            radius: width/2
            height: width
            anchors.centerIn: light
            color: Qt.darker(light.color, 2.5)
        }
        Rectangle {
            anchors.centerIn: parent
            id: light
            radius: width/2
            height: width
            opacity: root.on ? 1 : 0.1
            Behavior on opacity {
                NumberAnimation {
                    duration: 100
                }
            }
            RadialGradient {
                id: radialGradient
                anchors.fill: light
                visible: false
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Qt.lighter(root.color, 1.7) }
                    GradientStop { position: 0.4; color: root.color }
                    GradientStop { position: 1.0; color: "transparent"}
                }
            }
            OpacityMask {
                anchors.fill: light
                source: radialGradient
                maskSource: light
            }
        }
    }

    FastBlur {
        anchors.centerIn: lightContainer
        width: lightContainer.width
        height: lightContainer.height
        source: lightContainer
        radius: 60
        opacity: light.opacity
        transparentBorder: true
    }
}
