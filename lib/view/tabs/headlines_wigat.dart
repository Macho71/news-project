import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nuews/model/newes_model.dart';
import 'package:nuews/service/news_service.dart';

import '../../core/networ_error.dart';

class Headlines extends StatelessWidget {
  const Headlines({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewesService().headlines(),
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