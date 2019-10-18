import QtQuick 2.4
import QtQuick.Layouts 1.3

Rectangle {
    id: root
    width: 800
    height: 800
    color: "#BED6D8"

    FontLoader {
        id: questrialFont
        source: "assets/Questrial/Questrial-Regular.ttf"
    }

    GridLayout {
        id: grid
        anchors.fill: parent
        anchors.margins: 20
        columns: 4
        rows: 3
        columnSpacing: 10
        rowSpacing: 10
        Rectangle {
            id: header
            color: "#7CB685"
            radius: 5
            Layout.columnSpan: 3
            Layout.column: 1
            Layout.preferredHeight: 100
            Layout.preferredWidth: grid.width
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                font.family: questrialFont.name
                font.pointSize: 25
                text: "header"
                anchors.margins: 5
                color: "#E8F5F1"
            }
        }
        Rectangle {
            id: sidebar
            color: "#7776B1"
            radius: 5
            Layout.rowSpan: 3
            Layout.column: 0
            Layout.preferredWidth: 300
            Layout.preferredHeight: grid.height
            Layout.minimumWidth: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                font.family: questrialFont.name
                font.pointSize: 20
                text: "sidebar"
                anchors.margins: 5
                color: "#E8F5F1"
            }
        }
        Rectangle {
            id: main
            color: "#66A4C8"
            radius: 5
            Layout.column: 1
            Layout.row: 1
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: grid.width / 2
            Layout.preferredHeight: grid.height
            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                font.family: questrialFont.name
                font.pointSize: 20
                text: "main"
                anchors.margins: 5
                color: "#E8F5F1"
            }
        }
        Rectangle {
            id: stuff
            color: "#B0AFD1"
            radius: 5
            Layout.row: 1
            Layout.column: 3
            Layout.preferredWidth: grid.width / grid.columns
            Layout.preferredHeight: grid.height
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                font.family: questrialFont.name
                font.pointSize: 20
                text: "stuff"
                anchors.margins: 5
                color: "#E8F5F1"
            }
        }
        Rectangle {
            id: footer
            color: "#D54530"
            radius: 5
            Layout.row: 2
            Layout.column: 1
            Layout.columnSpan: 3
            Layout.preferredHeight: 100
            Layout.preferredWidth: grid.width
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                font.family: questrialFont.name
                font.pointSize: 25
                text: "footer"
                anchors.margins: 5
                color: "#E8F5F1"
            }
        }
    }
}
