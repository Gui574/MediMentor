String loginLogic(String email, String password) {
  if (email == 'teste1' && password == 'teste1') {
    return "caretaker";
  } else if (email == 'teste2' && password == 'teste2') {
    return "elder";
  } else {
    return "invalid";
  }
}
