<?php
function restSuccess($message = "Success", $result = [], $code = 200)
{
    $arr = [
        "status" => true,
        "status_code" => $code,
        "message" => $message,
    ];
    if (!empty($result)) {
        $arr["result"] = $result;
    }
    return response()->json($arr, $code);
}

function restFail($message = "Error", $code = 422, $errors = [])
{
    $arr = [
        "status" => false,
        "status_code" => $code,
        "message" => $message
    ];
    if (!empty($errors)) {
        $arr["errors"] = $errors;
    }
    return response()->json($arr, $code);
}

function randStrGen($len = 7)
{
    $result = "";
    $chars = "1QAZXSW23EDCVFR45TGBNHY67UJMKI89OLP0";
    $charArray = str_split($chars);
    for ($i = 0; $i < $len; $i++) {
        $randItem = array_rand($charArray);
        $result .= "" . $charArray[$randItem];
    }
    return $result;
}

function Date2String($inputDate, $formatOut = 'd/m/Y')
{
    return \Carbon\Carbon::parse($inputDate)->format($formatOut);
}

function assetStorage($path, $type = "full", $multi = false, $key = "medium")
{
    if (empty($path)) {
        return null;
    }
    if ($type === "storage" || $type === "full") {
        $path = "/storage/{$path}";
    }
    if ($type === "full") {
        $path = asset($path);
    }
    if ($multi) {
        $arr = explode("/", $path);

        $file_name = $arr[count($arr) - 1];
        unset($arr[count($arr) - 1]);

        $new_path = implode("/", $arr);

        $arr_path = [
            "small" => $new_path . "/small/" . $file_name,
            "medium" => $new_path . "/medium/" . $file_name,
            "large" => $new_path . "/large/" . $file_name,
            "full" => $new_path . "/" . $file_name,
        ];

        if ($key && !empty($arr_path[$key])) {
            return $arr_path[$key];
        }
        return $arr_path;
    }

    return $path;
}

function currentPageMenu($url, $class = "active")
{
    if (!is_array($url)) {
        $check = request()->is($url);
        return $check ? $class : "";
    } else {
        foreach ($url as $key => $value) {
            if (request()->is($value)) {
                return $class;
            }
        }
    }
    return "";
}

//---------add class curent-communication-------
function isCurrentPageComunicate($url, $class = "current")
{
    $url = array(
        'communication',
        'communication/*',
        'truyen-thong/*'
    );

    if (!is_array($url)) {
        $check = request()->is($url);
        return $check ? $class : "";
    } else {
        foreach ($url as $key => $value) {
            if (request()->is($value)) {
                return $class;
            }
        }
    }
    return "";
}

//---------add class curent-about-------
function isCurrentPageAbout($url, $class = "current")
{
    $url = array(
        'gioi-thieu-chung',
        'cac-co-dong',
        'cac-giai-doan-phat-trien',
        'co-cau-to-chuc',
        'giai-thuong-va-danh-hieu',
        'achievements',
        'organizational-structure',
        'history-and-development',
        'shareholders',
        'overview'
    );
    if (!is_array($url)) {
        $check = request()->is($url);
        return $check ? $class : "";
    } else {
        foreach ($url as $key => $value) {
            if (request()->is($value)) {
                return $class;
            }
        }
    }
    return "";
}

//---------add class current products-------
function isCurrentPageProuduct($url, $class = "current")
{
    $url = array(
        'san-pham', 'san-pham/*',
        'products', 'products/*'
    );

    if (!is_array($url)) {
        $check = request()->is($url);
        return $check ? $class : "";
    } else {
        foreach ($url as $key => $value) {
            if (request()->is($value)) {
                return $class;
            }
        }
    }
    return "";
}

//---------add class curent-tu-van-dau-tu-------
function isCurrentPageCounsulting($url, $class = "current")
{
    $url = array(
        'tu-van-dau-tu', 'consulting',
        'uu-dai-dau-tu', 'investment-incentives',
        'dich-vu-mot-cua', 'service-one-gate',
        'thu-tuc-truoc-dau-tu', 'before-investment',
        'thu-tuc-sau-dau-tu', 'after-investment',
        'tai-lieu-tu-van', 'consultancy-materials',
        'quy-dinh-quy-che', 'regulations',
        'cap-nhat-tai-lieu-phap-ly', 'legal-documents',
        'phat-trien-ben-vung', 'sustainable-development',
        'ha-tang-ky-thuat', 'technical-infrastructure',
        'ha-tang-xa-hoi', 'social-infrastructure',
        'dat-giu-cho', 'reservation-register',
        'dang-ky-tham-quan', 'visit-registration',
        'cau-hoi-thuong-gap', 'faqs'
    );

    if (!is_array($url)) {
        $check = request()->is($url);
        return $check ? $class : "";
    } else {
        foreach ($url as $key => $value) {
            if (request()->is($value)) {
                return $class;
            }
        }
    }
    return "";
}

