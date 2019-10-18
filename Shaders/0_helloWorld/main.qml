import QtQuick 2.4
import QtGraphicalEffects 1.0

Item {
    id: root
    width: 800
    height: 480

    ShaderEffect {
        id: shader
        anchors.fill: parent
        fragmentShader: "
            void main() {
                // Red
                // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);

                // Green
                // gl_FragColor = vec4(0.0, 1.0, 0.0, 1.0);

                // Blue
                // gl_FragColor = vec4(0.0, 0.0, 1.0, 1.0);

                // Yellow
                // gl_FragColor = vec4(1.0, 1.0, 0.0, 1.0);
                
                // Cyan
                // gl_FragColor = vec4(0.0, 1.0, 1.0, 1.0);

                // Magenta
                // gl_FragColor = vec4(1.0, 0.0, 1.0, 1.0);

                // White
                gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
            }"
    }
}
