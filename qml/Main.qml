import VPlay 2.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow



    activeScene:gameScene


    screenWidth: 640
    screenHeight: 960

EntityManager{
    id:entityManager
    entityContainer: GameScene
}
GameScene{
    id:gameScene}
}



