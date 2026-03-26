// ARRAYS 
var starXPos = [];
var starYPos = [];
var star = "⭐";
var starTotal = 100;

var planetXPos = [];
var planetYPos = [];
var planet = "🪐";
var planetTotal = 3;
var planetFound = 0;

// ANIMATION VARIABLE 
var glow = 0;

setup = function() {
    size(600, 450);
    reset();
};

draw = function() {

    // KEY PRESSED FEATURE 
    if (keyPressed) {
        if (key == 'r') {
            reset();
        }
    }

    display();

    // SIMPLE ANIMATION 
    glow += 1;
};

// MOUSE CLICKED FEATURE
mouseClicked = function() {
    check(mouseX, mouseY);
};

// FUNCTION TO CHECK IF PLANET IS CLICKED
var check = function(xClick, yClick) {

    // FOR LOOP 
    for (var i = 0; i < planetXPos.length; i++) {

        if (dist(xClick, yClick, planetXPos[i], planetYPos[i]) < 20) {
            planetXPos.splice(i, 1);
            planetYPos.splice(i, 1);
            planetFound++;
        }
    }
};

// DISPLAY EVERYTHING
var display = function() {
    background(100, 100, 120);

    fill(255, 255, 0);
    textSize(20);

    // DRAW PLANETS
    for (var i = 0; i < planetXPos.length; i++) {
        text(planet, planetXPos[i], planetYPos[i]);
    }

    // DRAW STARS
    for (var i = 0; i < starXPos.length; i++) {
        text(star, starXPos[i], starYPos[i]);
    }

    // BOTTOM BAR
    fill(0, 0, 0);
    rect(0, 400, 600, 50);

    fill(255, 255, 255);
    text("Find the " + planet + "s!", 20, 430);

    // WIN SCREEN
    if (planetFound === planetTotal) {
        fill(0, 255, 200);
        textSize(40);
        text("YOU WIN!", 180, 200);
            textSize(20);
        text("Press 'r' to restart", 200, 240);
    }
};

// RESET GAME
var reset = function() {

    starXPos = [];
    starYPos = [];
    planetXPos = [];
    planetYPos = [];
    planetFound = 0;

    // FOR LOOP 
    for (var i = 0; i < starTotal; i++) {
        starXPos.push(random(0, 600));
        starYPos.push(random(0, 400));
    }

    // WHILE LOOP 
    var i = 0;
    while (i < planetTotal) {
        planetXPos.push(random(0, 600));
        planetYPos.push(random(0, 400));
        i++;
    }
};



