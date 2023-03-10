import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:take_one/helper/demo_values.dart';
import 'package:take_one/view/presentation/themes.dart';

bool _isLandscape(BuildContext context) =>
    MediaQuery
        .of(context)
        .orientation == Orientation.landscape;

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double aspectRatio = _isLandscape(context) ? 6 / 2 : 6 / 3;
    return GestureDetector(
        onTap:
            () {
              // TODO: Handle tapping
            },
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Card(
              elevation: 2,
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: Card(
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                        _Post(),
                        Divider(color: Colors.grey),
                        _PostDetails(),
                      ],
                    ),
                  ),
                ),
              )
          )
          ,
        );
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: <Widget>[_PostImage(), _PostTitleAndSummary()],
      ),
    );
  }
}

class _PostTitleAndSummary extends StatelessWidget {
  const _PostTitleAndSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleTheme = Theme
        .of(context)
        .textTheme
        .titleMedium;
    final TextStyle? summaryTheme = Theme
        .of(context)
        .textTheme
        .titleSmall;
    final String title = DemoValues.postTitle;
    final String summary = DemoValues.postSummary;

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(title, key: Key('postTitle'), style: titleTheme),
          SizedBox(height: 2.0),
          Text(summary, style: summaryTheme),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 2, child: Image.asset(DemoValues.postImage));
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[_UserImage(), _UserNameAndEmail(), _PostTimeStamp()],
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(DemoValues.userName),
            Text(DemoValues.userEmail),
          ],
        ),
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: CircleAvatar(
        backgroundImage: AssetImage(DemoValues.userImage),
      ),
    );
  }
}

class _PostTimeStamp extends StatelessWidget {
  const _PostTimeStamp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? timeTheme = Theme
        .of(context)
        .textTheme
        .titleSmall
        ?.copyWith(
      fontStyle: FontStyle.italic,
      color: Colors.grey,
    );
    return Expanded(
      flex: 2,
      child: Text(DemoValues.postTime, style: timeTheme),
    );
  }
}