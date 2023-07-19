import QtQuick.Dialogs 1.3

FileDialog {
    id: fileDialog

    property string fileUrl: ""
    selectExisting: true
    title: "Select video"
    nameFilters: ["Video files (*.mp4)"]

    onAccepted: {
        fileUrl = fileDialog.fileUrl
    }
}
