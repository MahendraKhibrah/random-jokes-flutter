extension StringExt on String {
  String formatPhoneNumber() {
    String phoneNumber = replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.startsWith('+')) {
      return phoneNumber;
    }

    if (phoneNumber.startsWith('0')) {
      return '62${phoneNumber.substring(1)}';
    }

    return phoneNumber;
  }

  bool isValidEmail() {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(pattern).hasMatch(this);
  }

  bool isValidUrl() {
    if (isEmpty) {
      return false;
    }

    var url = this;

    if (!startsWith('http://') && !startsWith('https://')) {
      url = 'https://$url';
    }

    url = url.replaceAll(RegExp(r'/+$'), '');

    Uri? uri = Uri.tryParse(url);

    return uri != null && uri.isAbsolute;
  }

  bool isValidTikTokUrl() {
    if (!isValidUrl()) {
      return false;
    }

    var url = this;

    if (!startsWith('http://') && !startsWith('https://')) {
      url = 'https://$url';
    }

    RegExp tiktokPattern = RegExp(
      r'^https?://vt\.tiktok\.com/[a-zA-Z0-9_\-]+/?$',
    );

    return tiktokPattern.hasMatch(url);
  }

  bool isValidInstagramUrl() {
    if (!isValidUrl()) {
      return false;
    }

    try {
      var newUrlString = removeQueryFromUrl();

      if (newUrlString.endsWith('?')) {
        newUrlString = newUrlString.substring(0, newUrlString.length - 1);
      }

      if (!newUrlString.startsWith('http://') &&
          !newUrlString.startsWith('https://')) {
        newUrlString = 'https://$newUrlString';
      }

      var uri = Uri.parse(newUrlString);

      RegExp instagramPattern = RegExp(
        r'^https?://(www\.)?instagram\.com/reel/[a-zA-Z0-9_\-]+$',
      );

      newUrlString = uri.toString();

      if (newUrlString.endsWith('/')) {
        newUrlString = newUrlString.substring(0, newUrlString.length - 1);
      }

      return instagramPattern.hasMatch(newUrlString);
    } on Exception {
      return false;
    }
  }

  String removeQueryFromUrl() {
    try {
      Uri uri = Uri.parse(this);
      return uri.replace(queryParameters: {}).toString();
    } on Exception {
      return '';
    }
  }
}
