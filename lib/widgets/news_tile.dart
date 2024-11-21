import 'package:flutter/material.dart';
import 'package:news/models/news_tile_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.newsTileModel});
  final NewsTileModel newsTileModel;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  Uri url = Uri();

  @override
  void initState() {
    super.initState();
    url = Uri.parse(widget.newsTileModel.siteUrl);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchUrl();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.newsTileModel.newsImage == null
                  ? 'https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png'
                  : widget.newsTileModel.newsImage!.contains('webp')
                      ? 'https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png'
                      : widget.newsTileModel.newsImage!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.newsTileModel.newsHeadline ?? 'No Data',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.newsTileModel.newsInfo ?? 'No Data',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
