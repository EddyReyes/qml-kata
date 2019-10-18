import QtQuick 2.7

Item {
    id: root
    width: 500
    height: 500
    Rectangle {
        anchors.fill: parent
        color: "#111111"
    }
    
    Canvas {
        id: handle
        width: parent.width
        height: parent.height / 2
        Behavior on height {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutQuad
            }
        }
        property real controlPointRatioWidth: 0.5
        property real controlPointRatioHeight: 0.5
        property point beginingPoint: Qt.point(0, 0);
        property point controlPointLeft: Qt.point((handle.width * 0.5) - ((handle.width * 0.5) * controlPointRatioWidth),
            handle.height * controlPointRatioHeight);
        property point controlPointRight: Qt.point((handle.width * 0.5) + ((handle.width * 0.5) * controlPointRatioWidth),
            handle.height * controlPointRatioHeight);
        property point endPoint: Qt.point(0, 0);
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = '#FFFFFF';
            ctx.beginPath();
            // Start at left corner
            ctx.moveTo(0, 0);
            // down towards middle
            ctx.quadraticCurveTo(controlPointLeft.x - (handle.width * Math.pow(controlPointRatioWidth, 4)), controlPointLeft.y - handle.height * Math.pow(controlPointRatioHeight, 3), 
                controlPointLeft.x, controlPointLeft.y);
            // To middle
            ctx.quadraticCurveTo((handle.width * 0.5) - ((handle.width * 0.5) * Math.pow(controlPointRatioWidth, 3)),
                handle.height, handle.width * 0.5, handle.height);
            // Away from Middle
            ctx.quadraticCurveTo((handle.width * 0.5) + ((handle.width * 0.5) * Math.pow(controlPointRatioWidth, 2)),
                handle.height, controlPointRight.x, controlPointRight.y);
            // to top left
            ctx.quadraticCurveTo(handle.width - (handle.width * Math.pow(controlPointRatioWidth, 3)), handle.height * Math.pow(controlPointRatioHeight, 3),
            handle.width, 0);
            ctx.fill();
        }
    }
    Timer {
        id: stretchTestTimer
        interval: 1000
        running: true
        repeat: true
        property bool stretched: false
        onTriggered: {
            stretched = !stretched;
            if (stretched) {
                handle.height = root.height / 2;
            }
            else {
                handle.height = 0;
            }
        }
    }
}
