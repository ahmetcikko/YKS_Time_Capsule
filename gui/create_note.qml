import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: winNote
    width: Screen.desktopAvailableWidth * 0.4
    height: Screen.desktopAvailableHeight * 0.5
    title: "Create Note"
    color: "#FFFFFF"
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    Text {
        width: winNote.width
        horizontalAlignment: Text.AlignHCenter
        y: winNote.height * 0.12
        font.bold: true
        font.pixelSize: winNote.height * 0.09
        color: "#000000"
        text: "Create Note"
    }
    TextField {
        id: textbox
        width: winNote.width * 0.65
        height: winNote.height * 0.5
        x: winNote.width * 0.1
        y: winNote.height * 0.4
        font.pixelSize: width * 0.03
        placeholderText: "Write your notes here..."
        leftPadding: width * 0.02
        rightPadding: width * 0.02
        topPadding: width * 0.02
        bottomPadding: width * 0.02
        background: Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height
            radius: parent.width * 0.02
            color: "#bbb3b3"
        }
    }
    Button {
        id: btnUpload
        width: winNote.width * 0.1
        height: winNote.width * 0.1
        x: winNote.width * 0.8
        y: winNote.height * 0.75
        flat: true
        Image {
            source: "qrc:/images/upload.svg"
            sourceSize.width: btnUpload.width * 0.7
            sourceSize.height: btnUpload.height * 0.7
            anchors.centerIn: parent
        }
        onClicked: {
            backend.write_new_notes(textbox.text)
            textbox.text = ""
        }
    }
}