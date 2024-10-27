String removeIPAddresses(String input) {
  // Regular expression to match IPv4 addresses
  RegExp regExp = RegExp(r'\b(?:\d{1,3}\.){3}\d{1,3}\b');

  // Replace all occurrences of IP addresses with an empty string
  String result = input.replaceAll(regExp, '');

  return result;
}
