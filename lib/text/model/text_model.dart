class ChatTexts {
  String text;
  bool isSent;
  ChatTexts(this.text, this.isSent);
}

List<ChatTexts> chat = [
  ChatTexts('Hello', true),
  ChatTexts('Hi', true),
  ChatTexts('How are you', false),
  ChatTexts('Helloo', true)
];
