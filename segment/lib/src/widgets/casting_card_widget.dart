import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:segment/src/models/models.dart';
import 'package:segment/src/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:segment/src/services/movies_service.dart';

class CastingCardWidget extends StatelessWidget {
  final int movieId;

  const CastingCardWidget({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesService = Provider.of<MoviesService>(context, listen: false);

    return FutureBuilder(
        future: moviesService.getMovieCast(movieId),
        builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              constraints: BoxConstraints(maxWidth: 150),
              height: 180,
              child: CupertinoActivityIndicator(),
            );
          }

          final List<Cast> cast = snapshot.data!;

          return Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => _CastCard(cast[index]),
            ),
          );
        });

    // ignore: sized_box_for_whitespace
    // return Container(
    //   width: double.infinity,
    //   height: 180,
    //   child: ListView.builder(
    //     itemCount: 10,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (_, int index) => _CastCard(),
    //   ),
    // );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            image: NetworkImage(actor.fullProfilePath),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(
          actor.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
