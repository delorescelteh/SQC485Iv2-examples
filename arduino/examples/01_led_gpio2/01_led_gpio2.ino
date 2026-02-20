// SQC485Iv2 example: LED on GPIO2
//
// Notes:
// - SQC485Iv2 schematic indicates the LED turns ON when GPIO2 is LOW.
// - This example toggles GPIO2 and should blink the onboard LED.
//
// Library: https://github.com/livinghuang/siliqs_esp32 (added as git submodule)

#ifndef LED_PIN
#define LED_PIN 2
#endif

void setup() {
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  // LED on when LOW (active-low)
  digitalWrite(LED_PIN, LOW);
  delay(500);
  digitalWrite(LED_PIN, HIGH);
  delay(500);
}
