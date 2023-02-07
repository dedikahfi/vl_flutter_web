class District {
  String? districtId;
  String? districtCode;
  String? districtName;
  String? districtProvince;

  District.fromJson(json) {
    districtId = json['district_id'];
    districtCode = json['district_code'];
    districtName = json['district_name'];
    districtProvince = json['district_province'];
  }

  static List<District> fromJsonList(List list) {
    return list.map((e) => District.fromJson(e)).toList();
  }

  @override
  String toString() {
    return '$districtName';
  }
}
