import 'package:event_bus/event_bus.dart';

class Constants {

  static final String REDIRECT_URL = "http://yubo725.top/osc/osc.php";

  static final String LOGIN_URL = "https://www.oschina.net/action/oauth2/authorize?client_id=4rWcDXCNTV5gMWxtagxI&response_type=code&redirect_uri=" + REDIRECT_URL;

  static final String OSC_CLIENT_ID = "4rWcDXCNTV5gMWxtagxI";

  static final String END_LINE_TAG = "COMPLETE";

  static final String BASEURL="https://easy-mock.com/mock/5b07682d374bec38a648c39b/example";

  static final String YEJIKANBAN="/line/yjkb/glfwxllist?";

  static EventBus eventBus = new EventBus();
}