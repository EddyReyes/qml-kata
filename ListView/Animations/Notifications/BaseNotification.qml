import QtQuick 2.4

Item {
    id: notification
    property color labelColor: "black"
    property color contentColor: "white"
    property alias titleText: title.text
    property alias contentText: content.text

    Row {
        width: parent.width
        anchors.fill: parent
        Rectangle {
            height: parent.height
            width: parent.width * 0.2
            color: labelColor
            Text {
                id: title
                anchors.centerIn: parent
                text: "Title"
                font.pixelSize: 20
                color: 'white'
            }
        }
        Rectangle {
            height: parent.height
            width: parent.width * 0.8
            color: contentColor
            Text {
                id: content
                anchors.centerIn: parent
                font.pixelSize: 20
                color: 'white'
            }
        }
    }
}
