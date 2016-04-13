// The Weather Box
// By Sam Legros
// October 10, 2014

// N.B. All code is my own except for applicable Keystone and YahooWeather Processing Library codes and where a link can be seen. I copied the general code for the process to make ellipses flash (for the rain animation).
// Link: http://forum.processing.org/two/discussion/2024/how-to-make-a-shape-flash-colour-every-x-amount-a-second/p1
// Keystone Library: http://keystonep5.sourceforge.net/
// YahooWeather Library: http://www.onformative.com/lab/google-weather-library-for-processing/

import deadpixel.keystone.*;

import com.onformative.yahooweather.*;

Keystone ks;
CornerPinSurface surface;
CornerPinSurface surface2;
CornerPinSurface surface3;

YahooWeather weather;
int updateIntervallMillis = 1000;

PGraphics offscreen;
PGraphics offscreen2;
PGraphics offscreen3;

// Wind Direction Arrows ==========================================================================================================================================================================================================================================
PImage up;
PImage down;
PImage n;
PImage ne;
PImage e;
PImage se;
PImage s;
PImage sw;
PImage w;
PImage nw;
// ================================================================================================================================================================================================================================================================

// Time Variable for Light Drizzle, Light Rain, Showers in the Vicinity, Light Rain Shower ========================================================================================================================================================================
int time = millis();
int time2 = millis();
int time3 = millis();
int time4 = millis();
int time5 = millis();
int time6 = millis();
int time7 = millis();
int time8 = millis();
int time9 = millis();
int time10 = millis();
int time11 = millis();
int time12 = millis();
int time13 = millis();
// ================================================================================================================================================================================================================================================================

// Time Variables for Rain, Thunder Showers =======================================================================================================================================================================================================================
int btime = millis();
int btime2 = millis();
int btime3 = millis();
int btime4 = millis();
int btime5 = millis();
int btime6 = millis();
int btime7 = millis();
int btime8 = millis();
int btime9 = millis();
int btime10 = millis();
int btime11 = millis();
int btime12 = millis();
int btime13 = millis();
// ================================================================================================================================================================================================================================================================

void setup() {
  size(displayWidth, displayHeight, P3D);

  weather = new YahooWeather(this, 12511881, "c", updateIntervallMillis);

  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(800, 800, 20);
  surface2 = ks.createCornerPinSurface(400, 200, 20); 
  surface2.moveTo(width/2+50, 100);
  surface3 = ks.createCornerPinSurface(300, 500, 20); 
  surface3.moveTo(width/2+50, height/2-200);

  // offscreen = Front
  offscreen = createGraphics(800, 800, P3D);
  // offscreen2 = Top
  offscreen2 = createGraphics(400, 200, P3D);
  // offscreen3 = Side
  offscreen3 = createGraphics(300, 500, P3D);
}

