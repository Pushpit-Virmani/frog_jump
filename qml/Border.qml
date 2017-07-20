import QtQuick 2.0
import VPlay 2.0


EntityBase{
    entityType: "Border"

    BoxCollider{
        width: gameScene.width *5
        height: 50
        bodyType: Body.Static
        collisionTestingOnlyMode: true

        Rectangle{
            anchors.fill: parent
            color: "red"
            visible: true
        }

    }
}

