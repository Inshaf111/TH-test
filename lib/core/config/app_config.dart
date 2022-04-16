const _baseUrl = "baseUrl";
enum Environment { mock, stage, prod, qa }
Map<String, dynamic> _config = {};

void setEnvironment(Environment env) {
  switch (env) {
    case Environment.mock:
      _config = mockConstants;
      break;
    case Environment.stage:
      _config = stageConstants;
      break;
    case Environment.prod:
      _config = prodConstants;
      break;
    case Environment.qa:
      _config = qaConstant;
      break;
  }
}

String get apiBaseUrl {
  return _config[_baseUrl];
}

Map<String, dynamic> mockConstants = {
  _baseUrl: "http://restapi.adequateshop.com/api/",
};

Map<String, dynamic> stageConstants = {
  _baseUrl: "",
};

Map<String, dynamic> prodConstants = {
  _baseUrl: "",
};
Map<String, dynamic> qaConstant = {
  _baseUrl: "",
};
