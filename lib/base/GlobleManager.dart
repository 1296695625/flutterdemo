class GlobleManager {
  static String BASEURL = "";

  static String GET_PORT = "18765";
  static String UPDATE_PORT = "18766";

  static final String URL_BUILD_0 = "http://192.168.68.75:8765/api/mobile";
  static final String URL_BUILD_1 =
      "http://127.0.0.1:" + GET_PORT + "/api/mobile";
  static final String URL_BUILD_3 =
      "http://127.0.0.1:" + GET_PORT + "/api/mobileZB";
  static final String URL_DEV_1 =
      "https://easy-mock.com/mock/5b07682d374bec38a648c39b/example";
  static final String URL_BUILD_4 = "http://192.168.68.198:9763";
  static final int DEV_DEBUG_MOD = 1; //0xwm测试服务器1开发模式2北京局 3总部 4.本地测试

  static final String APPTYPE = "01";

  static dynamic TQCX = "tqcx/";

  //异常监测
  static String YCJC = "ycjc/";

  //工单管理
  static String GDGL = "gdgl/";

  static var TOKEN = "";

  static var USERID = "";

  static String USERNAME = "";

  static var ORGID = "";

  static var urlMap = Map<String, dynamic>();

  static final String TXT_FILE_TYPE = "0"; //文本类型
  static final String IMAGE_FILE_TYPE = "1"; //图片类型
  static final String AUDIO_FILE_TYPE = "2"; //音频类型
  static final String VIDEO_IMAGE_FILE_TYPE = "3"; //视频缩略图类型
  static final String VIDEO_FILE_TYPE = "4"; //视频类型
  static final String NOT_UPLOADED_STATUS = "0"; //未上传
  static final String IS_UPLOADING_STATUS = "1"; //正在上传中
  static final String UPLOADED_SUCCESS_STATUS = "2"; //上传成功
  static final String UPLOAD_ERROR_STATUS = "3"; //上传失败

  static String getSPUrl(int type) {
    if (type == 3) {
      return "http://127.0.0.1:" + GET_PORT + "/api/mobileZB";
    } else {
      return "http://127.0.0.1:" + GET_PORT + "/api/mobileZB";
    }
  }

  static void iniURL() {
    if (DEV_DEBUG_MOD == 1) {
      BASEURL = URL_DEV_1;
    }
    if (DEV_DEBUG_MOD == 0) {
      String url = getSPUrl(DEV_DEBUG_MOD);
      if (url.isEmpty) {
        BASEURL = URL_BUILD_0;
      } else {
        BASEURL = url;
      }
    }
    if (DEV_DEBUG_MOD == 2) {
      String url = getSPUrl(DEV_DEBUG_MOD);
      if (url.isEmpty) {
        BASEURL = URL_BUILD_1;
      } else {
        BASEURL = url;
      }
    }
    if (DEV_DEBUG_MOD == 3) {
      String url = getSPUrl(DEV_DEBUG_MOD);
      if (url.isEmpty) {
        BASEURL = URL_BUILD_3;
      } else {
        BASEURL = url;
      }
    }
    if (DEV_DEBUG_MOD == 4) {
      BASEURL = URL_BUILD_4;
    }
    //台区查询
    urlMap["tqkb"] = "/tqkbinfo?";
    urlMap["tqkbmx"] = "/tqcx/tqkbmx?";
    urlMap["getsearchList"] = "/tqcx/getsearchList?";
    urlMap["getsearchQR"] = "/tqcx/getsearchQR?";
    urlMap["tquser"] = "/tqcx/tqkbuserList?";
    urlMap["tqbq"] = "/tqcx/tqkbbqnr?";
    urlMap["tqbqlist"] = "/tqcx/tqbqList?";
    urlMap["scbq"] = "/" + TQCX + "tqkbbqnr?";
    urlMap["getinfobygis"] = "/tqcx/getinfobygis?";
    urlMap["gettqinfo"] = "/tqcx/gettqinfo?";
    urlMap["thgx"] = "/tqcx/thgx?";
    urlMap["dyyhdlmx"] = "/tqcx/dyyhdlmx?";
    urlMap["lylgfx"] = "/tqcx/lylgfx?";
    urlMap["tqkbuserInfo"] = "/tqcx/tqkbuserInfo?";
    urlMap["scauserInfo"] = "/tqcx/scauserInfo?";
    //文件上传下载的接口
    urlMap["uploadfiles"] = "/tqcx/addLowPowerUserExceptionInfo?";
    urlMap["downfilesjson"] = "/tqcx/getLowPowerUserExceptionInfoList?";
    urlMap["deletefile"] = "/tqcx/delLowPowerUserExceptionInfo?";

    //异常监测
    urlMap["home"] = "/" + YCJC + "home?";
    urlMap["jclist"] = "/" + YCJC + "jclist?";
    urlMap["jcuserlist"] = "/" + YCJC + "jcuserlist?";
    urlMap["xttqlist"] = "/" + YCJC + "xttqlist?";
    urlMap["dltb"] = "/" + YCJC + "dltb?";
    urlMap["cjjcbd"] = "/" + YCJC + "cjjcbd?";
    urlMap["thgxyyxbyz"] = "/" + YCJC + "thgxyyxbyz?";
    urlMap["gfyhyc"] = "/" + YCJC + "gfyhyc?";
    urlMap["q3h3bhg"] = "/" + YCJC + "q3h3bhg?";
    //工单管理
    urlMap["gdhome"] = "/" + GDGL + "home?";
    urlMap["gdycinfo"] = "/" + GDGL + "gdycinfo?";
    urlMap["gduserqry"] = "/" + GDGL + "gduserqry?";
    urlMap["gdaddycd"] = "/" + GDGL + "gdaddycd?";
    urlMap["gddelycd"] = "/" + GDGL + "gddelycd?";
    urlMap["gdycdcheck"] = "/" + GDGL + "gdycdcheck?";
    urlMap["gdycdpost"] = "/" + GDGL + "gdycdpost?";
    urlMap["gdycddelete"] = "/" + GDGL + "gdycddelete?";
    urlMap["gdzpsc"] = "/" + GDGL + "gdzpsc?";
    urlMap["gdzpdel"] = "/" + GDGL + "gdzpdel?";
    //业绩看板
    urlMap["yejkhome"] = "/yjkb/home?";
    urlMap["glfwtqlist"] = "/yjkb/glfwtqlist?";
    urlMap["dttjtqlist"] = "/yjkb/glfwtqlist?";
    urlMap["zbinfo"] = "/yjkb/zbinfo?";
    urlMap["zbpm"] = "/yjkb/zbpm?";
    urlMap["yjkbtqListInfo"] = "/yjkb/yjkbtqListInfo?";
    urlMap["dblpmdz"] = "/yjkb/dblpmdz?";
    urlMap["dblpm"] = "/yjkb/dblpm?";
    urlMap["gzbxq"] = "/yjkb/gzbxq?";
    if (DEV_DEBUG_MOD == 1) {
      //开发模式，增加开发的url;
      urlMap["tqkbmx"] = "/" + TQCX + "tqkbmx0?";
      urlMap["tqkbxs"] = "/" + TQCX + "tqkbmx1?";
      urlMap["tqkbdl"] = "/" + TQCX + "tqkbmx2?";
      urlMap["tqkbgl"] = "/" + TQCX + "tqkbmx3?";
      urlMap["tqkbdliu"] = "/" + TQCX + "tqkbmx4?";
      urlMap["tqkbdy"] = "/" + TQCX + "tqkbmx5?";
    }
    urlMap["loginCheck"] = "/loginNew/queryUserInfoByLogincode?"; //用户信息校验及获取
    urlMap["userlogin"] = "/loginNew/userlogin?"; //用户登录
    urlMap["queryOrgInfo"] = "/loginNew/queryOrgInfo?"; //用户注册—单位选择
    urlMap["register"] = "/loginNew/register?"; //注册
    urlMap["queryppInfo"] = "/loginNew/queryppInfo?"; //验证手机号
    urlMap["forget"] = "/loginNew/updatePassword?"; //修改密码
    urlMap["chengeUserInfo"] = "/loginNew/chengeUserInfo?"; //修改个人中心
  }

  static String getUrls(String type) {
    iniURL();
    String url = "";
    url = urlMap[type];
    if (url.isNotEmpty) {
      return BASEURL + url;
    }
    return url;
  }
}
