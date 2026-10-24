import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: home
    visible: true
    width: Screen.desktopAvailableWidth * 0.27
    height: Screen.desktopAvailableHeight * 0.3
    title: "YKS Time Capsule"
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    color: "#e2dada"

    Text {
        width: home.width
        horizontalAlignment: Text.AlignHCenter
        y: home.height * 0.06
        font.bold: true
        font.pixelSize: home.height * 0.1
        color: "#000000"
        text: "YKS Time Capsule"
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        height: home.height * 0.4
        y: home.height * 0.35
        spacing: home.width * 0.04

        Button {
            id: btnHistory
            Layout.preferredWidth: home.height * 0.3
            Layout.preferredHeight: home.height * 0.3
            flat: true
            property var wnd: undefined
            Image {
                source: "qrc:/images/history.svg"
                sourceSize.width: btnHistory.width * 0.7
                sourceSize.height: btnHistory.height * 0.7
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }
            onClicked: {
                if (wnd == undefined) {
                    var component = Qt.createComponent("qrc:/gui/read_notes.qml")
                    wnd = component.createObject(home);
                    wnd.closing.connect(function() {
                        btnHistory.wnd.destroy();
                        btnHistory.wnd = undefined;
                    });
                    wnd.show();
                }
                else {
                    wnd.requestActivate();
                }
            }
        }

        Button {
            id: btnNote
            Layout.preferredWidth: home.height * 0.3
            Layout.preferredHeight: home.height * 0.3
            flat: true
            property var wnd: undefined
            Image {
                source: "qrc:/images/note.svg"
                sourceSize.width: btnNote.width * 0.7
                sourceSize.height: btnNote.height * 0.7
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }
            onClicked: {
                if (wnd == undefined) {
                    var component = Qt.createComponent("qrc:/gui/create_note.qml")
                    wnd = component.createObject(home);
                    wnd.closing.connect(function() {
                        btnNote.wnd.destroy();
                        btnNote.wnd = undefined;
                    });
                    wnd.show();
                }
                else {
                    wnd.requestActivate();
                }
            }
        }
    }

    Text {
        width: home.width
        horizontalAlignment: Text.AlignHCenter
        y: home.height * 0.9
        font.italic: true
        font.pixelSize: home.height * 0.04
        color: "#000000"
        text: "Made by Ahmet Yalçınkaya. GPL-3 License applies."
    }
}