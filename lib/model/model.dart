class QuestionModel {
  String question;
  String answer;
  String imageUrl;

  QuestionModel({this.answer, this.imageUrl, this.question});

  void setQuestion(String setQuestion) {
    question = setQuestion;
  }

  void setAnswer(String setAnswer) {
    answer = setAnswer;
  }

  void setImageUrl(String setImage) {
    imageUrl = setImage;
  }

  String getAnswer() {
    return answer;
  }

  String getQuestion() {
    return question;
  }

  String getImageUrl() {
    return imageUrl;
  }
}
