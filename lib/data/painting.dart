import 'package:meta/meta.dart';

class Painting {
  int id;
  String added;

  final String available;
  final String canvas;
  final String client;
  final String destination;
  final String dimensions;
  final String duration;
  final String exhibit;
  final String frame;
  final String images;
  final String mainImage;
  final String notes;
  final String packaging;
  final String paymentDate;
  final String retail;
  final String saleDate;
  final String salePrice;
  final String shippingCost;
  final String shippingDate;
  final String shippingMethod;
  final String startDate;
  final String status;
  final String title;
  final String tracking;

  Painting({
    this.id,
    this.added,
    this.available,
    this.canvas,
    this.client,
    this.destination,
    this.dimensions,
    this.duration,
    this.exhibit,
    this.frame,
    this.images,
    this.mainImage,
    this.notes,
    this.packaging,
    this.paymentDate,
    this.retail,
    this.saleDate,
    this.salePrice,
    this.shippingCost,
    this.shippingDate,
    this.shippingMethod,
    this.startDate,
    this.status,
    this.title,
    this.tracking,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'added': added,
      'available': available,
      'canvas': canvas,
      'client': client,
      'destination': destination,
      'dimensions': dimensions,
      'duration': duration,
      'exhibit': exhibit,
      'frame': frame,
      'images': images,
      'mainImage': mainImage,
      'notes': notes,
      'packaging': packaging,
      'paymentDate': paymentDate,
      'retail': retail,
      'saleDate': saleDate,
      'salePrice': salePrice,
      'shippingCost': shippingCost,
      'shippingDate': shippingDate,
      'shippingMethod': shippingMethod,
      'startDate': startDate,
      'status': status,
      'title': title,
      'tracking': tracking,
    };
  }

  static Painting fromMap(Map<String, dynamic> map) {
    return Painting(
      id: map['id'],
      added: map['added'],
      available: map['available'],
      canvas: map['canvas'],
      client: map['client'],
      destination: map['destination'],
      dimensions: map['dimensions'],
      duration: map['duration'],
      exhibit: map['exhibit'],
      frame: map['frame'],
      images: map['images'],
      mainImage: map['mainImage'],
      notes: map['notes'],
      packaging: map['packaging'],
      paymentDate: map['paymentDate'],
      retail: map['retail'],
      saleDate: map['saleDate'],
      salePrice: map['salePrice'],
      shippingCost: map['shippingCost'],
      shippingDate: map['shippingDate'],
      shippingMethod: map['shippingMethod'],
      startDate: map['startDate'],
      status: map['status'],
      title: map['title'],
      tracking: map['tracking'],
    );
  }
}
