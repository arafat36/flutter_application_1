import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/articles/article.dart';

class ArticlesItem extends StatelessWidget {
  const ArticlesItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Card(
        elevation: 3.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSection(article),
            _titleSection(article),
            _descriptionSection(article),
            _contentSection(article),
            _buttonbarSection()
          ],
        ),
      ),
    );
  }

  Widget _imageSection(Article article) => Ink.image(
        image: NetworkImage(article.imageUrl),
        height: 200,
        fit: BoxFit.cover,
        colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.darken),
      );

  Widget _sectionsPadding(Widget section) =>
      Padding(padding: const EdgeInsets.all(15.0), child: section);

  Widget _titleSection(Article article) => _sectionsPadding(Text(
        article.title,
        style: const TextStyle(fontSize: 18),
      ));

  Widget _descriptionSection(Article article) => _sectionsPadding(Text(
        article.description,
        style: const TextStyle(fontSize: 14),
      ));

  Widget _contentSection(Article article) => Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: ExpansionTile(
          title: const Text(
            "Read more",
            style: TextStyle(fontSize: 14.0),
          ),
          tilePadding: const EdgeInsets.only(top: 0, bottom: 0),
          children: [
            _sectionsPadding(Text(
              article.content,
              style: const TextStyle(fontSize: 14),
            ))
          ],
        ),
      );

  Widget _buildButton(String text, IconData icon) => TextButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0))),
        ),
        onPressed: () => (),
        icon: Icon(icon),
        label: Text(text),
      );

  Widget _buttonbarSection() => Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 16.0, 12.0),
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton("Share", Icons.share),
            _buildButton("Like", Icons.thumb_up),
            _buildButton("Comment", Icons.comment),
          ],
        ),
      );
}
