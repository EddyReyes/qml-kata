import QtQuick 2.4
import QtGraphicalEffects 1.0

Item {
    id: root
    width: 1600
    height: 800

    // Lets follow along with the example at:
    // https://thebookofshaders.com/03/

    // The online glsl examples rely on a uniform containing the time
    // epoch time: The  number of seconds that have elapsed since 00:00:00
    // Coordinated Universal Time (UTC), Thursday, 1 January 19
    // http ://en.wikipedia.org/wiki/Unix_time
    // 
    // Here's the catch: we can use it in qml, but it creates issues.
    // At the time of this writing epoch time is 1504253935132
    // which is too large to fit into an "int", but still fits into a "real"
    // However, when copied into the uniform for the shader, it loses 
    // precision and becomes unusable. 
    // For that reason we're better off using a timer
    // like the one below to count the milliseconds from the start of this application
    //
    property real applicationTime: appTimer.timeValue

    // If we use the raw millisecond values, the animation will play too fast
    // We can control the speed of the animation by dividing the time
    property int timeFactor: 1000

    // Update applicationTime every 16 milliseconds
    // This causes the scene to redraw at roughly 60 FPS
    Timer {
        id: appTimer
        interval: 16
        running: true
        repeat: true
        property int timeValue: 0
        onTriggered: {
            timeValue += interval;

            // If you really really want epoch time you can get it
            // with a call to Date.now()
            // root.applicationTime = Date.now();
        }
    }

    Row {
        anchors.fill: parent
        ShaderEffect {
            id: shader
            width: parent.width / 2
            height: parent.height
            // We can choose to divide the u_time before passing it the shader
            // but for demonstration purposes we'll divide it in the shader
            property real u_time: applicationTime
            property real u_timeFactor: timeFactor
            fragmentShader: "
                varying highp vec2 coord;
                uniform highp float u_time;
                uniform highp float u_timeFactor;
                uniform lowp float qt_Opacity;
                void main() {
                    gl_FragColor = vec4(abs(sin(u_time / u_timeFactor)), 0.0,0.0,1.0);
            }"
        }


        // Furthermore, the most pragmatic way to control an animation inside a shader
        // is to dump the notion of "time" altogether, and adopt an animated QML property
        // as demonstrated in the self contained example below
        
        ShaderEffect {
            id: shader2
            width: parent.width / 2
            height: parent.height
            // If we use an animated property instead of epoch time
            // we have much better control over the speed, 
            // plus free easing curves! :D
            property real u_time
            SequentialAnimation on u_time {
                loops: Animation.Infinite
                NumberAnimation {
                    duration: 1500
                    to: 1
                    easing.type: Easing.OutQuad
                }
                NumberAnimation {
                    duration: 1500
                    to: 0
                    easing.type: Easing.InQuad
                }
            }
            fragmentShader: "
                varying highp vec2 coord;
                uniform highp float u_time;
                uniform lowp float qt_Opacity;
                void main() {
                    gl_FragColor = vec4(abs(sin(u_time)), 0.0,0.0,1.0);
            }"
        }
    }
}
