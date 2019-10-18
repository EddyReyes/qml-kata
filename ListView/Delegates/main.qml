import QtQuick 2.4

Item {
    width: 1000
    height: 500

    Row {
        Item {
            width: 500
            height: 500
            ListModel {
                id: notificationsModel
                ListElement {
                    type: "News"
                    text: "Hurricane Harvey hits Texas"
                }
                ListElement {
                    type: "News"
                    text: "Tina posted something!!! OMG"
                }
                ListElement {
                    type: "Traffic"
                    text: "Highway 101 Sux! AVOID"
                }
            }

            ListView {
                model: notificationsModel
                anchors.fill: parent
                delegate: Loader {
                    width: parent.width
                    height: 200
                    source: "Notifications/" + type + ".qml"
                    Component.onCompleted: {
                        item.text = model.text;
                        // The followin also works
                        // item.text = text;
                    }
                }
            }
        }
        
        Item {
            id: jsonExample
            width: 500
            height: 500
            property var jsonModel: [
                {
                    "type": "News",
                    "text": "Hurricane Harvey hits Texas"
                },
                {
                    "type": "News",
                    "text": "Tina posted something!!! OMG"
                },
                {
                    "type": "Traffic",
                    "text": "Highway 101 Sux! AVOID"
                }
            ]

            ListView {
                model: jsonExample.jsonModel
                anchors.fill: parent
                delegate: Loader {
                    width: parent.width
                    height: 200
                    // When using JSON you need to use modelData
                    // ListElement has an anvantage over JSON in that the data fields
                    // are baked in and interpreted at load time, whereas with JSON
                    // the feilds can be dynamic and unpredictable
                    // The modelData property isn't well documented, but it provides the same data
                    source: "Notifications/" + modelData.type + ".qml"
                    Component.onCompleted: {
                        item.text = modelData.text;
                    }
                }
            }
        }
    }
}
