import QtQuick 2.0
import VPlay 2.0


EntityBase{
    id:frogEntity
    entityType: "Frog"
    state: frogcollider.linearVelocity.y<0?"jumping":"falling"
    property int impulse: y -frogcollider.linearVelocity.y
    property  alias controller:twoaxiscontroller
    TwoAxisController{
        id:twoaxiscontroller
    }

    SpriteSequenceVPlay{
        id:frogaanimation

        defaultSource: "../assets/spritesheet.png"
        scale: 0.35
        anchors.centerIn: frogcollider
        rotation: frogEntity.state == "jumping" ? (system.desktopPlatform ? twoaxiscontroller.xAxis *15 :(accelerometer.reading !== null ? -accelerometer.reading.x * 10 : 0)):0
        SpriteVPlay{
            name: "sitting"
            frameWidth: 128
            frameHeight: 128
            startFrameColumn: 2
        }
        SpriteVPlay{
            name:"jumping"
            frameCount: 4
            frameRate: 8
            frameWidth: 128
            frameHeight:256
            frameX: 0
            frameY: 128
        }

    }
    BoxCollider{
        id:frogcollider
        width: 25
        height: 2

        bodyType: gameScene.state =="playing"?Body.Dynamic:Body.Static
        fixture.onContactChanged: {
            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

            if(otherEntityType === "Border" || otherEntityType === "Obstacle"){
                frogEntity.die()
        }
            else if(otherEntityType === "Platform" && frogEntity.state == "falling"){
                frogcollider.linearVelocity.y= -400

                otherEntity.playWobbleAnimation()
            }
        }
        linearVelocity.x: system.desktopPlatform ?
                            twoaxiscontroller.xAxis * 200 :  //  for desktop
                            (accelerometer.reading !== null ? -accelerometer.reading.x * 100 : 0)
    }

    onStateChanged: {
        if(frogEntity.state == "jumping"){
            frogaanimation.jumpTo("jumping")}
        if(frogEntity.state=="falling")
            frogaanimation.jumpTo("sitting")
    }
    onYChanged: {
        if(y<200)
            y=200
        score +=1
    }

    function die(){
        frogEntity.x=gameScene.width/2 -10
        frogEntity.y=220
        frogcollider.linearVelocity.y = 0
        frogaanimation.jumpTo("sitting")
        score =0
        gameScene.state ="gameOver"
    }


}


