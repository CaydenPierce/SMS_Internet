import 'package:sms/sms.dart';
import 'package:sms_internet/services/state.dart';

SmsSender sender = new SmsSender();
String address = "2269197946";
String twilio2 = "+16137033776";
String twilio = "+12895125028";

void sendSMSTo(String message, String recipient) async {
  sender.sendSms(new SmsMessage(recipient, 'Hello flutter!'));
}

void sendSMS(String message) {
  print("sending message " + message);
  sender.sendSms(new SmsMessage(twilio, message));
}

void testSMS() async {
  sender.sendSms(new SmsMessage(address, 'Hello flutter!'));
}

void getMessages() async {
  SmsQuery query = new SmsQuery();
  List<SmsMessage> messages = await query.getAllSms;
  for (SmsMessage message in messages) {
    print(message.body);
  }
}
SmsReceiver receiver = new SmsReceiver();
Function _callback;

void setSmsCallback(Function(String) function) {
  _callback = function;
}

void initSmsListener() {
  receiver.onSmsReceived.listen((SmsMessage msg){
    print(msg.address);
    print(msg.body);

    if (msg.address == twilio) {
      String message = msg.body;
      message = message.substring(38, message.length);

      appState.smsResponse = message;
      appState.addResponse(message);
      if(_callback != null) {
        _callback(message);
      }
    }
  });
}







