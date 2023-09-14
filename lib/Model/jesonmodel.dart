class jsonmodel {
  String Name;
  String details;
  String distancefromsun;
  String length;
  String planettype;
  String Image;

  jsonmodel(
      {required this.Name,
      required this.details,
      required this.distancefromsun,
      required this.length,
      required this.planettype,
      required this.Image});
  factory jsonmodel.js({required Map data}) {
    return jsonmodel(
        Name: data['Name'],
        details: data['details'],
        distancefromsun: data['distancefromsun'],
        length: data['length'],
        planettype: data['planettype'],
        Image: data['Image']);
  }
}
