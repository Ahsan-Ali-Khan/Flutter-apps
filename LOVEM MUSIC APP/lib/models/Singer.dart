class Singer{
  String _name,_image;

  Singer(this._name, this._image);

  get image => _image;

  set image(value) {
    _image = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return 'Singers{_name: $_name, _image: $_image}';
  }
}