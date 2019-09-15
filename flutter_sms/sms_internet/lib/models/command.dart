class Command {
  String command;
  String name;
  List<String> arguments = [];
  Command({this.name,this.command, this.arguments}) {
    for (int i = 0; i < arguments.length; i++) {
      arguments[i] = "'" + arguments[i] + "'";
    }
  }

}