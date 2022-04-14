import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/webview.dart';

Widget buildMainItem(map, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => WebviewScreen(url: '${map['url']}')));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${map['urlToImage']}'),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${map['title']}',
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${map['publishedAt']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget myDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      height: 1,
      color: Colors.grey,
    ),
  );
}

Widget buildCondition(list, {isSearch = false}) {
  return list.length > 0
      ? ListView.separated(
          itemBuilder: (context, i) => buildMainItem(list[i], context),
          separatorBuilder: (context, i) => myDivider(),
          itemCount: list.length)
      : isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(),
            );
}
