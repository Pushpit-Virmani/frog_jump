import QtQuick 2.0
import VPlay 2.0
import QtSensors 5.3
import "../"


Scene{
    id:gameScene
    width: 320
    height: 480

    PhysicsWorld{
        debugDrawVisible:false

        updatesPerSecondForPhysics: 60
        gravity.y:20
    }
    state: "start"

    property int score:0


    Image {
        id: pp
        source: "../../assets/background.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.gameWindowAnchorItem.bottom

    }
    Repeater{
        model: 10
        Platform{
            x:utils.generateRandomValueBetween(0,300)//width
            y:gameScene.height/10 * index
//            Obstacle{
//                anchors.centerIn: parent
//                x:parent.x
//                y:parent.y+30
//            }
        }
    }

    Frog{
        id:frog
        x:gameScene.width/2-10

        y:220
    }
    Platform{
        id:platform
        x:gameScene.width/2-30
       // y:40+Math.random()*400
        y:300
    }



   // controllers
    Keys.forwardTo: frog.controller
    Accelerometer{
        id:accelerometer
        active: true
    }
    Border{
        id:border
        x: -gameScene.width *2
        y:gameScene.height -10
    }
    MouseArea{
        id:mouseaa
        anchors.fill: gameScene.gameWindowAnchorItem
        onClicked: {
            if(gameScene.state === "start"){
                gameScene.state ="playing"}
            if(gameScene.state === "gameOver"){
                gameScene.state ="start"}
        }
    }
    Image {
        id: info
        anchors.centerIn: parent
        source: gameScene.state =="gameOver"?"../../assets/gameOverText.png":"../../assets/clickToPlayText.png"
        visible: gameScene.state !== "playing"   //to make it dissapear when game starts
    }


    Image {
        id: scorecount
        source: "../../assets/scoreCounter.png"
        height: 80
        x: -15
        y: -15
        Text {
            id: jj
            anchors.centerIn: parent
            text: score
            font.pixelSize: 32
            color: "red"

            ColorAnimation on color {

                to: "black"
                duration: 2000
                loops:Animation.Infinite
            }

        }
    }
}


