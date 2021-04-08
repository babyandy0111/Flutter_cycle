// 是否取用緩存
const CACHE_ENABLE = false;

// 緩存時間(秒)
const CACHE_MAXAGE = 1000;

// 最大緩存數
const CACHE_MAXCOUNT = 100;

// 是否啟用代理
const PROXY_ENABLE = false;
const PROXY_IP = '192.168.2.237';
const PROXY_PORT = 8888;

const HTTP_REQUEST_LOG = true;
const HTTP_REQUEST_HEADER_LOG = true;
const HTTP_REQUEST_BODY_LOG = true;

const HTTP_RESPONSE_HEADER_LOG = true;
const HTTP_RESPONSE_BODY_LOG = true;
const HTTP_ERROR_LOG = true;

const int CONNECT_TIMEOUT = 30000;
const int RECEIVE_TIMEOUT = 30000;

const IM_BASE_URL = 'https://api.indochat.net';
const STICKER_BASE_URL = 'https://sticker.indochat.net';
const TOKEN_BASE_URL = 'https://auth-api.indochat.net';
const MQTT_URL = 'mqx.indochat.net';
const RETRY_API_NUM = 2;
const RETRY_S = 5;

const APP_VERSION = '2.10.0';
const APP_LANG = 'en';

const INDOCHAT_OAUTH2_URI = 'https://oauth2-development.indochat.net';
const INDOCHAT_TOKEN_URI = '$INDOCHAT_OAUTH2_URI/oauth2/token';
const INDOCHAT_ACCESS_URI = '$INDOCHAT_OAUTH2_URI/oauth2/authorize';
const INDOCHAT_CLIENT_ID = 'indonewsdev';
const INDOCHAT_CLICLIENT_SECRET = '1C6B03B26D1BE5F39BD66D2B43A352827097E05B8080709D2846C3977526D923';
const INDOCHAT_CODE_VERIFIER = 's256exampleeasdfas';
const INDOCHAT_CODE_METHOD = 'S256';
const CUSTOM_URI_SCHEME = 'com.example.indochat_officialaccount';
const LOCAL_AUTH_URI = '$CUSTOM_URI_SCHEME://auth';

/// 全局配置
class Config {

}
