import QtQuick 2.4

Item {
    property alias text: label.text
    Rectangle {
        anchors.fill: parent
        color: '#66A4C8'
        border.width: 1
        Row {
            width: parent.width * 0.8
            anchors.centerIn: parent
            spacing: 40
            Text {
                id: title
                text: "News"
                font.pixelSize: 20
                color: 'white'
            }
            Text {
                id: label
                font.pixelSize: 20
                color: 'white'
            }
        }
    }
}
