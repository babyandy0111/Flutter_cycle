class ConfigEntity {
  int _status;
  DefaultUrl _defaultUrl;
  Aws _aws;
  String _aesKey;

  ConfigEntity({int status, DefaultUrl defaultUrl, Aws aws, String aesKey}) {
    this._status = status;
    this._defaultUrl = defaultUrl;
    this._aws = aws;
    this._aesKey = aesKey;
  }

  int get status => _status;
  set status(int status) => _status = status;
  DefaultUrl get defaultUrl => _defaultUrl;
  set defaultUrl(DefaultUrl defaultUrl) => _defaultUrl = defaultUrl;
  Aws get aws => _aws;
  set aws(Aws aws) => _aws = aws;
  String get aesKey => _aesKey;
  set aesKey(String aesKey) => _aesKey = aesKey;

  ConfigEntity.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _defaultUrl = json['default_url'] != null
        ? new DefaultUrl.fromJson(json['default_url'])
        : null;
    _aws = json['aws'] != null ? new Aws.fromJson(json['aws']) : null;
    _aesKey = json['aes_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._defaultUrl != null) {
      data['default_url'] = this._defaultUrl.toJson();
    }
    if (this._aws != null) {
      data['aws'] = this._aws.toJson();
    }
    data['aes_key'] = this._aesKey;
    return data;
  }
}

class DefaultUrl {
  String _group;
  String _user;

  DefaultUrl({String group, String user}) {
    this._group = group;
    this._user = user;
  }

  String get group => _group;
  set group(String group) => _group = group;
  String get user => _user;
  set user(String user) => _user = user;

  DefaultUrl.fromJson(Map<String, dynamic> json) {
    _group = json['group'];
    _user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group'] = this._group;
    data['user'] = this._user;
    return data;
  }
}

class Aws {
  String _s3AccessKey;
  String _s3SecretKey;

  Aws({String s3AccessKey, String s3SecretKey}) {
    this._s3AccessKey = s3AccessKey;
    this._s3SecretKey = s3SecretKey;
  }

  String get s3AccessKey => _s3AccessKey;
  set s3AccessKey(String s3AccessKey) => _s3AccessKey = s3AccessKey;
  String get s3SecretKey => _s3SecretKey;
  set s3SecretKey(String s3SecretKey) => _s3SecretKey = s3SecretKey;

  Aws.fromJson(Map<String, dynamic> json) {
    _s3AccessKey = json['s3_access_key'];
    _s3SecretKey = json['s3_secret_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s3_access_key'] = this._s3AccessKey;
    data['s3_secret_key'] = this._s3SecretKey;
    return data;
  }
}
