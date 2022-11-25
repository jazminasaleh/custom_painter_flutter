import 'package:diseno/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlidesShowPages extends StatelessWidget {
  const SlidesShowPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 168, 226, 230),
      body: Column(
        children: [
          Expanded(
            child: SlidesShow(
            puntosArriba: false,
            slides: [
               SvgPicture.asset( 'assets/slide-1.svg'),
               SvgPicture.asset( 'assets/slide-2.svg'),
               SvgPicture.asset( 'assets/slide-3.svg'),
               SvgPicture.asset( 'assets/slide-4.svg'),
            ], colorPrimario: Colors.blueAccent,
            colorSecundario: Colors.grey, 
            builtPrimario: 17, 
            builtSecundario: 12, 
                  
                  ),
          ),
           Expanded(
            child: SlidesShow(
            puntosArriba: false,
            slides: [
              
              ClipRRect( 
                 borderRadius: BorderRadius.circular(30),
                child: Image(image: NetworkImage('https://s3.amazonaws.com/imagenesprof.fincaraiz.com.co/OVFR_COL/2022/7/5/3765719_607_3.jpg'), )
              ),
               ClipRRect( 
                 borderRadius: BorderRadius.circular(30),
                child: Image(image: NetworkImage('https://http2.mlstatic.com/D_NQ_NP_842741-MCO52519666548_112022-O.webp')),
              ),
               ClipRRect( 
                 borderRadius: BorderRadius.circular(30),
                child: Image(image: NetworkImage('https://http2.mlstatic.com/D_NQ_NP_723266-MCO51247287384_082022-W.webp')),
               ),
                ClipRRect( 
                 borderRadius: BorderRadius.circular(30),
                child: Image(image: NetworkImage('https://http2.mlstatic.com/D_NQ_NP_950967-MCO49785248065_042022-W.webp')),
                ),
                 ClipRRect( 
                 borderRadius: BorderRadius.circular(30),
                child:Image(image: NetworkImage('https://http2.mlstatic.com/D_858455-MCO51247287385_082022-O.jpg')),
                 ),
                  ClipRRect( 
                 borderRadius: BorderRadius.circular(30),
                child: Image(image: NetworkImage('https://s3.amazonaws.com/imagenesprof.fincaraiz.com.co/OVFR_COL/2022/7/5/3765719_607_3.jpg')),
                  )
            ], colorPrimario: Colors.blueAccent,
            colorSecundario: Colors.grey, 
            builtPrimario: 17, 
            builtSecundario: 12, 
                  
                  ),
          ),
        ]
      )
    );
  }
}
