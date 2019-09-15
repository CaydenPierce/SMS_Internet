import 'package:sms_internet/models/command.dart';

List<Command> commands = [
  Command(name: "Web Browser", command: "python3 smsbrowser.py", arguments: ["web adress"]),
  Command(name: "ls", command: "ls", arguments: []),
  Command(name: "Weather", command: "python3 weather.py", arguments: ["city"]),
  Command(name: "News", command: "python3 news.py", arguments: ["news search"]),
  Command(name: "Maps", command: "python3 travel.py",  arguments: ["address1", "address2", "mode"]),
  Command(name: "Thesaurus", command: "python3 Thesaurus.py ", arguments: ["word"]),
  Command(name: "Translate", command: "python3 translate.py", arguments: ["Text to be Translated ", "Target Language"]),
  Command(name: "Bash", command: "", arguments: ["cmd"]),
];

