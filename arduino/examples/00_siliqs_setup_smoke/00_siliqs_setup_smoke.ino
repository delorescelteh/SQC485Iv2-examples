// SQC485Iv2 example: siliqs_esp32 setup smoke test
//
// This verifies the library can be included and the board boots.

#include "siliqs_esp32.h"

void setup() {
  Serial.begin(115200);
  delay(200);

  siliqs_esp32_setup();
  Serial.println("siliqs_esp32_setup() done");
}

void loop() {
  delay(1000);
}
