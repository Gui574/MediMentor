import 'dart:core';

class Login {
  final String username;
  final String password;

  Login(this.username, this.password);
}

List<Login> logins = [];

@override
bool contains(String u, String p) {
  for (Login l in logins) {
    if (l.username == u && l.password == p) {
      return true;
    }
  }
  return false;
}

String loginLogic(String email, String password) {
  if (email == 'teste1' && password == 'teste1') {
    return "caretaker";
  } else if (email == 'teste2' && password == 'teste2') {
    return "elder";
  } else {
    return "invalid";
  }
}
