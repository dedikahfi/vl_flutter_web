class QuotaHf {
  String? stokReagenVlTcm;
  String? stokReagenVlAbbot;
  String? stokReagenVlRoche;
  String? stokReagenEidTcm;
  String? stokReagenEidAbbot;
  String? stokReagenEidRoche;
  String? stokLastUpdate;
  String? stokShared;
  String? stokKetersediaan;

  QuotaHf({
    this.stokReagenVlTcm,
    this.stokReagenVlAbbot,
    this.stokReagenEidTcm,
    this.stokReagenEidAbbot,
    this.stokLastUpdate,
  });

  QuotaHf.fromJson(json) {
    stokReagenVlTcm = json['stok_reagen_vl_tcm'].toString();
    stokReagenVlAbbot = json['stok_reagen_vl_abbot'].toString();
    stokReagenVlRoche = json['stok_reagen_vl_roche'].toString();
    stokReagenEidTcm = json['stok_reagen_eid_tcm'].toString();
    stokReagenEidAbbot = json['stok_reagen_eid_abbot'].toString();
    stokReagenEidRoche = json['stok_reagen_eid_roche'].toString();

    stokLastUpdate = json['stok_last_update'].toString();
    stokShared = json['stok_shared'].toString();
    stokKetersediaan = json['status_ketersediaan'].toString();
  }

  static List<QuotaHf> fromJsonList(List list) {
    return list.map((e) => QuotaHf.fromJson(e)).toList();
  }
}
