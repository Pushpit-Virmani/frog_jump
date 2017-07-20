import QtQuick 2.0
import VPlay 2.0


EntityBase{

    id:obss
    entityType: "Obstacle"


    SpriteSequenceVPlay{
        id:kkk

        defaultSource: "../assets/spritesheet.png"
        scale:0.35

        SpriteVPlay{
            name:"enemy"
            frameCount: 2
            frameRate: 10
            frameWidth: 128
            frameHeight:128
            frameX: 0
            frameY: 400
        }
    }
    BoxCollider{
        id:platformcollider2
        width: 50
        height: 50
        bodyType: Body.Dynamic
        collisionTestingOnlyMode: true


}}

