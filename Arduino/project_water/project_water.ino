#include "DHT.h"       
#include <ESP8266WiFi.h>

// pins
#define dht_dpin D6
#define ledPin D7

// sensors
#define DHTTYPE DHT11   // DHT 11
DHT dht(dht_dpin, DHTTYPE); 
#define SensorPin A0 
float sensorValue = 0; 

// wifi
const char* ssid = "UPC9704183";
const char* password = "rHzpmzp5kuwy";
WiFiServer server(80);
int moisture;
int percentage;

int map_low = 1024;
int map_high = 460;
void setup(void)
{ 
  dht.begin();
  Serial.begin(115200);
  // LED
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW);
  wifiConnection();
  delay(700);

}
void loop() {

    wifi();
    //writeHumidityAndTemperature();
    //delay(800);

}

void writeHumidityAndTemperature() {
    float h = dht.readHumidity();
    float t = dht.readTemperature();         
    Serial.print("Current humidity = ");
    Serial.print(h);
    Serial.print("%  ");
    Serial.print("temperature = ");
    Serial.print(t); 
    Serial.println("C  ");
}

void wifiConnection() {
  // Connect to WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
 
  WiFi.begin(ssid, password);
 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
 
  // Start the server
  server.begin();
  Serial.println("Server started");
}

void wifi() {
  // Check if a client has connected
  WiFiClient client = server.available();
  if (!client) {
    return;
  }
 
  // Wait until the client sends some data
  Serial.println("new client");
  while(!client.available()){
    delay(1);
  }
 
  // Read the first line of the request
  String request = client.readStringUntil('\r');
  Serial.println(request);
  handleReuests(request, client);
  client.flush();
}

void handleReuests(String request, WiFiClient client) {
  if (request.indexOf("/LED=ON") != -1)  
  {
    request.remove(0,7);
    digitalWrite(ledPin, HIGH);
    Serial.println(request);
    Serial.println(request.toInt());
    Serial.println(request.toInt()*1000);
    delay(request.toInt()*1000);
    digitalWrite(ledPin, LOW);
    client.println("2,LED_OFF");
    client.flush();
    
  } 
  else if (request.indexOf("/LED=OFF") != -1) 
  {
    digitalWrite(ledPin, LOW);
    client.println("2,LED_OFF");
    client.flush();
  } 
  else if (request.indexOf("/AIR_READ") != -1) 
  {
     String temp = String(dht.readTemperature());
     String hum = String(dht.readHumidity());
     moisture = analogRead(SensorPin);
     delay(1);
     Serial.print(moisture);

     percentage = map(moisture, map_low, map_high, 0, 100);
         Serial.print(percentage);
     String temp_hum_result = "3," + temp + "," + hum + "," + percentage;
     client.println(temp_hum_result);
     client.flush();
  } 
}
