// SQC485Iv2 example: button on GPIO9 (GPIO9_USER_KEY)
//
// Prints button state via Serial.
// Adjust INPUT_PULLUP / active level based on your hardware wiring.

#ifndef BTN_PIN
#define BTN_PIN 9
#endif

void setup() {
  Serial.begin(115200);
  delay(200);

  pinMode(BTN_PIN, INPUT_PULLUP);
  Serial.println("SQC485Iv2 GPIO9 button test");
}

void loop() {
  int v = digitalRead(BTN_PIN);
  Serial.print("GPIO9=");
  Serial.println(v);
  delay(200);
}
