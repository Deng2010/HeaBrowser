import QtQuick
import QtWebEngine
import QtQuick.Controls

ApplicationWindow {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("HeaBrowser")

    Button {
        id: refreshButton
        icon.name: "view-refresh"
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 5
            topMargin: 5
            bottomMargin: 5
        }
        height: 28
        width: 28
        onClicked: webview.reload()
    }

    Rectangle {
        id: inputArea
        visible: true
        color: "grey"
        opacity: 0.75
        radius: 3
        anchors {
            left: refreshButton.right
            right: parent.right
            top: parent.top
            leftMargin: 2
            rightMargin: 5
            topMargin: 5
        }
        height: 28

        TextInput {
            id: input
            color: "white"
            opacity: 0.75
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                leftMargin: 2
                rightMargin: 2
            }
            text: "https://www.bing.com"
            font.pixelSize: 18
            onEditingFinished: webview.url = text
        }
    }
    Item {
        anchors {
            left: parent.left
            right: parent.right
            top: inputArea.bottom
            bottom: parent.bottom
            leftMargin: 5
            rightMargin: 5
            topMargin: 5
            bottomMargin: 5
        }

        WebEngineView {
            id: webview
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            width: mainWindow.width * 2 / 3
            url: input.text
            onUrlChanged: input.text = url
            onNewWindowRequested: function(request){
                webviewSecond.url = request.requestedUrl
            }
        }
        WebEngineView {
            id: webviewSecond
            anchors {
                left: webview.right
                top: parent.top
                bottom: parent.bottom
                right: parent.right
                leftMargin: 2
            }
        }
    }
    Dialog {
        id: debug
        title: qsTr("Debug")
        Label {
            id: debugText
            text: "Lorem ipsum..."
        }
    }

    function __debug(str) {
        debug.visible = true
        debugText.text = str
    }

}
