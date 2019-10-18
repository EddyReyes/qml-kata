import QtQuick 2.7

Item {
    id: root
    width: 1920
    height: 1080

    Image {
        anchors.fill: container
        source: "assets/gfx/background.png"
    }
    
    FontLoader {
        id: fontRegular
        source: "assets/fonts/DSEG/DSEG14Classic-Regular.ttf"
    }

    Column {
        id: container
        width: 1920
        height: 1080
        Item {
            width: parent.width
            height: container.height / 3
            Panel {
                id: desinationTimePanel
                anchors.centerIn: parent
                color: '#E01919'
                date: new Date("October 21 2015 16:20")
                label: "Destination Time"
            }
            Timer {
                interval: 3000
                running: true
                repeat: true
                onTriggered: {
                    brokenDisplayAnimation.restart();
                    interval = Math.random() * 4000;
                }
            }
            SequentialAnimation {
                id: brokenDisplayAnimation
                PropertyAction {
                    target: desinationTimePanel
                    property: "textOn"
                    value: false
                }
                PauseAnimation {
                    duration: 50
                }
                PropertyAction {
                    target: desinationTimePanel
                    property: "textOn"
                    value: true
                }
                PauseAnimation {
                    duration: 25
                }
                PropertyAction {
                    target: desinationTimePanel
                    property: "textOn"
                    value: false
                }
                PauseAnimation {
                    duration: 50
                }
                PropertyAction {
                    target: desinationTimePanel
                    property: "textOn"
                    value: true
                }
                PauseAnimation {
                    duration: 50
                }
                PropertyAction {
                    target: desinationTimePanel
                    property: "textOn"
                    value: false
                }
                PauseAnimation {
                    duration: 100
                }
                PropertyAction {
                    target: desinationTimePanel
                    property: "textOn"
                    value: true
                }
            }
        }
        Item {
            width: parent.width
            height: container.height / 3
            Panel {
                id: presentTime
                anchors.centerIn: parent
                date: new Date()
                label: "Present Time"
                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: {
                        presentTime.date = new Date();
                    }
                }
            }
        }
        Item {
            width: parent.width
            height: container.height / 3
            Panel {
                anchors.centerIn: parent
                color: '#EDB122'
                date: new Date("October 26 1985 01:21")
                label: "Last Time Departed"
            }
        }
    }
}
