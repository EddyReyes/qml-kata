import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2

Item {
    id: root
    width: 800
    height: 480

    ColorDialog {
        id: colorDialog
        title: "Please choose a color"
        Component.onCompleted: visible = true
    }

    ShaderEffect {
        id: shader
        anchors.fill: parent
        // Properties inside of ShaderEffect also creates uniforms
        // which you can access in the shader, with the same name
        property color u_color: colorDialog.currentColor
        fragmentShader: "
            uniform lowp vec4 u_color;

            void main() {
                gl_FragColor = u_color;
            }"
    }
}
