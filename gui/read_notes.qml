import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: winRead
    width: Screen.desktopAvailableWidth * 0.4
    height: Screen.desktopAvailableHeight * 0.5
    title: "Read Note"
    color: "#ffffff"
    minimumWidth: Screen.desktopAvailableWidth * 0.4
    minimumHeight: Screen.desktopAvailableHeight * 0.5

    property var localProgressModel: []

    Component.onCompleted: {
        localProgressModel = backend.read_current_progress()
    }

    Button {
        id: btnRefresh
        width: winRead.width * 0.1
        height: width
        anchors.right: parent.right
        anchors.rightMargin: winRead.width * 0.01
        anchors.bottom: parent.bottom
        anchors.bottomMargin: winRead.width * 0.01
        flat: true
        Image {
            source: "qrc:/images/refresh.svg"
            sourceSize.width: btnRefresh.width * 0.7
            sourceSize.height: btnRefresh.height * 0.7
            anchors.centerIn: parent
        }
        onClicked: {
            winRead.localProgressModel = backend.read_current_progress()
        }
    }

    

    Rectangle {
        id: list_rect
        width: winRead.width * 0.5
        height: winRead.height
        ListView {
            id: scrollview
            model: winRead.localProgressModel
            clip: true
            anchors.fill: parent
            anchors.topMargin: parent.width * 0.06
            spacing: width * 0.02
            delegate: Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: list_rect.width * 0.75
                height: list_rect.height * 0.4
                color: "#bbb3b3"
                radius: width * 0.03
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: modelData
                    color: "#000000"
                    font.bold: true
                    font.pixelSize: list_rect.width * 0.04
                }
            }
        }
        Rectangle {
            width: 1
            height: winRead.height
            color: "#222222"
            x: list_rect.width
        }
    }

    Text {
        text: "History"
        width: winRead.width * 0.2
        horizontalAlignment: Text.AlignHCenter
        x: winRead.width * 0.65
        y: winRead.height * 0.15
        font.bold: true
        font.pixelSize: winRead.height * 0.09
        color: "#000000"
    }

    Text {
        text: "Read your past notes"
        width: winRead.width * 0.2
        horizontalAlignment: Text.AlignHCenter
        x: winRead.width * 0.65
        y: winRead.height * 0.4
        font.italic: true
        font.pixelSize: winRead.height * 0.05
        color: "#000000"
    }

}