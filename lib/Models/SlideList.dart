import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Slide{

  final String imageUrl;
  final String title;
  final String  description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description
  });

}

final slideListIntro = [
  Slide(
      imageUrl: './Images/basura1.jpg',
      title: 'Nuevo León',
      description: 'Este es un tiradero ilegal a las afueras de nuestra gran ciudad de Monterrey'
  ),
  Slide(
      imageUrl: './Images/basura2.jpg',
      title: 'Problema',
      description: 'Los camiones de basura recogen los desechos de los hogares sin importancia en la separación de materiales.'
  ),
  Slide(
      imageUrl: './Images/basura3.jpg',
      title: 'Reci',
      description: 'App que ayuda a ubicar centros cercanos de reciclaje en la ciudad, permite a los usuarios crear y verificar sus propios centros de recolección, facilite logística de recolección de materiales reciclables.'
  ),
];

final slideListReciPunto = [
  Slide(
      imageUrl: './Images/cartonpapel.png',
      title: '¿Qué es un Recipunto?',
      description: 'Una casa, un negocio o un centro de reciclaje que recolecten materiales reciclables para procesarlos o mandar a procesar'
  ),
  Slide(
      imageUrl: './Images/greenmarker.png',
      title: 'Paso 2',
      description: 'aienoaie eiaoe eoi oaiehfoae ae fhaoiefoa eofh eofaneof oaeihfoaieoae'
  ),
  Slide(
      imageUrl: './Images/greenmarker.png',
      title: 'Paso 3',
      description: 'aienoaie eiaoe eoi oaiehfoae ae fhaoiefoa eofh eofaneof oaeihfoaieoae'
  ),
];






