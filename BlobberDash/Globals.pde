static final int windowWidth = 1200;
static final int windowHeight = 800;

ArrayList<Obj> objects = new ArrayList();
boolean canSpawn = true;
boolean canSpawnBomb = true;
float spawnTimer = 5.0;
float bombSpawnTimer = 5.0;
GameState gState;
Player player;
HeartBox hb;
BombBox bb;
//PostFX fx;
PFont font;



enum GameState {
  START, 
  INGAME, 
  GAMEOVER
}