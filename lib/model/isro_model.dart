import 'package:just_space/model/isro_desc.dart';

class IsroInfo {
  final int position;
  final String name;
  final String description;
  final List<String> images;

  IsroInfo(
      this.position, {
        this.name,
        this.description,
        this.images,
      });
}

List<IsroInfo> isroInfo = [
  IsroInfo(1,
      name: 'History of ISRO',
      description: desc1,
      images: [
        'https://cdn.pixabay.com/photo/2013/07/18/10/57/mercury-163610_1280.jpg',
        'https://cdn.pixabay.com/photo/2014/07/01/11/38/planet-381127_1280.jpg',
        'https://cdn.pixabay.com/photo/2015/06/26/18/48/mercury-822825_1280.png',
        'https://image.shutterstock.com/image-illustration/mercury-high-resolution-images-presents-600w-367615301.jpg'
      ]),
  IsroInfo(2,
      name: 'General satellite programmes',
      description: desc2,
      images: [
        'https://cdn.pixabay.com/photo/2011/12/13/14/39/venus-11022_1280.jpg',
        'https://image.shutterstock.com/image-photo/solar-system-venus-second-planet-600w-515581927.jpg'
      ]),
  IsroInfo(3,
      name: 'Launch vehicles',
      description:
      desc3,
      images: [
        'https://cdn.pixabay.com/photo/2011/12/13/14/31/earth-11015_1280.jpg',
        'https://cdn.pixabay.com/photo/2011/12/14/12/11/astronaut-11080_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/01/19/17/29/earth-1149733_1280.jpg',
        'https://image.shutterstock.com/image-photo/3d-render-planet-earth-viewed-600w-1069251782.jpg'
      ]),
  IsroInfo(4,
      name: 'Human Spaceflight Programme',
      description: desc4,
      images: []),
  IsroInfo(5,
      name: 'Planetary sciences and astronomy',
      description: desc5,
      images: []),
  IsroInfo(6,
      name: 'Extraterrestrial exploration',
      description: desc6,
      images: []),
  IsroInfo(7,
      name: 'Future projects',
      description:
      "The seventh planet from the sun, Uranus is an oddball. It has clouds made of hydrogen sulfide, the same chemical that makes rotten eggs smell so foul. It rotates from east to west like Venus. But unlike Venus or any other planet, its equator is nearly at right angles to its orbit — it basically orbits on its side. Astronomers believe an object twice the size of Earth collided with Uranus roughly 4 billion years ago, causing Uranus to tilt. That tilt causes extreme seasons that last 20-plus years, and the sun beats down on one pole or the other for 84 Earth-years at a time. ",
      images: []),
];
