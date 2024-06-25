class PrivacyPolicyModelClass {
  List<Rows>? _rows;

  PrivacyPolicyModelClass({List<Rows>? rows}) {
    if (rows != null) {
      this._rows = rows;
    }
  }

  List<Rows>? get rows => _rows;
  set rows(List<Rows>? rows) => _rows = rows;

  PrivacyPolicyModelClass.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      _rows = <Rows>[];
      json['rows'].forEach((v) {
        _rows!.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._rows != null) {
      data['rows'] = this._rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? _code;
  String? _itemName;
  String? _itemValue;

  Rows({int? code, String? itemName, String? itemValue}) {
    if (code != null) {
      this._code = code;
    }
    if (itemName != null) {
      this._itemName = itemName;
    }
    if (itemValue != null) {
      this._itemValue = itemValue;
    }
  }

  int? get code => _code;
  set code(int? code) => _code = code;
  String? get itemName => _itemName;
  set itemName(String? itemName) => _itemName = itemName;
  String? get itemValue => _itemValue;
  set itemValue(String? itemValue) => _itemValue = itemValue;

  Rows.fromJson(Map<String, dynamic> json) {
    _code = json['Code'];
    _itemName = json['ItemName'];
    _itemValue = json['ItemValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this._code;
    data['ItemName'] = this._itemName;
    data['ItemValue'] = this._itemValue;
    return data;
  }
}
