class FileInfo {
  var id = 0; //表主键
  var uuid = ""; //uuid
  var ywid = ""; //业务id
  var ywlx = ""; //业务类型 0 工单；1 低压用户； 。。。
  var protype = ""; //问题类型
  var problem = ""; //问题名称
  var description = ""; //问题描述
  var filepath = ""; //附件路径
  var filename = ""; //附件名称
  var datetype = ""; //日期类型
  var searchdate = ""; //日期
  var createtime = ""; //创建文件的日期（手机上面的日期）
  var systemtime = ""; //系统时间（服务器端生成的）
  var filesize = ""; //文件大小 单位：KB
  var mediatype = ""; //文件类型   0文本类型 1图片类型 2音频类型 3视频缩略图类型 4视频类型
  var urlpath = ""; //文件的网络路径
  var savetype = ""; //文件上传的状态 0未上传；1正在上传；2上传成功；3上传失败；4只保存不上传
  var lat = ""; //纬度
  var lot = ""; //经度
  var locationname = ""; //位置名称
  var urlPara = ""; //需要拼接的url加上参数
  var ycdbh = ""; //异常点编号  针对工单处理中的异常点管理
  var chkbh = ""; //核查项编号  针对工单处理中的异常点管理

  var map = null;

  Map<String, dynamic> toMap() {
    map = new Map<String, dynamic>();
    List<String> keys = [
      "id",
      "uuid",
      "ywid",
      "ywlx",
      "protype",
      "problem",
      "description",
      "filepath",
      "filename",
      "datetype",
      "searchdate",
      "createtime",
      "systemtime",
      "filesize",
      "mediatype",
      "urlpath",
      "savetype",
      "lat",
      "lot",
      "locationname",
      "urlPara",
      "ycdbh",
      "chkbh"
    ];
    List<dynamic> values = [
      id,
      uuid,
      ywid,
      ywlx,
      protype,
      problem,
      description,
      filepath,
      filename,
      datetype,
      searchdate,
      createtime,
      systemtime,
      filesize,
      mediatype,
      urlpath,
      savetype,
      lat,
      lot,
      locationname,
      urlPara,
      ycdbh,
      chkbh
    ];
    return Map.fromIterables(keys, values);
  }
}
