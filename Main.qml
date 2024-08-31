import QtQuick
import QtQuick.Controls

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "#edede9"

    Rectangle {
        anchors.top: parent.top
        id: topbar
        width: parent.width
        height: 60
        color: "#d6ccc2"

        Rectangle {
            anchors.left: topbar.left
            anchors.leftMargin: 10
            anchors.top: topbar.top
            anchors.topMargin: -10


            Text {
                text: "JOT"
                font.family: "Helvetica"
                font.pixelSize: 70

                color: "#edede9"
            }
        }



        Image {
            id: burgerMenu
            source: "assets/images/menuSVG.svg"
            width: 60
            height: 60
            anchors.right: parent.right
            rotation: 0

            state: "default"

            MouseArea {
                anchors.fill: parent
                onClicked: {

                    burgerMenu.state = burgerMenu.state === "rotated" ? "default" : "rotated"
                }
            }

            states: [
                State {
                    name: "rotated"
                    PropertyChanges { target: burgerMenu; rotation: 90 }
                    PropertyChanges { target: dropDown; height: 300 }
            },
                State {
                    name: "default"
                    PropertyChanges { target: burgerMenu; rotation: 0 }
                    PropertyChanges { target: dropDown; height: 0 }
            }
            ]

            transitions: [
                Transition {
                    from: "default"; to: "rotated"
                    RotationAnimation { duration: 500; direction: RotationAnimation.Clockwise }
                    PropertyAnimation { duration: 500; property: "height"; easing.type: Easing.InOutQuad }
            },
                Transition {
                    from: "rotated"; to: "default"
                    RotationAnimation { duration: 500; direction: RotationAnimation.CounterClockwise }
                    PropertyAnimation { duration: 500; property: "height"; easing.type: Easing.InOutQuad }
            }
            ]


        }

        Rectangle {
            id: dropDown
            width: parent.width/6+200
            height: 0
            anchors.top: topbar.bottom
            anchors.right: parent.right
            color: "#d6ccc2"
            bottomLeftRadius: 5


            Rectangle {
                id: home
                width: parent.width
                height: parent.height/5
                color: "#f5ebe0"
                border.color: "#e3d5ca"
                border.width: 4
                radius: 5
            }

            Rectangle {
                id: statistics
                width: parent.width
                height: parent.height/5
                color: "#f5ebe0"
                anchors.top: home.bottom
                border.color: "#e3d5ca"
                border.width: 4
                radius: 5
            }

        }
    }

}
