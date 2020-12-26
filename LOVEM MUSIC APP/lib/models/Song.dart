class Song{
  String _albumPhoto,_title,_artist,_audioUrl;

  String get albumPhoto => _albumPhoto;

  set albumPhoto(String value) {
    _albumPhoto = value;
  }

  get title => _title;

  get audioUrl => _audioUrl;

  set audioUrl(value) {
    _audioUrl = value;
  }

  get artist => _artist;

  set artist(value) {
    _artist = value;
  }

  set title(value) {
    _title = value;
  }
}