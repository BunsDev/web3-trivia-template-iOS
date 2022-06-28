
class LeaderBoardModel{
  late String _username,_imageUrl;
  late int _correct,_score,_summationScore,_totalTime,_wrong;




  LeaderBoardModel(this._username, this._imageUrl, this._correct, this._score,this._summationScore, this._totalTime, this._wrong);

  get wrong => _wrong;

  set wrong(value) {
    _wrong = value;
  }

  get totalTime => _totalTime;

  set totalTime(value) {
    _totalTime = value;
  }

  get summationScore => _summationScore;

  set summationScore(value) {
    _summationScore = value;
  }

  get score => _score;

  set score(value) {
    _score = value;
  }

  int get correct => _correct;

  set correct(int value) {
    _correct = value;
  }

  get imageUrl => _imageUrl;

  set imageUrl(value) {
    _imageUrl = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }
}