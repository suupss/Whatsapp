class ChatTexts {
  String text;
  bool isSent;
  ChatTexts(this.text, this.isSent);
}

List<ChatTexts> chat = [
  ChatTexts('Hello', true),
  ChatTexts('Hi', true),
  ChatTexts('Hello hello', false),
  ChatTexts('Helloo', true)
];
