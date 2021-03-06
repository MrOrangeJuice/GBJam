/// @description Init global variables
display_set_gui_size(256,144);
global.lastCheckpointX = 0;
global.lastCheckpointY = 0;
global.coins = 0;
global.coinTextScale = 1;
global.p1TextScale = 1;
global.p2TextScale = 1;
global.p3TextScale = 1;
global.p4TextScale = 1;
global.time = 0;
global.controller = 0;
global.paused = false;
pauseOption = 0;
analogUpPrev = false;
analogDownPrev = false;
analogUpPrevD = false;
analogDownPrevD = false;
levelSplash = false;
splashOffset = 48;

// Multiplayer
global.p1skin = -1;
global.p2skin = -1;
global.p3skin = -1;
global.p4skin = -1;

global.p1lives = 0;
global.p2lives = 0;
global.p3lives = 0;
global.p4lives = 0;

global.skins = [false,false,false,false];

global.controllers = [-1,-1,-1,-1];