class HomePichartModel {
  List<String>? _plist;
  List<String>? _clist;
  List<String>? _lglist;

  HomePichartModel(
      {List<String>? plist, List<String>? clist, List<String>? lglist}) {
    if (plist != null) {
      this._plist = plist;
    }
    if (clist != null) {
      this._clist = clist;
    }
    if (lglist != null) {
      this._lglist = lglist;
    }
  }

  List<String>? get plist => _plist;
  set plist(List<String>? plist) => _plist = plist;
  List<String>? get clist => _clist;
  set clist(List<String>? clist) => _clist = clist;
  List<String>? get lglist => _lglist;
  set lglist(List<String>? lglist) => _lglist = lglist;

  HomePichartModel.fromJson(Map<String, dynamic> json) {
    _plist = json['plist'].cast<String>();
    _clist = json['clist'].cast<String>();
    _lglist = json['lglist'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plist'] = this._plist;
    data['clist'] = this._clist;
    data['lglist'] = this._lglist;
    return data;
  }
}