function cvDbTime($date, $from = DB_DATE, $to = PHP_DATE)
{
    return $date ? \Carbon\Carbon::createFromFormat($from, $date)->format($to) : null;
}

function resourceAdmin($prefix, $controller, $name, $permission = null, array $except = ['show'])
{
    if ($permission === null) {
        $permission = $name;
    }
    Route::group(['prefix' => $prefix], function () use ($controller, $name, $permission, $except) {
        if (!in_array('index', $except)) {
            Route::get('/', "{$controller}@index")->name("admin.{$name}.index")->middleware("permission:admin.{$permission}.index");
        }

        if (!in_array('datatable', $except)) {
            Route::get('datatable', "{$controller}@datatable")->name("admin.{$name}.datatable")->middleware("permission:admin.{$permission}.index");
        }

        if (!in_array('show', $except)) {
            Route::get('{id}', "{$controller}@show")->name("admin.{$name}.show")->middleware("permission:admin.{$permission}.show");
        }

        if (!in_array('create', $except)) {
            Route::get('create', "{$controller}@create")->name("admin.{$name}.create")->middleware("permission:admin.{$permission}.create");
            Route::post('/', "{$controller}@store")->name("admin.{$name}.store")->middleware("permission:admin.{$permission}.create");
        }

        if (!in_array('edit', $except)) {
            Route::get('{id}/edit', "{$controller}@edit")->name("admin.{$name}.edit")->middleware("permission:admin.{$permission}.edit");
            Route::put('{id}', "{$controller}@update")->name("admin.{$name}.update")->middleware("permission:admin.{$permission}.edit");
        }

        if (!in_array('destroy', $except)) {
            Route::delete('{id}', "{$controller}@destroy")->name("admin.{$name}.destroy")->middleware("permission:admin.{$permission}.destroy");
        }
    });
}

function cutString($str, $length = 15, $end = '...')
{
    $minword = 3;
    $sub = '';
    $len = 0;
    foreach (explode(' ', $str) as $word) {
        $part = (($sub != '') ? ' ' : '') . $word;
        $sub .= $part;
        $len += strlen($part);
        if (strlen($word) > $minword && strlen($sub) >= $length) {
            break;
        }
    }
    return $sub . (($len < strlen($str)) ? $end : '');
}

function getIndexSearch()
{
    $locale = \App::getLocale();
    $segment = request()->segment(1);
    if ($segment === $locale) {
        $segment = request()->segment(2);
    }

    $arr = [
        'products',
        'san-pham',
        'news',
        'tin-tuc',
        'vacancy-list',
        'danh-sach-tuyen-dung'
    ];
    if (in_array($segment, $arr)) {
        return $segment;
    }
    return null;
}

function removeAllConfig()
{
    \Artisan::call('view:clear');
    \Artisan::call('cache:clear');
    \Artisan::call('config:clear');
}

function fileNameFromPath($path, $name = true)
{
    if (!$path) {
        return null;
    }
    $string = str_replace('.blade.php', '', $path);

    if (!$name) {
        return $string;
    }

    $string = str_replace('-', ' ', $string);

    return ucwords($string);
}

function getThumbnail($img_path, $width, $height, $type = "fit")
{
    return app('App\Http\Controllers\ImageController')->getImageThumbnail($img_path, $width, $height, $type);
}


function jsonContent($string)
{
    if (is_numeric($string)) {
        return $string;
    }
    $data = @json_decode($string);
    return (json_last_error() === JSON_ERROR_NONE) ? ((array)$data) : $string;
}

function get_youtube_id($url)
{
    $matches = null;
    preg_match("/^(?:http(?:s)?:\/\/)?(?:www\.)?(?:m\.)?(?:youtu\.be\/|youtube\.com\/(?:(?:watch)?\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user)\/))([^\?&\"'>]+)/", $url, $matches);
    return count($matches) == 2 ? $matches[1] : null;
}

function is_home_page()
{
    $route_name = Illuminate\Support\Facades\Route::currentRouteName();
    return $route_name == 'page.home';
}

function check_checked_input($array, $value)
{
    if (!is_array($array)) return '';
    return in_array($value, $array) ? 'checked' : '';
}

function summary($source_string, $max_len=30)
{
    $source_string =  strip_tags($source_string);
    if(strlen($source_string)<$max_len) return $source_string;
    $html = substr($source_string,0,$max_len);
    $html = substr($html,0,strrpos($html,' '));
    return $html.'...';
}

