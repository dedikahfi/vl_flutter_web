class HealthFacilities {
  String? healthFacilitiesId;
  String? healthFacilitiesCode;
  String? healthFacilitiesProvince;
  String? healthFacilitiesDistrict;
  String? healthFacilitiesType;
  String? healthFacilitiesName;
  String? healthFacilitiesRef;
  String? healthFacilitiesTreatment;
  String? healthFacilitiesEid;

  HealthFacilities.fromJson(json) {
    healthFacilitiesId = json['hfid'];
    healthFacilitiesCode = json['hf_code'];
    healthFacilitiesProvince = json['hf_province'];
    healthFacilitiesDistrict = json['hf_district'];
    healthFacilitiesType = json['hf_type'];
    healthFacilitiesName = json['hf_name'];
    healthFacilitiesRef = json['hf_referral'];
    healthFacilitiesTreatment = json['hf_treatment'];
    healthFacilitiesEid = json['hf_eid'];
  }

  static List<HealthFacilities> fromJsonList(List list) {
    return list.map((e) => HealthFacilities.fromJson(e)).toList();
  }

  @override
  String toString() {
    return '$healthFacilitiesName';
  }
}
