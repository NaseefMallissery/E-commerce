class HomeCarousalModel {
    HomeCarousalModel({
        this.id,
        required this.image,
        required this.offer,
        this.v,
    });

    String? id;
    String image;
    String offer;
    int? v;

    factory HomeCarousalModel.fromJson(Map<String, dynamic> json) => HomeCarousalModel(
        id: json["_id"],
        image: json["image"],
        offer: json["offer"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "offer": offer,
        "__v": v,
    };
}
