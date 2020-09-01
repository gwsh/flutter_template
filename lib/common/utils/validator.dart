/// 检查邮箱格式
bool appIsEmail(String input) {
  if (input == null || input.isEmpty) return false;
  // 邮箱正则
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

/// 检查字符长度
bool appCheckStringLength(String input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}