function format_show_time($input_date)
{
    $date = \Carbon\Carbon::parse($input_date);
    $month = $date->month;
    $month = trans("calendar_month.$month");
    if(app()->getLocale() == 'vi'){
        return "{$month} {$date->day} {$date->year}";
    }
    return "{$date->day} {$month} {$date->year}";
}

function transLang($url, $locale, $is_sub_page)
{
    $params = \Illuminate\Support\Facades\Request::query();
    if($is_sub_page)
        $url = \App\Helper\TranslateUrl::getLink($locale);

    $http_query = http_build_query($params);
    if($http_query)
        return url($url).'?'.$http_query;
    return url($url);
}

function sendMail(\App\Mail\EMail $email)
{
    $host = env('MAIL_HOST','smtp.gmail.com');
    $port = env('MAIL_PORT',587);
    $username = env('MAIL_USERNAME','hiennv@3forcom.com');

    $password = env('MAIL_PASSWORD','');

    $encryption = env('MAIL_ENCRYPTION','tls');

    $mail_from = [
        env('MAIL_FROM_ADDRESS','hiennv@3forcom.com') => env('MAIL_FROM_NAME','Demo')
    ];

    $html = View::make($email->body['view'], $email->body['content'])->render();

    $transport = (new Swift_SmtpTransport($host, $port, $encryption))
        ->setUsername($username)
        ->setPassword($password);

    $mailer = new Swift_Mailer($transport);

    $message = (new Swift_Message($email->subject))
        ->setFrom($mail_from)
        ->setTo([$email->receiver_address  => $email->receiver_name])
        ->setBody($html, 'text/html');

    try{
        return $mailer->send($message);
    }catch (\Swift_SwiftException $ex){
        dd($ex->getMessage());
    }
    return false;
}

function replacement($string, array $placeholders)
{
    $resultString = $string;
    foreach($placeholders as $key => $value) {
        $resultString = str_replace('[' . $key . ']' , trim($value), $resultString, $i);
    }
    return $resultString;
}

function htrans($array_lang = [])
{
    $locale = \App::getLocale();
    if(is_array($array_lang) && isset($array_lang[$locale]))
        return $array_lang[$locale];
    return '';
}

function getAssetResourceVersion($url)
{
    return asset($url).'?v='.env('RESOURCE_VERSION',1.0);
}


function preventDownloadVideo($video_url)
{
    return \App\Helper\PreventDownloadFile::getInstance()->encodeURL($video_url,'frontend.media');
}

function checkDOMAIN($ref)
{
    if ($ref) {
        try {
            $domain = parse_url($ref);
            $domain = $domain['host'];
            $host = parse_url(env('APP_URL'));
            $host = $host['host'];
            return $host == $domain;
        } catch (\Exception $exception) {}
    }
    return false;
}

function downloadFile($file)
{
    if (file_exists($file) && is_file($file)) {
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="'.basename($file).'"');
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . filesize($file));
        readfile($file);
        exit;
    }
    return 'File not exist!';
}

function HDTranslate($vi=null,$en=null)
{
    $locale = \App::getLocale();
    if($locale=='vi')
        return $vi;
    return $en;
}

function getPageUrlByCode($code, $get = 'slug')
{
    if(!app()->runningInConsole())
    {
        $locale = \App::getLocale();
        $lang = ($locale == 'en') ? '' : $locale;
        $page = \App\Models\Page::where('code', $code)->first();
        if ($page)
        {
            if($get == 'slug')
                return "$lang/".$page->{$get};
            return $page->{$get};
        }
        return null;
    }
    return null;
}


function checkReCaptcha()
{
    try{
        $client = new \GuzzleHttp\Client(['verify' => false]);
        $response = $client->post(
            'https://www.google.com/recaptcha/api/siteverify',
            ['form_params'=>
                [
                    'secret'=>env('GOOGLE_RECAPTCHA_SECRET'),
                    'response'=>request()->get('g-recaptcha-response')
                ]
            ]
        );
        return json_decode($response->getBody()->getContents(),true)['success'];
    } catch (\Exception $ex){
        return false;
    }
}

function getLocalFile($url){
    if((strpos($url,'http') !== false) || (file_exists(public_path($url)) && is_file(public_path($url)))){
        return $url;
    }
    return "images/no_image.jpg";
}

function getNewsCategoryByCode($code = 'INVESTORS'){
    return \App\Models\NewsCategory::where('code',$code)->first();
}

function getLocalFileSpec($url){
    if((strpos($url,'http') !== false)){
        return $url;
    }
    return asset($url);
}

function getSupportedLocales(){
    return \LaravelLocalization::getSupportedLocales();
}