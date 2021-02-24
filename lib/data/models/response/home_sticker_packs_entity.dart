class HomeStickerPacksEntity {
  List<Portfolio> _portfolio;
  List<Rank> _rank;
  List<Recommend> _recommend;
  List<Trending> _trending;

  HomeStickerPacksEntity(
      {List<Portfolio> portfolio,
        List<Rank> rank,
        List<Recommend> recommend,
        List<Trending> trending}) {
    this._portfolio = portfolio;
    this._rank = rank;
    this._recommend = recommend;
    this._trending = trending;
  }

  List<Portfolio> get portfolio => _portfolio;
  set portfolio(List<Portfolio> portfolio) => _portfolio = portfolio;
  List<Rank> get rank => _rank;
  set rank(List<Rank> rank) => _rank = rank;
  List<Recommend> get recommend => _recommend;
  set recommend(List<Recommend> recommend) => _recommend = recommend;
  List<Trending> get trending => _trending;
  set trending(List<Trending> trending) => _trending = trending;

  HomeStickerPacksEntity.fromJson(Map<String, dynamic> json) {
    if (json['portfolio'] != null) {
      _portfolio = new List<Portfolio>();
      json['portfolio'].forEach((v) {
        _portfolio.add(new Portfolio.fromJson(v));
      });
    }
    if (json['rank'] != null) {
      _rank = new List<Rank>();
      json['rank'].forEach((v) {
        _rank.add(new Rank.fromJson(v));
      });
    }
    if (json['recommend'] != null) {
      _recommend = new List<Recommend>();
      json['recommend'].forEach((v) {
        _recommend.add(new Recommend.fromJson(v));
      });
    }
    if (json['trending'] != null) {
      _trending = new List<Trending>();
      json['trending'].forEach((v) {
        _trending.add(new Trending.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._portfolio != null) {
      data['portfolio'] = this._portfolio.map((v) => v.toJson()).toList();
    }
    if (this._rank != null) {
      data['rank'] = this._rank.map((v) => v.toJson()).toList();
    }
    if (this._recommend != null) {
      data['recommend'] = this._recommend.map((v) => v.toJson()).toList();
    }
    if (this._trending != null) {
      data['trending'] = this._trending.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trending {
  String _createdAt;
  String _creatorName;
  String _description;
  String _iconUrl;
  int _id;
  bool _isDefault;
  String _name;
  String _size;
  int _stickerCount;
  int _stickerType;
  List<Stickers> _stickers;
  String _tabIconUrl;

  Trending(
      {String createdAt,
        String creatorName,
        String description,
        String iconUrl,
        int id,
        bool isDefault,
        String name,
        String size,
        int stickerCount,
        int stickerType,
        List<Stickers> stickers,
        String tabIconUrl}) {
    this._createdAt = createdAt;
    this._creatorName = creatorName;
    this._description = description;
    this._iconUrl = iconUrl;
    this._id = id;
    this._isDefault = isDefault;
    this._name = name;
    this._size = size;
    this._stickerCount = stickerCount;
    this._stickerType = stickerType;
    this._stickers = stickers;
    this._tabIconUrl = tabIconUrl;
  }

  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get creatorName => _creatorName;
  set creatorName(String creatorName) => _creatorName = creatorName;
  String get description => _description;
  set description(String description) => _description = description;
  String get iconUrl => _iconUrl;
  set iconUrl(String iconUrl) => _iconUrl = iconUrl;
  int get id => _id;
  set id(int id) => _id = id;
  bool get isDefault => _isDefault;
  set isDefault(bool isDefault) => _isDefault = isDefault;
  String get name => _name;
  set name(String name) => _name = name;
  String get size => _size;
  set size(String size) => _size = size;
  int get stickerCount => _stickerCount;
  set stickerCount(int stickerCount) => _stickerCount = stickerCount;
  int get stickerType => _stickerType;
  set stickerType(int stickerType) => _stickerType = stickerType;
  List<Stickers> get stickers => _stickers;
  set stickers(List<Stickers> stickers) => _stickers = stickers;
  String get tabIconUrl => _tabIconUrl;
  set tabIconUrl(String tabIconUrl) => _tabIconUrl = tabIconUrl;

  Trending.fromJson(Map<String, dynamic> json) {
    _createdAt = json['created_at'];
    _creatorName = json['creator_name'];
    _description = json['description'];
    _iconUrl = json['icon_url'];
    _id = json['id'];
    _isDefault = json['is_default'];
    _name = json['name'];
    _size = json['size'];
    _stickerCount = json['sticker_count'];
    _stickerType = json['sticker_type'];
    if (json['stickers'] != null) {
      _stickers = new List<Stickers>();
      json['stickers'].forEach((v) {
        _stickers.add(new Stickers.fromJson(v));
      });
    }
    _tabIconUrl = json['tab_icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this._createdAt;
    data['creator_name'] = this._creatorName;
    data['description'] = this._description;
    data['icon_url'] = this._iconUrl;
    data['id'] = this._id;
    data['is_default'] = this._isDefault;
    data['name'] = this._name;
    data['size'] = this._size;
    data['sticker_count'] = this._stickerCount;
    data['sticker_type'] = this._stickerType;
    if (this._stickers != null) {
      data['stickers'] = this._stickers.map((v) => v.toJson()).toList();
    }
    data['tab_icon_url'] = this._tabIconUrl;
    return data;
  }
}

class Portfolio {
  String _createdAt;
  String _creatorName;
  String _description;
  String _iconUrl;
  int _id;
  bool _isDefault;
  String _name;
  String _size;
  int _stickerCount;
  int _stickerType;
  List<Stickers> _stickers;
  String _tabIconUrl;

  Portfolio(
      {String createdAt,
        String creatorName,
        String description,
        String iconUrl,
        int id,
        bool isDefault,
        String name,
        String size,
        int stickerCount,
        int stickerType,
        List<Stickers> stickers,
        String tabIconUrl}) {
    this._createdAt = createdAt;
    this._creatorName = creatorName;
    this._description = description;
    this._iconUrl = iconUrl;
    this._id = id;
    this._isDefault = isDefault;
    this._name = name;
    this._size = size;
    this._stickerCount = stickerCount;
    this._stickerType = stickerType;
    this._stickers = stickers;
    this._tabIconUrl = tabIconUrl;
  }

  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get creatorName => _creatorName;
  set creatorName(String creatorName) => _creatorName = creatorName;
  String get description => _description;
  set description(String description) => _description = description;
  String get iconUrl => _iconUrl;
  set iconUrl(String iconUrl) => _iconUrl = iconUrl;
  int get id => _id;
  set id(int id) => _id = id;
  bool get isDefault => _isDefault;
  set isDefault(bool isDefault) => _isDefault = isDefault;
  String get name => _name;
  set name(String name) => _name = name;
  String get size => _size;
  set size(String size) => _size = size;
  int get stickerCount => _stickerCount;
  set stickerCount(int stickerCount) => _stickerCount = stickerCount;
  int get stickerType => _stickerType;
  set stickerType(int stickerType) => _stickerType = stickerType;
  List<Stickers> get stickers => _stickers;
  set stickers(List<Stickers> stickers) => _stickers = stickers;
  String get tabIconUrl => _tabIconUrl;
  set tabIconUrl(String tabIconUrl) => _tabIconUrl = tabIconUrl;

  Portfolio.fromJson(Map<String, dynamic> json) {
    _createdAt = json['created_at'];
    _creatorName = json['creator_name'];
    _description = json['description'];
    _iconUrl = json['icon_url'];
    _id = json['id'];
    _isDefault = json['is_default'];
    _name = json['name'];
    _size = json['size'];
    _stickerCount = json['sticker_count'];
    _stickerType = json['sticker_type'];
    if (json['stickers'] != null) {
      _stickers = new List<Stickers>();
      json['stickers'].forEach((v) {
        _stickers.add(new Stickers.fromJson(v));
      });
    }
    _tabIconUrl = json['tab_icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this._createdAt;
    data['creator_name'] = this._creatorName;
    data['description'] = this._description;
    data['icon_url'] = this._iconUrl;
    data['id'] = this._id;
    data['is_default'] = this._isDefault;
    data['name'] = this._name;
    data['size'] = this._size;
    data['sticker_count'] = this._stickerCount;
    data['sticker_type'] = this._stickerType;
    if (this._stickers != null) {
      data['stickers'] = this._stickers.map((v) => v.toJson()).toList();
    }
    data['tab_icon_url'] = this._tabIconUrl;
    return data;
  }
}

class Stickers {
  int _height;
  int _id;
  int _sort;
  String _url;
  int _width;

  Stickers({int height, int id, int sort, String url, int width}) {
    this._height = height;
    this._id = id;
    this._sort = sort;
    this._url = url;
    this._width = width;
  }

  int get height => _height;
  set height(int height) => _height = height;
  int get id => _id;
  set id(int id) => _id = id;
  int get sort => _sort;
  set sort(int sort) => _sort = sort;
  String get url => _url;
  set url(String url) => _url = url;
  int get width => _width;
  set width(int width) => _width = width;

  Stickers.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _id = json['id'];
    _sort = json['sort'];
    _url = json['url'];
    _width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['id'] = this._id;
    data['sort'] = this._sort;
    data['url'] = this._url;
    data['width'] = this._width;
    return data;
  }
}

class Rank {
  String _createdAt;
  String _creatorName;
  String _description;
  String _iconUrl;
  int _id;
  bool _isDefault;
  String _name;
  String _size;
  int _stickerCount;
  int _stickerType;
  List<Stickers> _stickers;
  String _tabIconUrl;

  Rank(
      {String createdAt,
        String creatorName,
        String description,
        String iconUrl,
        int id,
        bool isDefault,
        String name,
        String size,
        int stickerCount,
        int stickerType,
        List<Stickers> stickers,
        String tabIconUrl}) {
    this._createdAt = createdAt;
    this._creatorName = creatorName;
    this._description = description;
    this._iconUrl = iconUrl;
    this._id = id;
    this._isDefault = isDefault;
    this._name = name;
    this._size = size;
    this._stickerCount = stickerCount;
    this._stickerType = stickerType;
    this._stickers = stickers;
    this._tabIconUrl = tabIconUrl;
  }

  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get creatorName => _creatorName;
  set creatorName(String creatorName) => _creatorName = creatorName;
  String get description => _description;
  set description(String description) => _description = description;
  String get iconUrl => _iconUrl;
  set iconUrl(String iconUrl) => _iconUrl = iconUrl;
  int get id => _id;
  set id(int id) => _id = id;
  bool get isDefault => _isDefault;
  set isDefault(bool isDefault) => _isDefault = isDefault;
  String get name => _name;
  set name(String name) => _name = name;
  String get size => _size;
  set size(String size) => _size = size;
  int get stickerCount => _stickerCount;
  set stickerCount(int stickerCount) => _stickerCount = stickerCount;
  int get stickerType => _stickerType;
  set stickerType(int stickerType) => _stickerType = stickerType;
  List<Stickers> get stickers => _stickers;
  set stickers(List<Stickers> stickers) => _stickers = stickers;
  String get tabIconUrl => _tabIconUrl;
  set tabIconUrl(String tabIconUrl) => _tabIconUrl = tabIconUrl;

  Rank.fromJson(Map<String, dynamic> json) {
    _createdAt = json['created_at'];
    _creatorName = json['creator_name'];
    _description = json['description'];
    _iconUrl = json['icon_url'];
    _id = json['id'];
    _isDefault = json['is_default'];
    _name = json['name'];
    _size = json['size'];
    _stickerCount = json['sticker_count'];
    _stickerType = json['sticker_type'];
    if (json['stickers'] != null) {
      _stickers = new List<Stickers>();
      json['stickers'].forEach((v) {
        _stickers.add(new Stickers.fromJson(v));
      });
    }
    _tabIconUrl = json['tab_icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this._createdAt;
    data['creator_name'] = this._creatorName;
    data['description'] = this._description;
    data['icon_url'] = this._iconUrl;
    data['id'] = this._id;
    data['is_default'] = this._isDefault;
    data['name'] = this._name;
    data['size'] = this._size;
    data['sticker_count'] = this._stickerCount;
    data['sticker_type'] = this._stickerType;
    if (this._stickers != null) {
      data['stickers'] = this._stickers.map((v) => v.toJson()).toList();
    }
    data['tab_icon_url'] = this._tabIconUrl;
    return data;
  }
}

class Recommend {
  String _createdAt;
  String _creatorName;
  String _description;
  String _iconUrl;
  int _id;
  bool _isDefault;
  String _name;
  String _size;
  int _stickerCount;
  int _stickerType;
  List<Stickers> _stickers;
  String _tabIconUrl;

  Recommend(
      {String createdAt,
        String creatorName,
        String description,
        String iconUrl,
        int id,
        bool isDefault,
        String name,
        String size,
        int stickerCount,
        int stickerType,
        List<Stickers> stickers,
        String tabIconUrl}) {
    this._createdAt = createdAt;
    this._creatorName = creatorName;
    this._description = description;
    this._iconUrl = iconUrl;
    this._id = id;
    this._isDefault = isDefault;
    this._name = name;
    this._size = size;
    this._stickerCount = stickerCount;
    this._stickerType = stickerType;
    this._stickers = stickers;
    this._tabIconUrl = tabIconUrl;
  }

  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get creatorName => _creatorName;
  set creatorName(String creatorName) => _creatorName = creatorName;
  String get description => _description;
  set description(String description) => _description = description;
  String get iconUrl => _iconUrl;
  set iconUrl(String iconUrl) => _iconUrl = iconUrl;
  int get id => _id;
  set id(int id) => _id = id;
  bool get isDefault => _isDefault;
  set isDefault(bool isDefault) => _isDefault = isDefault;
  String get name => _name;
  set name(String name) => _name = name;
  String get size => _size;
  set size(String size) => _size = size;
  int get stickerCount => _stickerCount;
  set stickerCount(int stickerCount) => _stickerCount = stickerCount;
  int get stickerType => _stickerType;
  set stickerType(int stickerType) => _stickerType = stickerType;
  List<Stickers> get stickers => _stickers;
  set stickers(List<Stickers> stickers) => _stickers = stickers;
  String get tabIconUrl => _tabIconUrl;
  set tabIconUrl(String tabIconUrl) => _tabIconUrl = tabIconUrl;

  Recommend.fromJson(Map<String, dynamic> json) {
    _createdAt = json['created_at'];
    _creatorName = json['creator_name'];
    _description = json['description'];
    _iconUrl = json['icon_url'];
    _id = json['id'];
    _isDefault = json['is_default'];
    _name = json['name'];
    _size = json['size'];
    _stickerCount = json['sticker_count'];
    _stickerType = json['sticker_type'];
    if (json['stickers'] != null) {
      _stickers = new List<Stickers>();
      json['stickers'].forEach((v) {
        _stickers.add(new Stickers.fromJson(v));
      });
    }
    _tabIconUrl = json['tab_icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this._createdAt;
    data['creator_name'] = this._creatorName;
    data['description'] = this._description;
    data['icon_url'] = this._iconUrl;
    data['id'] = this._id;
    data['is_default'] = this._isDefault;
    data['name'] = this._name;
    data['size'] = this._size;
    data['sticker_count'] = this._stickerCount;
    data['sticker_type'] = this._stickerType;
    if (this._stickers != null) {
      data['stickers'] = this._stickers.map((v) => v.toJson()).toList();
    }
    data['tab_icon_url'] = this._tabIconUrl;
    return data;
  }
}