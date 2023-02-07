class Accordion {
  String title;
  String body;
  bool isExpanded;
  Accordion(this.title, this.body, [this.isExpanded = false]);
}

List<Accordion> getFaq() {
  return [
    Accordion('Apa itu pemeriksaan Viral Load (VL)?',
        'Pemeriksaan Viral load (VL) adalah pemeriksaan yang dilakukan untuk mengetahui jumlah virus di dalam darah orang dengan HIV atau AIDS.'),
    Accordion('Bagaimana tahapan pemeriksaan VL gratis? ',
        '1. Silahkan ODHIV datang ke fasilitas layanan kesehatan tempat pengambilan obat ARV. \n2. Dokter akan memberikan formulir permintaan pemeriksaan VL. \n3. ODHIV akan diarahkan menuju ruang laboratorium untuk dilakukan pengambilan sampel darah. \n4. Setelah proses pengambilan sampel darah selesai, ODHIV akan diperbolehkan pulang. \n5. Jika pemeriksaan lab telah selesai, dokter akan menginformasikan hasil pemeriksaan VL pada kunjungan rutin berikutnya atau menghubungi lebih awal apabila diperlukan. '),
    Accordion('Apakah saya bisa memeriksakan diri di luar tempat saya berobat',
        'Bisa, namun sangat dianjurkan untuk dilakukan di tempat berobat ARV. Jika pemeriksaan dilakukan di luar tempat berobat karena ada kendala seperti jarak, maka pemeriksaan di tempat lain harus menggunakan surat rujukan dari fasyankes tempat asal berobat ARV ke fasyankes tempat pengambilan sampel terdekat. Dan sebaiknya berkoordinasi dulu dengan fasyankes asal berobat agar petugas fasyankes asal berobat ARV dapat menginformasikan terlebih dahulu ke fasyankes rujukan tersebut.'),
  ];
}

List<Accordion> getFaq2() {
  return [
    Accordion('Apa itu pemeriksaan Viral Load (VL)?',
        'Pemeriksaan Viral load (VL) adalah pemeriksaan yang dilakukan untuk mengetahui jumlah virus di dalam darah orang dengan HIV atau AIDS.'),
    Accordion('Bagaimana tahapan pemeriksaan VL gratis? ',
        '1. Silahkan ODHIV datang ke fasilitas layanan kesehatan tempat pengambilan obat ARV. \n2. Dokter akan memberikan formulir permintaan pemeriksaan VL. \n3. ODHIV akan diarahkan menuju ruang laboratorium untuk dilakukan pengambilan sampel darah. \n4. Setelah proses pengambilan sampel darah selesai, ODHIV akan diperbolehkan pulang. \n5. Jika pemeriksaan lab telah selesai, dokter akan menginformasikan hasil pemeriksaan VL pada kunjungan rutin berikutnya atau menghubungi lebih awal apabila diperlukan. '),
    Accordion('Apakah saya bisa memeriksakan diri di luar tempat saya berobat',
        'Bisa, namun sangat dianjurkan untuk dilakukan di tempat berobat ARV. Jika pemeriksaan dilakukan di luar tempat berobat karena ada kendala seperti jarak, maka pemeriksaan di tempat lain harus menggunakan surat rujukan dari fasyankes tempat asal berobat ARV ke fasyankes tempat pengambilan sampel terdekat. Dan sebaiknya berkoordinasi dulu dengan fasyankes asal berobat agar petugas fasyankes asal berobat ARV dapat menginformasikan terlebih dahulu ke fasyankes rujukan tersebut.'),
    Accordion('Kapan pemeriksaan VL dapat dilakukan?',
        '1. Pemeriksaan VL dilakukan pada ODHIV setelah 6 bulan atau 12 bulan pertama, 24 bulan dan seterusnya setiap tahun sekali. \n2. Adanya kecurigaan resistensi pengobatan ARV.  \n3. Monitoring pada ibu hamil ODHIV untuk memilih persalinan. '),
    Accordion('Bagaimana memahami hasil pemeriksaan VL?',
        'Hasil pemeriksaan VL yang berkisar kurang dari atau sama dengan (≤) 50 kopi virus per ML darah adalah kategori viral load “tidak terdeteksi”. Viral load tidak terdeteksi berarti pengobatan ARV efektif dan menurunkan risiko penularan HIV. '),
    Accordion('Bagaimana jika hasil VL tidak terdeteksi?',
        'Meskipun jumlah virus HIV = (≤) 50 kopi virus per ML, ODHIV harus tetap minum obat ARV secara rutin untuk mempertahankan keberhasilan pengobatan. '),
  ];
}
