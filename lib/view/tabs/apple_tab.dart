import 'package:flutter/material.dart';
import 'package:nuews/core/networ_error.dart';
import 'package:nuews/core/networ_error.dart';

import 'package:nuews/model/newes_model.dart';
import 'package:nuews/service/news_service.dart';

class AppleWiget extends StatelessWidget {
  const AppleWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewesService().getApple(),
      builder: ((context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snapshot.data is NetworOrHttpError) {
          return Center(
              child: Text((snapshot.data as NetworOrHttpError).networkError));
        } else {
          SuccessResponse<NewseModel> data =
              (snapshot.data as SuccessResponse<NewseModel>);
          return ListView.builder(
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Image.network(data.model!.articles![index].urlToImage.toString()),
                  Text(data.model!.articles![index].content.toString())
                ],
              );
            }),
            itemCount: data.model!.articles!.length,
          );
        }
      }),
    );
  }
}
