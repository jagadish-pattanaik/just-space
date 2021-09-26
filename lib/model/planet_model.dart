class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final double surfaceGravity;
  final List<String> images;

  PlanetInfo(
    this.position, {
    this.name,
    this.iconImage,
    this.description,
    this.surfaceGravity,
    this.images,
  });
}

List<PlanetInfo> planets = [
  PlanetInfo(1,
      name: 'Mercury',
      iconImage: 'assets/mercury.png',
      description:
          "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Day temperatures can reach a scorching 840  F (450 C), which is hot enough to melt lead. Meanwhile on the night side, temperatures drop to minus 290 F (minus 180 C).",
      surfaceGravity: 0.38,
      images: [
        'https://cdn.pixabay.com/photo/2013/07/18/10/57/mercury-163610_1280.jpg',
        'https://cdn.pixabay.com/photo/2014/07/01/11/38/planet-381127_1280.jpg',
            'https://cdn.pixabay.com/photo/2020/09/02/05/36/mercury-5537392__340.jpg',
            'https://cdn.pixabay.com/photo/2016/02/28/02/27/mercury-1226433__340.jpg',
            'https://cdn.pixabay.com/photo/2012/01/09/09/33/mercury-11591__340.png',
      ]),
  PlanetInfo(2,
      name: 'Venus',
      iconImage: 'assets/venus.png',
      description:
          "The second planet from the sun, Venus is Earth's twin in size. Radar images beneath its atmosphere reveal that its surface has various mountains and volcanoes. But beyond that, the two planets couldn't be more different. Because of its thick, toxic atmosphere that's made of sulfuric acid clouds, Venus is an extreme example of the greenhouse effect. It's scorching-hot, even hotter than Mercury. The average temperature on Venus' surface is 900 F (465 C). At 92 bar, the pressure at the surface would crush and kill you. And oddly, Venus spins slowly from east to west, the opposite direction of most of the other planets.",
      surfaceGravity: 0.91,
      images: [
        'https://cdn.pixabay.com/photo/2011/12/13/14/39/venus-11022_1280.jpg',
            'https://cdn.pixabay.com/photo/2020/09/08/23/58/venus-5556107__340.jpg',
            'https://cdn.pixabay.com/photo/2012/01/09/09/22/venus-11587__340.jpg',
            'https://cdn.pixabay.com/photo/2012/01/09/09/24/venus-11588__340.png',
            'https://cdn.pixabay.com/photo/2011/12/13/18/28/planet-11060__340.jpg',
      ]),
  PlanetInfo(3,
      name: 'Earth',
      iconImage: 'assets/earth.png',
      description:
          "The third planet from the sun, Earth is a waterworld, with two-thirds of the planet covered by ocean. It's the only world known to harbor life. Earth's atmosphere is rich in nitrogen and oxygen. Earth's surface rotates about its axis at 1,532 feet per second (467 meters per second) — slightly more than 1,000 mph (1,600 kph) — at the equator. The planet zips around the sun at more than 18 miles per second (29 km per second).",
      surfaceGravity: 1,
      images: [
        'https://cdn.pixabay.com/photo/2011/12/13/14/31/earth-11015_1280.jpg',
        'https://cdn.pixabay.com/photo/2011/12/14/12/11/astronaut-11080_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/01/19/17/29/earth-1149733_1280.jpg',
            'https://cdn.pixabay.com/photo/2016/10/20/18/35/earth-1756274__480.jpg',
            'https://cdn.pixabay.com/photo/2016/01/19/17/29/earth-1149733__340.jpg',
      ]),
  PlanetInfo(4,
      name: 'Mars',
      iconImage: 'assets/mars.png',
      description:
          "The fourth planet from the sun is Mars, and it's a cold, desert-like place covered in dust. This dust is made of iron oxides, giving the planet its iconic red hue. Mars shares similarities with Earth: It is rocky, has mountains, valleys and canyons, and storm systems ranging from localized tornado-like dust devils to planet-engulfing dust storms. ",
      surfaceGravity: 0.38,
      images: [
        'https://cdn.pixabay.com/photo/2011/12/13/14/30/mars-11012__340.jpg',
            'https://cdn.pixabay.com/photo/2012/11/28/09/08/mars-67522__340.jpg',
            'https://cdn.pixabay.com/photo/2017/02/09/12/02/mars-2051747__340.png',
            'https://cdn.pixabay.com/photo/2012/01/09/10/21/mars-11608__340.jpg',
            'https://cdn.pixabay.com/photo/2017/02/09/12/02/mars-2051748__340.png',
      ]),
  PlanetInfo(5,
      name: 'Jupiter',
      iconImage: 'assets/jupiter.png',
      description:
          "The fifth planet from the sun, Jupiter is a giant gas world that is the most massive planet in our solar system — more than twice as massive as all the other planets combined, according to NASA. Its swirling clouds are colorful due to different types of trace gases. And a major feature in its swirling clouds is the Great Red Spot, a giant storm more than 10,000 miles wide. It has raged at more than 400 mph for the last 150 years, at least. Jupiter has a strong magnetic field, and with 75 moons, it looks a bit like a miniature solar system.",
      surfaceGravity: 2.53,
      images: [
        'https://cdn.pixabay.com/photo/2017/09/21/20/58/io-2773533__340.jpg',
            'https://cdn.pixabay.com/photo/2020/02/22/08/15/space-4869815__340.jpg',
            'https://cdn.pixabay.com/photo/2012/01/09/10/42/jupiter-11618__340.jpg',
            'https://cdn.pixabay.com/photo/2016/07/16/19/36/space-probe-1522546__340.jpg',
            'https://cdn.pixabay.com/photo/2021/09/03/06/33/jupiter-6595135__340.jpg',
      ]),
  PlanetInfo(6,
      name: 'Saturn',
      iconImage: 'assets/saturn.png',
      description:
          "The sixth planet from the sun, Saturn is known most for its rings. When polymath Galileo Galilei first studied Saturn in the early 1600s, he thought it was an object with three parts: a planet and two large moons on either side. Not knowing he was seeing a planet with rings, the stumped astronomer entered a small drawing — a symbol with one large circle and two smaller ones — in his notebook, as a noun in a sentence describing his discovery. More than 40 years later, Christiaan Huygens proposed that they were rings. The rings are made of ice and rock and scientists are not yet sure how they formed. The gaseous planet is mostly hydrogen and helium and has numerous moons.",
      surfaceGravity: 1.07,
      images: [
        'https://cdn.pixabay.com/photo/2012/11/28/10/54/planet-67672__340.jpg',
            'https://cdn.pixabay.com/photo/2012/11/28/10/54/saturn-67671__340.jpg',
            'https://cdn.pixabay.com/photo/2021/09/03/06/33/saturn-6595132__340.jpg',
            'https://cdn.pixabay.com/photo/2019/07/03/12/14/saturn-4314403__340.png',
            'https://cdn.pixabay.com/photo/2015/04/12/19/18/saturn-719332__340.png',
      ]),
  PlanetInfo(7,
      name: 'Uranus',
      iconImage: 'assets/uranus.png',
      description:
          "The seventh planet from the sun, Uranus is an oddball. It has clouds made of hydrogen sulfide, the same chemical that makes rotten eggs smell so foul. It rotates from east to west like Venus. But unlike Venus or any other planet, its equator is nearly at right angles to its orbit — it basically orbits on its side. Astronomers believe an object twice the size of Earth collided with Uranus roughly 4 billion years ago, causing Uranus to tilt. That tilt causes extreme seasons that last 20-plus years, and the sun beats down on one pole or the other for 84 Earth-years at a time. ",
      surfaceGravity: 0.89,
      images: [
        'https://cdn.pixabay.com/photo/2012/01/09/10/56/uranus-11625__340.jpg',
            'https://cdn.pixabay.com/photo/2020/09/10/01/58/uranus-5559037__340.jpg',
            'https://cdn.pixabay.com/photo/2012/01/09/10/56/uranus-11626__340.jpg',
            'https://cdn.pixabay.com/photo/2021/03/02/17/58/uranus-6063396__340.jpg',
            'https://cdn.pixabay.com/photo/2013/07/12/18/36/uranus-153572__340.png',
      ]),
  PlanetInfo(8,
      name: 'Neptune',
      iconImage: 'assets/neptune.png',
      description:
          "The eighth planet from the sun, Neptune is about the size of Uranus and is known for supersonic strong winds. Neptune is far out and cold. The planet is more than 30 times as far from the sun as Earth. Neptune was the first planet predicted to exist by using math, before it was visually detected. Irregularities in the orbit of Uranus led French astronomer Alexis Bouvard to suggest some other planet might be exerting a gravitational tug. German astronomer Johann Galle used calculations to help find Neptune in a telescope. Neptune is about 17 times as massive as Earth and has a rocky core.",
      surfaceGravity: 1.14,
      images: [
        'https://cdn.pixabay.com/photo/2012/11/28/09/17/neptune-67537__340.jpg',
        'https://cdn.pixabay.com/photo/2012/01/09/11/02/neptune-11629__340.jpg',
        'https://cdn.pixabay.com/photo/2020/09/13/17/38/neptune-5568916__340.png',
        'https://cdn.pixabay.com/photo/2019/11/26/13/34/neptune-4654560__340.jpg',
        'https://cdn.pixabay.com/photo/2012/01/09/11/04/neptune-11630__340.jpg',
      ]),
];
