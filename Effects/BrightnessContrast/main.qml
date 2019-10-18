import QtQuick 2.4
// BrightnessContrast is a component of QtGraphicalEffects
import QtGraphicalEffects 1.0

// Slider is a component of QtQuick.Controls
import QtQuick.Controls 1.4

Item {
    width: 640
    height: 480

    Image {
        id: testImage
        source: "test.jpeg"
        anchors.fill: parent
    }

    BrightnessContrast {
        anchors.fill: testImage
        source: testImage
        // brightness and contrast values bound to slider values below
        brightness: brightnessSlider.value
        contrast: contrastSlider.value
    }

    // Sliders background
    Rectangle {
        anchors.fill: sliderColumn
        color: 'white'
        opacity: 0.5
        radius: 5
    }

    // Sliders
    Column {
        id: sliderColumn
        Slider {
            id: brightnessSlider
        }
        Slider {
            id: contrastSlider
        }
    }
}
