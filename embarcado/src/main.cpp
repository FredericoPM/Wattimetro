#include <WiFi.h>
#include <EmonLib.h>
#include <PubSubClient.h>

#define PIN_CONNECTION 2
 
EnergyMonitor emon;
#define vCalibration 106.8
#define currCalibration 0.52

WiFiClient espClient;
PubSubClient MQTT(espClient);

#define TOPICO_SUBSCRIBE "teste251120"
#define TOPICO_PUBLISH "teste251120"
#define ID_MQTT  "esp32_mqtt"    
 
const char* SSID = "Pixar"; // SSID / nome da rede WI-FI
const char* PASSWORD = "51993313"; // Senha da rede WI-FI
 
const char* BROKER_MQTT = "test.mosquitto.org";
int BROKER_PORT = 1883;

float voltage = 0.0;
float amps = 0.0;
float kW = 0.0;
float Wh = 0.0;
unsigned long lastmillis = millis();
unsigned long lastmillisData = millis();
//Reconecta-se ao WiFi
void reconnectWiFi(void) {
    //se já está conectado a rede WI-FI, nada é feito. 
    //Caso contrário, são efetuadas tentativas de conexão
    if (WiFi.status() == WL_CONNECTED)
        return;
          
    WiFi.begin(SSID, PASSWORD); // Conecta na rede WI-FI
      
    while (WiFi.status() != WL_CONNECTED) 
    {
        delay(100);
        Serial.print(".");
    }
    
    Serial.println();
    Serial.print("Conectado com sucesso na rede ");
    Serial.print(SSID);
    Serial.println("IP obtido: ");
    Serial.println(WiFi.localIP());
}
void initWiFi(void) {
    delay(10);
    Serial.println("------Conexao WI-FI------");
    Serial.print("Conectando-se na rede: ");
    Serial.println(SSID);
    Serial.println("Aguarde");
      
    reconnectWiFi();
}
//Função de callback esta função é chamada toda vez que uma informação de um dos tópicos subescritos chega)
void mqtt_callback(char* topic, byte* payload, unsigned int length) {
    String msg;
    /* obtem a string do payload recebido */
    for(int i = 0; i < length; i++) 
    {
       char c = (char)payload[i];
       msg += c;
    }
}
//Função: Reconecta-se ao broker MQTT em caso de sucesso na conexão ou reconexão, o subscribe dos tópicos é refeito.
void reconnectMQTT(void) {
    while (!MQTT.connected()) 
    {
        Serial.print("* Tentando se conectar ao Broker MQTT: ");
        Serial.println(BROKER_MQTT);
        if (MQTT.connect(ID_MQTT)) 
        {
            Serial.println("Conectado com sucesso ao broker MQTT!");
            digitalWrite(PIN_CONNECTION,HIGH);
            MQTT.subscribe(TOPICO_SUBSCRIBE); 
        } 
        else
        {
            digitalWrite(PIN_CONNECTION,LOW);
            Serial.println("Falha ao reconectar no broker.");
            Serial.println("Havera nova tentatica de conexao em 2s");
            delay(2000);
        }
    }
}
//Verifica o estado das conexões WiFI e ao broker MQTT. Em caso de desconexão, a conexão é refeita.
void VerificaConexoesWiFIEMQTT(void){
    if (!MQTT.connected()) 
        reconnectMQTT(); //se não há conexão com o Broker, a conexão é refeita
      
     reconnectWiFi(); //se não há conexão com o WiFI, a conexão é refeita
}
// Inicializa parâmetros de conexão MQTT(endereço do broker, porta e seta função de callback)
void initMQTT(void) {
    MQTT.setServer(BROKER_MQTT, BROKER_PORT);   //informa qual broker e porta deve ser conectado
    MQTT.setCallback(mqtt_callback);            //atribui função de callback
}

void readData() {
    emon.calcVI(20, 2000);
    kW = emon.realPower;
    Wh += kW * ((millis() - lastmillis)/3600000.0);
    if((millis()-lastmillis)/3600000.0 == 1){
        lastmillis = millis();
    }
    voltage = emon.Vrms;
    amps = emon.Irms;
}
void sendData(){
    char data[25];

    Wh = ((int)Wh % 10000) + (Wh - (int)Wh);
    Serial.print("Wh: ");
    Serial.println(Wh);
    sprintf(data, "D1|digital|%f", Wh);
    MQTT.publish(TOPICO_PUBLISH, data);

    kW = ((int)kW % 10000) + (kW - (int)kW);
    Serial.print("kW: ");
    Serial.println(kW);
    sprintf(data, "D2|digital|%f", kW);
    MQTT.publish(TOPICO_PUBLISH, data);

    voltage = ((int)voltage % 10000) + (voltage - (int)voltage);
    Serial.print("V: ");
    Serial.println(voltage);
    sprintf(data, "D3|digital|%f", voltage);
    MQTT.publish(TOPICO_PUBLISH, data);

    amps = ((int)amps % 10000) + (amps - (int)amps);
    Serial.print("A: ");
    Serial.println(amps);
    sprintf(data, "D4|digital|%f", amps);
    MQTT.publish(TOPICO_PUBLISH, data);
}
void setup() {
    Serial.begin(115200);
    emon.voltage(35, vCalibration, 1.7); // Voltage: input pin, calibration, phase_shift
    emon.current(34, currCalibration); 
    pinMode(PIN_CONNECTION, OUTPUT);
    digitalWrite(PIN_CONNECTION,LOW);// Current: input pin, calibration.
    initWiFi();
    initMQTT();
}
void loop() {
    VerificaConexoesWiFIEMQTT();
    readData();
    sendData();
    MQTT.loop();
}