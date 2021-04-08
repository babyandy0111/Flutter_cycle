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

// TODO: 先 call dev api
// const IM_BASE_URL = 'https://api.indochat.net';
const IM_BASE_URL = 'https://api-development.indochat.net';
const STICKER_BASE_URL = 'https://sticker.indochat.net';
const TOKEN_BASE_URL = 'https://auth-api.indochat.net';
const MQTT_URL = 'mqx.indochat.net';
const RETRY_API_NUM = 2;
const RETRY_S = 5;

const APP_VERSION = '2.10.0';
const APP_LANG = 'en';

/// 全局配置
class Config {

}
