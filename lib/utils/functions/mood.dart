enum Mood { happy, sad, angry, excited, bored }

extension MoodExtesnsion on Mood {
  String get name {
    switch (this) {
      case Mood.happy:
        return "Happy";
      case Mood.sad:
        return "Sad";
        throw UnimplementedError();
      case Mood.angry:
        return "Angry";
        throw UnimplementedError();
      case Mood.excited:
        return "Excites";
        throw UnimplementedError();
      case Mood.bored:
        return "Bored";
      default:
        return "";
    }
  }

  String get emoji {
    switch (this) {
      case Mood.happy:
        return "😊";
      case Mood.sad:
        return "😔";
        throw UnimplementedError();
      case Mood.angry:
        return "😡";
        throw UnimplementedError();
      case Mood.excited:
        return "😃";
        throw UnimplementedError();
      case Mood.bored:
        return "😴";
      default:
        return "";
    }
  }

  // method to convert string values to enum values
  static Mood fromString(String moodString) {
    return Mood.values.firstWhere(
      (mood) => mood.name == moodString,
      orElse: () => Mood.happy,
    );
  }
}
