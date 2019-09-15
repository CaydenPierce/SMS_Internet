num capacity = 10;

class AppState {
  String smsResponse = "";
  List<String> stack = [];
  Function stackListener;

  int stackIndex = 0;

  void clearResponse() {
    smsResponse = "";
  }

  void addResponse(String response) {
    if (stack.length > capacity) {
      stack.removeLast();
    }
    stack.insert(0, response);
    stackListener();
  }

  void listenToStack(Function callback) {
    stackListener = callback;
  }

}

AppState appState = new AppState();