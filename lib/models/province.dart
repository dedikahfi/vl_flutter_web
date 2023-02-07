class Province {
  String? provinceId;
  String? provinceCode;
  String? provinceName;

  Province({this.provinceId, this.provinceName, this.provinceCode});

  Province.fromJson(json) {
    provinceId = json['province_id'];
    provinceCode = json['province_code'];
    provinceName = json['province_name'];
  }

  static fromJsonList(List list) {
    return list.map((e) => Province.fromJson(e)).toList();
  }

  sortList(List<Province> list) {
    return list.sort(((a, b) => a.provinceName!.compareTo(b.provinceName!)));
  }

  @override
  String toString() {
    return '$provinceName';
  }
}
