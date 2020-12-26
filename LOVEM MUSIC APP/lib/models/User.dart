//this is used to avoid importing heavy package firebase_auth everywhere for getting just some User details
class User{
  String _name,_image,_email;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get image => _image;

  get email => _email;

  set email(value) {
    _email = value;
  }

  set image(value) {
    _image = value;
  }
}