import QtQuick 2.7
import QtGraphicalEffects 1.0

Item {
    id: root
    property alias text: textItem.text
    property alias color: textItem.color
    property alias size: textItem.font.pixelSize
    width: textContainer.width
    height: textContainer.height
    property bool textOn: true

    // Indent shape
    Rectangle {
        property int offset: 3
        width: parent.width + offset
        height: parent.height + offset
        x: -offset
        y: -offset
        opacity: 0.2
        radius: 2
        color: "black"
    }

    Rectangle {
        anchors.fill: textContainer
        color: "#111111"
    }

    Item {
        id: textContainer
        width: textItem.width + (textItem.width * 0.2)
        height: textItem.height + (textItem.height * 0.5)
        Text {
            anchors.fill: textItem
            text: {
                var str = "";
                for (var i = 0; i < textItem.text.length; i++) {
                    str += "8";
                }
                return str;
            }
            font.family: fontRegular.name
            font.pixelSize: textItem.font.pixelSize
            opacity: 0.1
            color: textItem.color
        }
        FastBlur {
            anchors.fill: textItem
            source: textItem
            radius: 50
            transparentBorder: true
            opacity: root.textOn ? 1 : 0.1
        }
        Text {
            anchors.centerIn: parent
            id: textItem
            font.family: fontRegular.name
            opacity: root.textOn ? 1 : 0.1
        }
    }

    Image {
        fillMode: Image.Tile
        width: parent.width
        height: parent.height
        source: "assets/gfx/dust.png"
        sourceSize: Qt.size(150, 150)
        opacity: 0.5
    }
}
