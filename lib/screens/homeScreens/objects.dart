import 'dart:convert';

class charger {
  List<double> localization = [];
  int voltage = 0;
  String chargerType = "";
  String picture = "";
  String reference = "";
  String otherServices = "";
  bool occupied = true;
  bool active = true;
  String owner = "";

  charger(
      {this.localization,
      this.voltage,
      this.chargerType,
      this.picture,
      this.reference,
      this.otherServices,
      this.occupied,
      this.active,
      this.owner});

  factory charger.fromJson(Map<String, dynamic> json) {
    var jsonLocalization = json["local"] as List;
    return charger(
        localization:
            jsonLocalization != null ? List.from(jsonLocalization) : null,
        voltage: json["voltage"],
        chargerType: json["chargerType"],
        picture: json["picture"],
        reference: json["reference"],
        otherServices: json["otherServices"],
        occupied: json["occupied"],
        active: json["isActive"],
        owner: json["owner"]);
  }
}

charger tCharger = charger(
    active: true,
    localization: [9.854784, -83.907211],
    voltage: 5,
    chargerType: "simple",
    picture: "",
    reference: "hola",
    otherServices: "no hay",
    occupied: true,
    owner: "TEC");

charger t2Charger = charger(
    active: true,
    localization: [9.905794, -83.907223],
    voltage: 5,
    chargerType: "simple",
    picture: "",
    reference: "Escuela electro",
    otherServices: "no hay",
    occupied: true,
    owner: "TEC");

List<charger> testChargers = [tCharger, t2Charger];
