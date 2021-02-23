String postLoadMoreUrl(String url, int currentNo, int pageSize) {
  if (url == null) {
    return null;
  }

  url = url.trim();
  if (url.contains("?")) {
    url = url +
        "&startNo=" +
        currentNo.toString() +
        "&pageSize=" +
        pageSize.toString();
  } else {
    url = url +
        "?startNo=" +
        currentNo.toString() +
        "&pageSize=" +
        pageSize.toString();
  }
  print(url);
  return url;
}