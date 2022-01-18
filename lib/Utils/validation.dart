String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (value.length == 0)
    return 'You must enter your Email';
  else if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

String validatePassword(String value) {
  if (value.length == 0)
    return 'You must enter your Password';
  else if (value.length < 6)
    return 'Enter your Correct Password';
  else
    return null;
}

String validatePhoneCode(String value) {
  if (value.length == 0)
    return 'Pick code';
  else
    return null;
}

String validatePhone(String value) {
  if (value.length == 0)
    return 'Enter Phone Number';
  else if (value.length < 11)
    return 'Enter a valid Phone Number';
  else
    return null;
}
String validateAge(String value) {
  if (value.length == 0)
    return 'Enter age';
  else if (value.length > 2)
    return 'Enter a valid age';
  else
    return null;
}

String validateName(String value) {
  if (value.length == 0)
    return 'Enter your Name';
  else if (value.length < 3)
    return 'Enter a Correct Name';
  else
    return null;
}
