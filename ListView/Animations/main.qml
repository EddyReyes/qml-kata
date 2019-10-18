import QtQuick 2.4

Item {
    id: root
    width: 500
    height: 800

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#007847"
    }

    ListModel {
        id: notificationsModel
        ListElement {
            type: "News"
            text: "Hurricane hits Texas"
        }
        ListElement {
            type: "News"
            text: "Tina posted something!!! OMG"
        }
        ListElement {
            type: "Traffic"
            text: "Highway 101 traffic! AVOID"
        }
    }

    ListView {
        model: notificationsModel
        anchors.fill: parent
        delegate: Loader {
            width: parent.width
            height: 100
            source: "Notifications/" + type + ".qml"
            Component.onCompleted: {
                item.contentText = text;
            }

            // The onAdd callback can also be used to trigger
            // item creation animations
            ListView.onAdd: print("New Item:", type, text);
        }

        // Animate all displaced items
        // displaced: Transition {
        //      SequentialAnimation {
        //          PauseAnimation {
        //              duration: 200
        //          }
        //          NumberAnimation {
        //              properties: "x,y"; duration: 200
        //          }
        //      }
        // }
        //
        // But use a different animation when adding
        // Than the animation when removing
        removeDisplaced: Transition {
            SequentialAnimation {
                // we want to pause before animation over existing
                // notifications, giving them time to exit
                PauseAnimation {
                    duration: 200
                }
                NumberAnimation {
                    properties: "x,y"; duration: 200
                }
            }
        }
        addDisplaced: Transition {
            // But we don't want to pause when we add new items
            NumberAnimation {
                properties: "x,y"; duration: 200
            }
        }

        // Animate individual items being added
        // However... there's a known bug where this transition wont finish
        // if it's interupted half way through, say.. when a new item is
        // added, mid transiton. Give it a shot :/
        // Workarounds are available. See ListView.onAdd above
        add: Transition {
            ParallelAnimation {
                NumberAnimation { properties: "x"; from: -root.width; duration: 200 }
                NumberAnimation { property: "opacity"; to: 1; from: 0; duration: 200 }
            }
        }

        // Animate individual item being removed
        remove: Transition {
            ParallelAnimation {
                NumberAnimation { property: "opacity"; to: 0; duration: 200 }
                NumberAnimation { properties: "x"; to: -root.width; duration: 200 }
            }
        }

        // Animate items as list gets populated
        populate: Transition {
            NumberAnimation { properties: "x,y"; duration: 200 }
        }

    }

    focus: true
    Keys.onPressed: {
        switch(event.key) {
            case Qt.Key_Backspace: {
                if (event.modifiers & Qt.ShiftModifier) {
                    removeLastItem();
                }
                // Conrol = Command in macOS
                else if (event.modifiers & Qt.ControlModifier) {
                    removeMiddleItem();
                }
                else {
                    removeFirstItem();
                }
                break;
            }
            case Qt.Key_Return: {
                if (event.modifiers & Qt.ShiftModifier) {
                    addItemToEnd();
                }
                else if (event.modifiers & Qt.ControlModifier) {
                    addItemToMiddle();
                }
                else {
                    addItemToBegining();
                }
                break;
            }
        }
    }

    function removeFirstItem() {
        if(notificationsModel.count > 0) {
            notificationsModel.remove(0, 1);
        }
    }

    function removeMiddleItem() {
        if(notificationsModel.count > 0) {
            notificationsModel.remove(notificationsModel.count/2, 1);
        }
    }

    function removeLastItem() {
        if(notificationsModel.count > 0) {
            notificationsModel.remove(notificationsModel.count - 1, 1);
        }
    }

    function addItemToBegining() {
        notificationsModel.insert(0, {
            "type" : "Phone",
            "text" : "Missed call from Carey"
        });
    }

    function addItemToMiddle() {
        notificationsModel.insert(notificationsModel.count/2, {
            "type" : "News",
            "text" : "Housing prices still insane! wtf!"
        });
    }

    function addItemToEnd() {
        notificationsModel.append({
            "type" : "Traffic",
            "text" : "All the highways are broken :("
        });
    }
}
