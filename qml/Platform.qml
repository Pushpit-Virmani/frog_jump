import QtQuick 2.2
import VPlay 2.0



EntityBase{
    id:platform
    entityType: "Platform"
    width: 64
    height: 32

    Image {
        id: platformimg
        source: "../assets/leaf.png"
        anchors.fill: platform
    }

    BoxCollider{
        id:platformcollider
        width: parent.width
        height: parent.height -20
        bodyType: Body.Dynamic
        collisionTestingOnlyMode: true
        fixture.onBeginContact: {
            var otherEntity =other.getBody().target
            var otherEntityType=otherEntity.entityType

            if(otherEntityType === "Border"){
                platform.x = utils.generateRandomValueBetween(32,gameScene.width-64)
                platform.y=0
            }

        }
    }
    MovementAnimation{
        target: platform
        property: "y"
        velocity: frog.impulse/2
        running: frog.y<210
    }

    //wobble animation
    ScaleAnimator {
    id:wobbleAnimation
    target:platform
    running:false
    from:0.5
    to:1
    duration:1000
    easing.type:Easing.OutElastic}


   function playWobbleAnimation()
   {
       wobbleAnimation.start()
   }

}


