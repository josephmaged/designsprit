enum RequestState {
  loading,
  loaded,
  error,
}

enum Status {
  accepted(2),
  refused(3);

  const Status(this.value);

  final num value;
}

enum SwipeDirection {
  left,
  right,
}

enum MessageType {
  text(0),
  image(1),
  video(2),
  audio(3),
  document(4);

  final int type;

  const MessageType(this.type);
}

extension ConvertMessageType on int {
  MessageType toEnum() {
    switch (this) {
      case 0:
        return MessageType.text;
      case 1:
        return MessageType.image;
      case 3:
        return MessageType.audio;
      case 2:
        return MessageType.video;
      case 4:
        return MessageType.document;
      default:
        return MessageType.text;
    }
  }
}
