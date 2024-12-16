void main() {
  Mobile mobile =new  Mobile();
  mobile.makeCall();
  mobile.makeCall();
  mobile.makeCall();

  Keypad keypad =new Keypad();
  keypad.makeCall();
  keypad.makeCall();

  mobile.totalCalls();
  keypad.totalCalls();

  print('Total calls from Mobile and Keypad: ${mobile.callCount + keypad.callCount}');
}


class Mobile {
  int callCount = 0;

  Mobile();

  void makeCall() {
    callCount++;
    print('Mobile: Call number $callCount');
  }

  void totalCalls() {
    print('Total calls from Mobile: $callCount');
  }
}

class Keypad {
  int callCount = 0;
  Keypad();

  void makeCall() {
    callCount++;
    print('Keypad: Call number $callCount');
  }

  void totalCalls() {
    print('Total calls from Keypad: $callCount');
  }
}