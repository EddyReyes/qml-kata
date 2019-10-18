import QtQuick 2.4
import QtGraphicalEffects 1.0

Item {
    id: root
    width: 500
    height: 500

    Item {
        id: targetRect
        width: 300
        height: 300
        //y: -200
        anchors.horizontalCenter: parent.horizontalCenter
        property real rotationValue: 0
        transform: Rotation {origin.x: targetRect.width/2; origin.y: targetRect.height; angle: targetRect.rotationValue; axis { x: 1; y: 0; z: 0 }}

        SequentialAnimation {
            loops: Animation.Infinite
            running: true
            NumberAnimation {
                target: targetRect
                properties: "rotationValue"
                to: 75
                duration: 10000
            }
            NumberAnimation {
                target: targetRect
                properties: "rotationValue"
                to: 0
                duration: 10000
            }
        }

        Rectangle {
            anchors.fill: parent
            color: 'black'
        }

        LinearGradient {
            id: gradient1
            width: parent.width
            height: parent.height
            start: Qt.point(0 , 0)
            end: Qt.point( 0 , height)
            property real greenOffsetValue: 0
            SequentialAnimation {
                loops: Animation.Infinite
                running: true
                NumberAnimation {
                    target: gradient1
                    properties: "greenOffsetValue"
                    to: 0.2
                    duration: 1000
                }
                NumberAnimation {
                    target: gradient1
                    properties: "greenOffsetValue"
                    to: 0.05
                    duration: 1000
                }
            }
            gradient: Gradient {
                // Safe zone
                GradientStop { id: gs1; position: 0.0; color: "#00cc00" }
                GradientStop { id: gs2; position: gradient1.greenOffsetValue; color: "#00000000" }
                // Brake zone
                GradientStop { id: gs3; position: gradient1.greenOffsetValue + 0.1; color: "#dda92d" }
                GradientStop { id: gs4; position: 0.6; color: "#00000000" }
                // Danger zone
                GradientStop { id: gs5; position: 0.61; color: Qt.rgba( 255,0,0, 0.6) }
                GradientStop { id: gs6; position: 1.0; color: "#00000000" }
            }
        }
    }
} 
