import QtQuick 2.7
import QtGraphicalEffects 1.0

Item {
    id: root
    property string text
    property alias color: textItem.color
    property alias stickerColor: stickerBackground.color
    property alias size: textItem.font.pixelSize
    width: textContainer.width
    height: textContainer.height
    // stickers aren't perfect.. :P
    rotation: Math.random() - 0.5

    Rectangle {
        id: stickerBackground
        anchors.fill: textContainer
        color: "#A32020"
    }
    Item {
        id: textContainer
        width: textItem.width * 1.5
        height: textItem.height * 1.5
        visible: false
        Text {
            anchors.centerIn: parent
            id: textItem
            text: root.text.toUpperCase()
            color: "#D6D6D6"
        }
    }
    Image {
        id: mask
        source: "assets/gfx/scratched.png"
        anchors.fill: parent
        fillMode: Image.Tile
        visible: false
    }
    OpacityMask {
        anchors.fill: textContainer
        source: textContainer
        maskSource: mask
    }
}
