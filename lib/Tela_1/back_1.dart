import 'package:url_launcher/url_launcher.dart';

class back1 {
  final Uri _url =
      Uri.parse('https://www.linkedin.com/in/jose-jhonatan-silva-santos');
  final Uri _urlGit = Uri.parse('https://github.com/JhonSilva98/IMC_Conceito');

  Uri get url => _url;
  Uri get urlGit => _urlGit;

  Future<void> alaunchUrlGit() async {
    if (!await launchUrl(urlGit)) {
      throw Exception('Could not launch $urlGit');
    }
  }

  Future<void> alaunchUrl() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
