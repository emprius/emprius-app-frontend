import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';


final toolImagesPhone = [
  '/data/user/0/com.example.empriusapp/cache/image_picker4192891788779617458.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker2314740962926778978.png',
  '/data/user/0/com.example.empriusapp/cache/image_picker2519909079312788563.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker5181464323563610078.jpg'
  // '/data/user/0/com.example.empriusapp/cache/image_picker4801801919904609723.jpg',
  // '/data/user/0/com.example.empriusapp/cache/image_picker8754154934436486707.jpg',
  // '/data/user/0/com.example.empriusapp/cache/image_picker5039266792256567929.jpg',
  // '/data/user/0/com.example.empriusapp/cache/image_picker6463638125453935552.jpg'
];
var sampleAvailability = [
  DateTimeRange(start: DateTime(2022, 08, 28), end: DateTime(2022, 09, 15)),
  DateTimeRange(start: DateTime.now().add(const Duration(days: 1)), end: DateTime.now().add(const Duration(days: 3))),
  DateTimeRange(start: DateTime.now().add(const Duration(days: 10)), end: DateTime.now().add(const Duration(days: 23))),
];
var sampleTools = [
  ToolModel(
      id: 6,
      userId: 1,
      isAvailable: true,
      title: "Bici de paseig",
      description: "No va be per a pujades fortes pero pots dur coses al cistell",
      maybeFree: true,
      askWithFee: true,
      toolCategory: ToolCategory.VEHICLE,
      transportOptions: TransportOptions.NOT_NECESSARY,
      cost: 10,
      rating: 5,
      images: toolImagesPhone,
      reservedDates: sampleAvailability,
      location: LatLng(41.765626, 2.407599)),
  ToolModel(
      id: 7,
      userId: 1,
      isAvailable: true,
      title: "Burra autonoma",
      description: "Sha fet servir per raves pero encara te molta potencia.",
      maybeFree: true,
      askWithFee: true,
      toolCategory: ToolCategory.ENERGY,
      transportOptions: TransportOptions.NECESSARY,
      cost: 10,
      rating: 5,
      images: toolImagesPhone,
      reservedDates: sampleAvailability,
      location: LatLng(41.692915, 2.540445)),
  ToolModel(
      id: 8,
      userId: 1,
      isAvailable: true,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.GARDENING,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: true,
      askWithFee: true,
      cost: 10,
      rating: 5,
      images: toolImagesPhone,
      reservedDates: sampleAvailability,
      location: LatLng(41.765964, 2.350709)),
  ToolModel(
      id: 9,
      userId: 1,
      isAvailable: false,
      title: "Rec automatic",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.GARDENING,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: true,
      askWithFee: true,
      cost: 10,
      rating: 5,
      images: toolImagesPhone,
      reservedDates: sampleAvailability,
      location: LatLng(41.647657, 2.469107)),
  ToolModel(
      id: 10,
      userId: 1,
      isAvailable: false,
      title: "Taladro",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.WOODWORK,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: false,
      askWithFee: true,
      cost: 10,
      rating: 5,
      images: toolImagesPhone,
      reservedDates: sampleAvailability,
      location: LatLng(41.738964, 2.498198)),
];