void draw() {
  weather.update();
  offscreen.noStroke();

  up = loadImage("up_arrow.png");
  down = loadImage("down_arrow.png");
  n = loadImage("n.png");
  ne = loadImage("ne.png");
  e = loadImage("e.png");
  se = loadImage("se.png");
  s = loadImage("s.png");
  sw = loadImage("sw.png");
  w = loadImage("w.png");
  nw = loadImage("nw.png");

  PVector surfaceMouse = surface.getTransformedMouse();
  PVector surfaceMouse2 = surface2.getTransformedMouse();
  PVector surfaceMouse3 = surface3.getTransformedMouse();

  int weatherline = offscreen.width/2+250;
  int y = 580;

  offscreen.beginDraw();
  offscreen.background(0);
  offscreen.fill(0, 255, 0);
  offscreen.fill(#000000);
  offscreen.textSize(20);

  // WEATHER CONDITION ============================================================================================================================================================================================================================================
  // Mostly Cloudy
  // Cloudy
  if (weather.getWeatherCondition().equals("Mostly Cloudy") || (weather.getWeatherCondition().equals("Cloudy")) || (weather.getWeatherCondition().equals("Fog"))) {
    offscreen.background(200);
    //SUN
    offscreen.fill(#F1F51E);
    offscreen.ellipse(offscreen.width/2-100, 150, 200, 200);
    //CLOUDTOP
    offscreen.fill(#E8E8E8);
    offscreen.ellipse(offscreen.width/2, 175, 250, 250);
    //CLOUDLEFT
    offscreen.ellipse(offscreen.width/2-145, 238, 125, 125);
    //CLOUDRIGHT
    offscreen.ellipse(offscreen.width/2+145, 225, 150, 150);
    //CLOUDBOT
    offscreen.rectMode(CENTER);
    offscreen.rect(offscreen.width/2, 275, 300, 50);
  } 
  // Partly Cloudy
  // Partly Cloudy/Windy
  // Unknown
  else if (weather.getWeatherCondition().equals("Partly Cloudy") || (weather.getWeatherCondition().equals("Partly Cloudy/Windy")) || (weather.getWeatherCondition().equals("Unknown"))) {
    offscreen.background(#A2CBFF);
    //SUN
    offscreen.fill(#F1F51E);
    offscreen.ellipse(offscreen.width/2-100, 150, 200, 200);
    //CLOUDTOP
    offscreen.fill(#E8E8E8);
    offscreen.ellipse(offscreen.width/2, 175, 250, 250);
    //CLOUDLEFT
    offscreen.ellipse(offscreen.width/2-145, 238, 125, 125);
    //CLOUDRIGHT
    offscreen.ellipse(offscreen.width/2+145, 225, 150, 150);
    //CLOUDBOT
    offscreen.rectMode(CENTER);
    offscreen.rect(offscreen.width/2, 275, 300, 50);
  } 
  // Fair
  // Clear
  else if (weather.getWeatherCondition().equals("Fair") || (weather.getWeatherCondition().equals("Clear"))) {
    //CENTER SUN
    offscreen.background(#A2CBFF);
    offscreen.fill(#F1F51E);
    offscreen.ellipse(offscreen.width/2, 175, 250, 250);
  } 
  // Light Drizzle
  // Light Rain
  // Showers in the Vicinity
  // Light Rain Shower
  else if (weather.getWeatherCondition().equals("Light Drizzle") || (weather.getWeatherCondition().equals("Light Rain")) || (weather.getWeatherCondition().equals("Showers in the Vicinity")) || (weather.getWeatherCondition().equals("Light Rain Shower"))) {
    offscreen.background(200);
    //CLOUDTOP
    offscreen.fill(#E8E8E8);
    offscreen.ellipse(offscreen.width/2, 175, 250, 250);
    //CLOUDLEFT
    offscreen.ellipse(offscreen.width/2-145, 238, 125, 125);
    //CLOUDRIGHT
    offscreen.ellipse(offscreen.width/2+145, 225, 150, 150);
    //CLOUDBOT
    offscreen.rectMode(CENTER);
    offscreen.rect(offscreen.width/2, 275, 300, 50);
    //    http://forum.processing.org/two/discussion/2024/how-to-make-a-shape-flash-colour-every-x-amount-a-second/p1
    offscreen.fill(120);
    int passedMillis = millis() - time;
    if (passedMillis >= 1000) {
      time = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-150, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis2 = millis() - time2;
    if (passedMillis2 >= 2000) {
      time2 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-100, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis3 = millis() - time3;
    if (passedMillis3 >= 3000) {
      time3 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-50, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis4 = millis() - time4;
    if (passedMillis4 >= 4000) {
      time4 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis5 = millis() - time5;
    if (passedMillis5 >= 5000) {
      time5 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+50, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis6 = millis() - time6;
    if (passedMillis6 >= 6000) {
      time6 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+100, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis7 = millis() - time7;
    if (passedMillis7 >= 7000) {
      time7 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+150, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis8 = millis() - time8;
    if (passedMillis8 >= 8000) {
      time8 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-125, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis9 = millis() - time9;
    if (passedMillis9 >= 9000) {
      time9 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-75, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis10 = millis() - time10;
    if (passedMillis10 >= 10000) {
      time10 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-25, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis11 = millis() - time11;
    if (passedMillis11 >= 11000) {
      time11 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+25, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis12 = millis() - time12;
    if (passedMillis12 >= 12000) {
      time12 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+75, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int passedMillis13 = millis() - time13;
    if (passedMillis13 >= 13000) {
      time13 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+125, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
  } 
  //Rain
  else if (weather.getWeatherCondition().equals("Rain")) {
    offscreen.background(200);
    //CLOUDTOP
    offscreen.fill(#E8E8E8);
    offscreen.ellipse(offscreen.width/2, 175, 250, 250);
    //CLOUDLEFT
    offscreen.ellipse(offscreen.width/2-145, 238, 125, 125);
    //CLOUDRIGHT
    offscreen.ellipse(offscreen.width/2+145, 225, 150, 150);
    //CLOUDBOT
    offscreen.rectMode(CENTER);
    offscreen.rect(offscreen.width/2, 275, 300, 50);
    //    http://forum.processing.org/two/discussion/2024/how-to-make-a-shape-flash-colour-every-x-amount-a-second/p1
    offscreen.fill(200);
    int bpassedMillis = millis() - btime;
    if (bpassedMillis >= 500) {
      btime = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-150, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis2 = millis() - btime2;
    if (bpassedMillis2 >= 1000) {
      btime2 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-100, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis3 = millis() - btime3;
    if (bpassedMillis3 >= 1500) {
      btime3 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-50, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis4 = millis() - btime4;
    if (bpassedMillis4 >= 2000) {
      btime4 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis5 = millis() - btime5;
    if (bpassedMillis5 >= 2500) {
      btime5 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+50, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis6 = millis() - btime6;
    if (bpassedMillis6 >= 3000) {
      btime6 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+100, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis7 = millis() - btime7;
    if (bpassedMillis7 >= 3500) {
      btime7 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+150, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis8 = millis() - btime8;
    if (bpassedMillis8 >= 4000) {
      btime8 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-125, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis9 = millis() - btime9;
    if (bpassedMillis9 >= 4500) {
      btime9 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-75, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis10 = millis() - btime10;
    if (bpassedMillis10 >= 5000) {
      btime10 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-25, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis11 = millis() - btime11;
    if (bpassedMillis11 >= 5500) {
      btime11 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+25, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis12 = millis() - btime12;
    if (bpassedMillis12 >= 6000) {
      btime12 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+75, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis13 = millis() - btime13;
    if (bpassedMillis13 >= 6500) {
      btime13 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+125, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
  } 
  // Thunder Showers
  else if (weather.getWeatherCondition().equals("Thunder Showers")) {
    offscreen.background(200);
    //CLOUDTOP
    offscreen.fill(#E8E8E8);
    offscreen.ellipse(offscreen.width/2, 175, 250, 250);
    //CLOUDLEFT
    offscreen.ellipse(offscreen.width/2-145, 238, 125, 125);
    //CLOUDRIGHT
    offscreen.ellipse(offscreen.width/2+145, 225, 150, 150);
    //CLOUDBOT
    offscreen.rectMode(CENTER);
    offscreen.rect(offscreen.width/2, 275, 300, 50);
    // http://forum.processing.org/two/discussion/2024/how-to-make-a-shape-flash-colour-every-x-amount-a-second/p1
    offscreen.fill(120);
    int bpassedMillis = millis() - btime;
    if (bpassedMillis >= 500) {
      btime = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-150, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis2 = millis() - btime2;
    if (bpassedMillis2 >= 1000) {
      btime2 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-100, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis3 = millis() - btime3;
    if (bpassedMillis3 >= 1500) {
      btime3 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-50, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
      //BOLT
      offscreen.fill(#FFFFFF);
      offscreen.beginShape();
      offscreen.vertex(offscreen.width/2-25, 300);
      offscreen.vertex(offscreen.width/2-50, 350);
      offscreen.vertex(offscreen.width/2-15, 350);
      offscreen.vertex(offscreen.width/2-35, 400);
      offscreen.vertex(offscreen.width/2+50, 325);
      offscreen.vertex(offscreen.width/2+10, 325);
      offscreen.vertex(offscreen.width/2+25, 300);
      offscreen.endShape(CLOSE);
    }
    int bpassedMillis4 = millis() - btime4;
    if (bpassedMillis4 >= 2000) {
      btime4 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
      //BOLT
      offscreen.fill(#FFFFFF);
      offscreen.beginShape();
      offscreen.vertex(offscreen.width/2-25, 300);
      offscreen.vertex(offscreen.width/2-50, 350);
      offscreen.vertex(offscreen.width/2-15, 350);
      offscreen.vertex(offscreen.width/2-35, 400);
      offscreen.vertex(offscreen.width/2+50, 325);
      offscreen.vertex(offscreen.width/2+10, 325);
      offscreen.vertex(offscreen.width/2+25, 300);
      offscreen.endShape(CLOSE);
    }
    int bpassedMillis5 = millis() - btime5;
    if (bpassedMillis5 >= 2500) {
      btime5 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+50, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis6 = millis() - btime6;
    if (bpassedMillis6 >= 3000) {
      btime6 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+100, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis7 = millis() - btime7;
    if (bpassedMillis7 >= 3500) {
      btime7 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+150, offscreen.width/2-60, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis8 = millis() - btime8;
    if (bpassedMillis8 >= 4000) {
      btime8 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-125, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis9 = millis() - btime9;
    if (bpassedMillis9 >= 4500) {
      btime9 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-75, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis10 = millis() - btime10;
    if (bpassedMillis10 >= 5000) {
      btime10 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2-25, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis11 = millis() - btime11;
    if (bpassedMillis11 >= 5500) {
      btime11 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+25, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis12 = millis() - btime12;
    if (bpassedMillis12 >= 6000) {
      btime12 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+75, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
    int bpassedMillis13 = millis() - btime13;
    if (bpassedMillis13 >= 6500) {
      btime13 = millis();
      offscreen.fill(#0063FF);
      offscreen.ellipse(offscreen.width/2+125, offscreen.width/2-10, 20, 20);
      offscreen.fill(120);
    }
  }

  // ==============================================================================================================================================================================================================================================================

  // TEMPERATURE ==================================================================================================================================================================================================================================================
  offscreen.fill(#5F5F5E);
  offscreen.textAlign(CENTER);
  offscreen.ellipse(offscreen.width/2, 550, 200, 200);
  offscreen.fill(255);
  offscreen.textSize(60);
  offscreen.rectMode(CENTER);
  offscreen.text(weather.getTemperature()+" °C", offscreen.width/2, 575);
  // ==============================================================================================================================================================================================================================================================

  //SUNRISE/SET ===================================================================================================================================================================================================================================================
  offscreen.fill(#5F5F5E);
  offscreen.rect(offscreen.width/2-250, 550, 100, 175, 25);
  offscreen.fill(#F1F51E);
  offscreen.ellipse(offscreen.width/2-250, 490, 35, 35);
  offscreen.image(up, offscreen.width/2-257, 477, 15, 25);  
  offscreen.ellipse(offscreen.width/2-250, 575, 35, 35);
  offscreen.image(down, offscreen.width/2-257, 563, 15, 25);
  offscreen.fill(#FFFFFF);
  offscreen.textSize(20);
  offscreen.text(weather.getSunrise(), offscreen.width/2-250, 530);
  offscreen.text(weather.getSunset(), offscreen.width/2-250, 620);
  // ==============================================================================================================================================================================================================================================================

  // WIND DIRECTION ===============================================================================================================================================================================================================================================
  // 0=N, 90=E, 180=S, 270=W
  offscreen.fill(#5F5F5E);
  offscreen.rect(offscreen.width/2+250, 550, 100, 175, 25);
  offscreen.textSize(30);
  offscreen.fill(#FFFFFF);
  if ((weather.getWindDirection() < 10) || (weather.getWindDirection()> 350)) {
    offscreen.image(n, offscreen.width/2+215, 480, 70, 60);
    offscreen.text("N", weatherline, y);
  } else if ((weather.getWindDirection() >= 10) && (weather.getWindDirection()< 80)) {
    offscreen.image(ne, offscreen.width/2+215, 480, 70, 60);
    offscreen.text("NE", weatherline, y);
  } else if ((weather.getWindDirection() >= 80) && (weather.getWindDirection()< 100)) {
    offscreen.image(e, offscreen.width/2+215, 480, 70, 60);
    offscreen.text("E", weatherline, y);
  } else if ((weather.getWindDirection() >= 100) && (weather.getWindDirection()< 170)) {
    offscreen.image(se, offscreen.width/2+215, 480, 70, 60);
    offscreen.text("SE", weatherline, y);
  } else if ((weather.getWindDirection() >= 170) && (weather.getWindDirection()< 190)) {
    offscreen.image(s, offscreen.width/2+215, 480, 70, 60);
    offscreen.text("S", weatherline, y);
  } else if ((weather.getWindDirection() >= 190) && (weather.getWindDirection()< 260)) {
    offscreen.image(sw, offscreen.width/2+215, 480, 70, 60);
    offscreen.text("SW", weatherline, y);
  } else if ((weather.getWindDirection() >= 260) && (weather.getWindDirection()< 280)) {
    offscreen.image(w, offscreen.width/2+215, 480, 70, 60);
    offscreen.text("W", weatherline, y);
  } else if ((weather.getWindDirection() >= 280) && (weather.getWindDirection()<= 350)) {
    offscreen.image(nw, offscreen.width/2+215, 480, 70, 60);
    offscreen.text("NW", weatherline, y);
  }
  offscreen.textSize(16);
  offscreen.text(weather.getWindSpeed()+" km/h", weatherline, y+30);

  // CITY NAME + DATE =============================================================================================================================================================================================================================================
  offscreen.textSize(40);
  offscreen.fill(#5F5F5E);
  offscreen.rectMode(CENTER);
  offscreen.rect(offscreen.width/2, offscreen.height-80, 725, 100, 25);
  offscreen.fill(#FFFFFF);
  offscreen.text(weather.getCityName(), offscreen.width/2, offscreen.height-80);
  offscreen.textSize(20);
  offscreen.text(""+weather.getLastUpdated(), offscreen.width/2, offscreen.height-45);
  // ==============================================================================================================================================================================================================================================================

  // For calibration purposes =====================================================================================================================================================================================================================================
  // offscreen.text("Weather: "+weather.getWeatherCondition(), 125, 25);
  // offscreen.ellipse(surfaceMouse.x, surfaceMouse.y, 75, 75);
  // ==============================================================================================================================================================================================================================================================

  offscreen.endDraw();

  offscreen2.beginDraw();
  offscreen2.background(255);
  offscreen2.fill(0, 255, 0);
  // offscreen2.rect(surfaceMouse2.x, surfaceMouse2.y, 75, 75);
  offscreen2.textSize(40);
  offscreen2.textAlign(CENTER);
  offscreen2.fill(0);
  offscreen2.text("WEATHER BOX", offscreen2.width/2, offscreen2.height/2);
  offscreen2.endDraw();

  offscreen3.beginDraw();
  offscreen3.background(255);
  offscreen3.fill(0, 255, 0);
  // offscreen3.rect(surfaceMouse3.x, surfaceMouse3.y, 75, 75);
  offscreen3.textSize(40);
  offscreen3.textAlign(CENTER);
  offscreen3.fill(0);
  offscreen3.text("CITIES", offscreen3.width/2, 50);
  offscreen3.textSize(20);
  offscreen3.textAlign(LEFT);

  offscreen3.text("C for Charlottetown, PEI", 15, 100);
  offscreen3.text("E for Edmonton, AB", 15, 140);
  offscreen3.text("F for Fredericton, NB", 15, 180);
  offscreen3.text("H for Halifax, NS", 15, 220);
  offscreen3.text("Q for Quebec City, QC", 15, 260);
  offscreen3.text("R for Regina, SK", 15, 300);
  offscreen3.text("S for St. John's, NL", 15, 340);
  offscreen3.text("T for Toronto, ON", 15, 380);
  offscreen3.text("V for Victoria, BC", 15, 420);
  offscreen3.text("W for Winnipeg, MB", 15, 460);
  offscreen3.endDraw();

  background(0);

  surface.render(offscreen);
  surface2.render(offscreen2);
  surface3.render(offscreen3);
}

void keyPressed() {
  switch(key) {
  case 'i':
    ks.toggleCalibration();
    break;

  case 'o':
    ks.load();
    break;

  case 'p':
    ks.save();
    break;
  }

  //Charlottetown, PEI
  if (key == 'c') {
    weather.setWOEID(3789);
    // Other codes for Charlottetown: 2344923, 3789
  }
  //Edmonton, AB
  if (key == 'e') {
    weather.setWOEID(8676);
    // Other codes for Edmonton: 8676, 19367
  }
  //Fredericton, NB
  if (key == 'f') {
    weather.setWOEID(3704);
  }
  //Halifax, NS
  if (key == 'h') {
    weather.setWOEID(4177);
  }
  //Quebec City, QC
  if (key == 'q') {
    weather.setWOEID(3444);
  }
  //Regina, SK
  if (key == 'r') {
    weather.setWOEID(2512);
  }
  //St. John's, NL
  if (key == 's') {
    weather.setWOEID(56631539);
    // Other codes for St. John's: 2344919, 56631539
  }
  //Toronto, ON
  if (key == 't') {
    weather.setWOEID(12511881);
  }
  //Victoria, BC
  if (key == 'v') {
    weather.setWOEID(9848);
  }
  //Winnipeg, MB
  if (key == 'w') {
    weather.setWOEID(2972);
  }
}

