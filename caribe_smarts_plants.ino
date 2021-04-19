#include "DHT.h"
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>

const char *ssid = "195443796878";  
const char *password = "131341098473";  

#define DHTPIN 2
#define DHTTYPE DHT11     
DHT dht(DHTPIN, DHTTYPE);

float c,f,h;
String dhtData; 
boolean sensorError = false; 

ESP8266WebServer server(80); 

void handleRoot() {  
  server.send(200, "text/html", "<h1>You are connected</h1>");
}

void setup() {
  Serial.begin(9600);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);  
    Serial.print("*");  
  }
  WiFi.mode(WIFI_STA);
  IPAddress ip(192, 168, 1, 200); 
  IPAddress gateway(192, 168, 1, 1);
  IPAddress subnet(255, 255, 255, 0); 
  WiFi.config(ip, gateway, subnet);
  Serial.println(WiFi.localIP());
  server.on("/", handleRoot);
  server.on("/dht", sendDhtData); 
  server.begin();
  Serial.println("HTTP server started"); 
  dht.begin(); 
}

void sendDhtData() {
  server.send(200, "text/plain", dhtData); 
}

void loop() {
  server.handleClient(); 
  c = dht.readTemperature();  
  f = dht.readHumidity();
  h = dht.readHumidity();
  delay(500); 
  if (isnan(c) || isnan(h) || isnan(f)) { 
    Serial.print("Sensor Not Connected");  
    sensorError=true;
  }else {  
    Serial.print(c);
  }
  // If there is any issue in sensor connections, it will send 000 as String.
  if(sensorError) { 
    dhtData = "sensorError";
  }else {  
    dhtData = String(c) + ' ' + String(f) + ' ' + String(h);
  }
  delay(2000); 
}
