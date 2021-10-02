import 'package:just_space/model/isro_desc.dart';

class IsroInfo {
  final int position;
  final String name;
  final String description;
  final List<String> images;

  IsroInfo(
    this.position,
    {
      this.name,
      this.description,
      this.images,
    }
  );
}

List<IsroInfo> isroInfo = [
  IsroInfo(1,
      name: 'History of ISRO',
      description: desc1,
      images: [
        'https://i.pinimg.com/236x/08/db/d4/08dbd4d744f45dd7f566ab662cad7a7b.jpg',
        'https://i.pinimg.com/564x/6d/f6/4e/6df64e6ad706fe6c590015d14bc3bb07.jpg',
        'https://i.pinimg.com/236x/7b/e9/9f/7be99ff3e3f7550d03d871eb655c740d.jpg',
        'https://i.pinimg.com/236x/97/42/cd/9742cd41339cc92a64a2460cb359a8a8.jpg',
        'https://i.pinimg.com/236x/88/72/89/88728916310defefb9ae4302cac08466.jpg',
        'https://i.pinimg.com/236x/5e/85/bc/5e85bc6633e134c6db26b34d508c8eba.jpg',
  ]),
  IsroInfo(2,
      name: 'General satellite programmes',
      description: desc2,
      images: [
        'https://i.pinimg.com/236x/e5/a5/33/e5a5331734da0883045c93396aaec388.jpg',
            'https://i.pinimg.com/236x/a4/10/47/a4104759a8fcb50bb27aeac7b2dfc740.jpg',
            'https://i.pinimg.com/236x/7f/ff/ea/7fffea6ba06fb833a3400f0bb98b675f.jpg',
            'https://i.pinimg.com/236x/2e/ac/d2/2eacd22d3f2385186f50f1ccb5e19fb2.jpg',
            'https://i.pinimg.com/236x/4f/90/ed/4f90edc83c5e5b98d4e6135db5c6e285.jpg',
      ]),
  IsroInfo(3,
      name: 'Launch vehicles',
      description:
      desc3,
      images: [
        'https://i.pinimg.com/236x/ed/ed/ef/ededef9c3fb5965710006996ec65c217.jpg',
        'https://i.pinimg.com/236x/b6/16/c4/b616c4b9865b3ab80dd888abbf426166.jpg',
        'https://i.pinimg.com/236x/0b/88/9f/0b889ff4a90ecb05e2235de80ec97a54.jpg',
        'https://i.pinimg.com/236x/e2/88/3c/e2883c2d22bf151238fe6740716af2ad.jpg',
        'https://i.pinimg.com/236x/db/ad/7c/dbad7c3b34757702baaf146d06439ebe.jpg',
  ]),
  IsroInfo(4,
      name: 'Human Spaceflight Programme',
      description: desc4,
      images: [
        'https://i.pinimg.com/236x/45/86/ed/4586edf831c526b6b406f72a3d51ccf5.jpg',
        'https://i.pinimg.com/236x/f4/fb/a8/f4fba8e8a0c38a8dd1b052414111c5c2.jpg',
        'https://i.pinimg.com/236x/0c/9f/cd/0c9fcdaaed5773599c2a302cb1055d04.jpg',
        'https://i.pinimg.com/236x/d5/34/03/d534030658c2e54cc6a781837bfa250a.jpg',
        'https://i.pinimg.com/236x/3e/bf/fe/3ebffe23054954a66cad5750278ed29b.jpg',
  ]),
  IsroInfo(5,
      name: 'Planetary sciences and astronomy',
      description: desc5,
      images: [
        'https://i.pinimg.com/236x/2c/92/4b/2c924bc7d0c57d30ce6c611b960d6920.jpg',
        'https://i.pinimg.com/236x/fc/fc/e3/fcfce3df3fd765b3c8c4839fa75eb128.jpg',
        'https://i.pinimg.com/236x/bd/fc/db/bdfcdb1ad6072bb3a129e6ba38df8bd2.jpg',
        'https://i.pinimg.com/236x/4e/77/12/4e7712c67b715957d5a9ddc119db449a.jpg',
        'https://i.pinimg.com/236x/cc/c3/b7/ccc3b74521e8222df44cc5f7946bc0c7.jpg',
  ]),
  IsroInfo(6,
      name: 'Extraterrestrial exploration',
      description: desc6,
      images: [
        'https://i.pinimg.com/236x/47/76/05/4776051161ee2edf7ffde4fd8b31ef12.jpg',
        'https://i.pinimg.com/236x/e6/3e/4e/e63e4e65fad4d50b53f2033c020728f5.jpg',
        'https://i.pinimg.com/236x/1e/88/d5/1e88d5fad33c55602c664f9a512159b6.jpg',
        'https://i.pinimg.com/236x/b1/2e/7e/b12e7e69b86f41f374d43ccf0df53ee5.jpg',
        'https://i.pinimg.com/236x/c4/c6/78/c4c6787035026682d707e6c9d89f0438.jpg',
  ]),
  IsroInfo(7,
      name: 'Future projects',
      description: desc7,
      images: [
        'https://i.pinimg.com/236x/47/43/8c/47438c146d9cc13dbf49e407bfcb73ba.jpg',
        'https://i.pinimg.com/236x/75/0a/5b/750a5b4625853aaba4c85b9765b1a98d.jpg',
        'https://i.pinimg.com/236x/a3/38/a6/a338a6d0cec0ba9b7b089275b320adaa.jpg',
        'https://i.pinimg.com/236x/ef/a1/08/efa108a6670fbbc9f7f2c23c6e475e4f.jpg',
        'https://i.pinimg.com/236x/f4/3f/fc/f43ffc49b4f8e4b542899808e43ff9e5.jpg',
  ]),
];
