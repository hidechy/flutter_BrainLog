enum APIPath {
  getholiday,
  getOnedayArticle,
}

extension APIPathExtension on APIPath {
  String? get value {
    switch (this) {
      case APIPath.getholiday:
        return 'getholiday';
      case APIPath.getOnedayArticle:
        return 'getOnedayArticle';
    }
  }
}
