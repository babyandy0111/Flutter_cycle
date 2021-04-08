import '../config.dart';
import 'package:oauth2_client/oauth2_client.dart';

class IndoChatOAuth2Client extends OAuth2Client {
  IndoChatOAuth2Client({String redirectUri, String customUriScheme}): super(
    authorizeUrl: INDOCHAT_ACCESS_URI,
    tokenUrl: INDOCHAT_TOKEN_URI,
    redirectUri: LOCAL_AUTH_URI,
    customUriScheme: CUSTOM_URI_SCHEME
  );
}