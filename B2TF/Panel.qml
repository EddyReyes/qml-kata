import QtQuick 2.7

Item {
    id: root
    property color color: "#16CA38"
    property alias label: labelSticker.text
    property date date: Date()
    property bool textOn: true
    width: container.width
    height: container.height
    Column {
        id: container
        spacing: 15
        Row {
            spacing: 20
            Column {
                spacing: 15
                StickerLabel {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Month"
                    size: 30
                }
                LCDText {
                    color: root.color
                    text: Qt.formatDate(date, "MMM")
                    size: 110
                    textOn: root.textOn
                }
            }
            Column {
                spacing: 15
                StickerLabel {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Day"
                    size: 30
                }
                LCDText {
                    color: root.color
                    text: Qt.formatDate(date, "dd")
                    size: 110
                    textOn: root.textOn
                }
            }
            Column {
                spacing: 15
                StickerLabel {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Year"
                    size: 30
                }
                LCDText {
                    color: root.color
                    text: Qt.formatDate(date, "yyyy")
                    size: 110
                    textOn: root.textOn
                }
            }
            Column {
                spacing: 30
                anchors.verticalCenter: parent.verticalCenter
                StickerLabel {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "PM"
                    size: 30
                }
                Column {
                    spacing: 60
                    anchors.horizontalCenter: parent.horizontalCenter
                    LEDLight {
                        color: root.color
                        size: 30
                        on: Qt.formatDateTime(date, "ap") == 'pm'
                    }
                    LEDLight {
                        color: root.color
                        size: 30
                        on: Qt.formatDateTime(date, "ap") == 'am'
                    }
                }
            }
            Column {
                spacing: 15
                StickerLabel {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "hour"
                    size: 30
                }
                LCDText {
                    color: root.color
                    text: Qt.formatDateTime(date, "hhap").slice(0, 2);
                    size: 110
                    textOn: root.textOn
                }
            }
            Column {
                spacing: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 40
                property bool blink: false
                LEDLight {
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: root.color
                    size: 30
                    on: parent.blink
                }
                LEDLight {
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: root.color
                    size: 30
                    on: parent.blink
                }
                Timer {
                    interval: 500
                    running: true
                    repeat: true
                    onTriggered: parent.blink = !parent.blink;
                }
            }
            Column {
                spacing: 15
                StickerLabel {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Min"
                    size: 30
                }
                LCDText {
                    color: root.color
                    text: Qt.formatDateTime(date, "mm")
                    size: 110
                    textOn: root.textOn
                }
            }
        }
        StickerLabel {
            id: labelSticker
            anchors.horizontalCenter: parent.horizontalCenter
            stickerColor: "#15151b"
            size: 40
        }
    }
}
