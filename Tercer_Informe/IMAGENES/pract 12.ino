/****************************************
 * Include Libraries
 ****************************************/
#include "UbidotsESPMQTT.h"
/****************************************
 * Define Constants
 ****************************************/
#define TOKEN "BBFF-7VCypcONKsr2C2wTD5vxdNeIq7SbPu" // Your Ubidots TOKEN
#define WIFINAME "YA NO MAS INTERNET" //Your SSID
#define WIFIPASS "fer-ya*1105*" // Your Wifi Pass
#define DEVICE_LABEL  "tem"  // Put here your Ubidots device label
#define VARIABLE_LABEL  "switch"  // Put here your Ubidots variable label 

Ubidots client(TOKEN);

/****************************************
 * Auxiliar Functions
 ****************************************/

void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i=0;i<length;i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
  if((char)payload[0]=='1')
  {
    digitalWrite(16,HIGH);
  }
  else 
  {
    digitalWrite(16,LOW);
  }
}

/****************************************
 * Main Functions
 ****************************************/

void setup() {
  // put your setup code here, to run once:
  client.ubidotsSetBroker("business.api.ubidots.com"); // Sets the broker properly for the business account
  client.setDebug(false); // Pass a true or false bool value to activate debug messages
  Serial.begin(115200);
  client.wifiConnection(WIFINAME, WIFIPASS);
  client.begin(callback);
  pinMode(16,OUTPUT);
  client.ubidotsSubscribe(DEVICE_LABEL, VARIABLE_LABEL); //Insert the dataSource and Variable's Labels
  }

void loop() {
  // put your main code here, to run repeatedly:
  if(!client.connected()){
      client.reconnect();
      client.ubidotsSubscribe(DEVICE_LABEL, VARIABLE_LABEL); //Insert the dataSource and Variable's Labels
      }
  float temperatura;
  float value1 = analogRead(A0);
  temperatura=(value1*330)/1023;
  client.add("temperature", temperatura);
  client.ubidotsPublish(DEVICE_LABEL);
  client.loop();
  }
