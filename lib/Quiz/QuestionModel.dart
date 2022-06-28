

class QuestionModel{

   String _correctAnswer;
   String _questionTextView;
   String _option1;
   String _option2;
   String _option3;
   String _option4;
   int _sets;

  QuestionModel(this._correctAnswer, this._questionTextView, this._option1,
      this._option2, this._option3, this._option4, this._sets);

  int get sets => _sets;

  set sets(int value) {
    _sets = value;
  }

  String get option4 => _option4;

  set option4(String value) {
    _option4 = value;
  }

  String get option3 => _option3;

  set option3(String value) {
    _option3 = value;
  }

  String get option2 => _option2;

  set option2(String value) {
    _option2 = value;
  }

  String get option1 => _option1;

  set option1(String value) {
    _option1 = value;
  }

  String get questionTextView => _questionTextView;

  set questionTextView(String value) {
    _questionTextView = value;
  }

  String get correctAnswer => _correctAnswer;

  set correctAnswer(String value) {
    _correctAnswer = value;
  }
}

