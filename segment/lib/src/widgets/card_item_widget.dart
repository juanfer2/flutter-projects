import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:segment/src/models/models.dart';

class CardItemWidget extends StatelessWidget {
  final List<Movie> movies;
  const CardItemWidget({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height * 0.5;

    return Container(
        width: double.infinity,
        height: height,
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final movie = movies[index];

            return GestureDetector(
              onTap: (() => {
                    Navigator.pushNamed(context, 'movie/details',
                        arguments: movie)
                  }),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  image: NetworkImage(movie.fullPosterImg ??
                      'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  fadeInDuration: Duration(milliseconds: 200),
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ));
  }
}
