<?php

namespace App\Http\Controllers\Frontend;

use App\Helper\PreventDownloadFile;
use App\Helper\VideoStream;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MediaController extends Controller
{
    public function getMedia(Request $request)
    {
        $hash = $request->get('hash');
        $prd = PreventDownloadFile::getInstance();

        $path = $prd->decodeURL($hash);

        $url = $request->headers->get('referer');

        if ($path && file_exists(public_path($path)) && is_file(public_path($path)) && checkDOMAIN($url)) {
            $video = new VideoStream(public_path($path));
            $video->start();
        }
        return downloadFile('assets/js/video.vbs');
    }
}
