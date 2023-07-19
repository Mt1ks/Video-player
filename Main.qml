import QtQuick 2.15
import QtMultimedia 5.15

Rectangle {
    width: 400
    height: 300

    MediaPlayer {
        id: mediaPlayer
        autoLoad: false
        source: ""

        onStatusChanged: {
            if (mediaPlayer.status === MediaPlayer.EndOfMedia) {
                mediaPlayer.stop()
                playButton.text = "Play"
            }
        }
    }

    VideoOutput {
        anchors.fill: parent
        source: mediaPlayer
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Button {
            id: playButton
            text: "Play"
            onClicked: {
                if (mediaPlayer.status === MediaPlayer.StoppedState) {
                    mediaPlayer.play()
                    playButton.text = "Pause"
                } else if (mediaPlayer.status === MediaPlayer.PlayingState) {
                    mediaPlayer.pause()
                    playButton.text = "Play"
                } else if (mediaPlayer.status === MediaPlayer.PausedState) {
                    mediaPlayer.play()
                    playButton.text = "Pause"
                }
            }
        }

        Slider {
            id: progressSlider
            width: 200
            from: 0
            to: mediaPlayer.duration
            value: mediaPlayer.position

            onValueChanged: {
                if (!progressSlider.seeking) {
                    mediaPlayer.position = value
                }
            }

            onSliderPressed: {
                progressSlider.seeking = true
            }

            onSliderReleased: {
                mediaPlayer.position = value
                progressSlider.seeking = false
            }
        }
    }

    FileDialog {
        id: fileDialog
        title: "Open Video"
        folder: shortcuts.home
        nameFilters: ["Video Files (*.mp4 *.avi *.mkv)"]
        onAccepted: {
            mediaPlayer.source = fileDialog.fileUrl
            mediaPlayer.play()
            playButton.text = "Pause"
        }
    }

    Component.onCompleted: {
        fileDialog.open()
    }
}
