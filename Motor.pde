int potPin = A0;              // potentiometer pin
int motorPin = 0;             // motor pin
int potValue = 0;             // potentiometer value
int duration = 10000;         // motor ON duration
boolean motorstatus = ture;   // motor status, initial = ture, turned on then off = false

void setup()
{
  pinMode(potPin, INPUT);        // set potPin to input
  pinMode(motorPin, OUTPUT);     // set motorPin to output
  //Serial.begin(9600);
}

void motorOn() {
  digitalWrite(motorPin, HIGH);    // turn on motor
  delay(duration);                 // hold on for time duration
  digitalWrite(motorPin, LOW);     // turn off motor
}

void motorOff() {
  digitalWrite(motorPin, LOW);    // turn off the motor
}

void loop()
{
  potValue = analogRead(potPin);;        // read the potentiometer level
  delay(100);                            // wait for 100ms for analog pin reading 

  if ( (motorstatus == true) && (potValue >= 512) )
  {
    motorOn();                        // turn on motor
    motorstatus = false;              // change motor status to false
    delay(1000);                      // delay to make sure status changed to false
  }
  
  else if ( (motorstatus == false) && (potValue >= 512) )
  {
    motorOff();                      // stay turnning motor off when motor Status = false
    motorstatus = false;             // keep motor status false
    delay(500);                      // delay to make sure motor is off
  }
  
  else if ( (motorstatus == false) && (potValue < 512) )                             
  {
    motorstatus = true;             // set motor status = ture (initial status)
    delay(500);                     // delay to make sure motor is off
  }
}
  
