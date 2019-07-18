<?php

namespace App\Http\Controllers\Frontend;

use App\Helper\TranslateUrl;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Repositories\GalleryRepository;
use App\Repositories\NewsRepository;
use App\Repositories\NewsCategoryRepository;
use App\Models\gallery;
use Breadcrumb;


class GalleryController extends Controller
{
    protected $gallery;
    public function __construct(
        GalleryRepository $gallery
    )
    {
        $this->gallery = $gallery;

        $link = getPageUrlByCode('MEDIA-INDEX');
        Breadcrumb::add(trans('frontend.media_center'), $link);
        Breadcrumb::add(trans('frontend.gallery'), getPageUrlByCode('MEDIA-GALLERY'));
    }

    public function getPhoto($slug)
    {
        Breadcrumb::add(trans('frontend.photo'), getPageUrlByCode('MEDIA-GALLERY-PHOTO'));
        $media_photo_detail = $this->gallery->findBySlug($slug);
        $media_photo_relative = $this->gallery->datatable()->where('type','IMAGES')->where('id','!=',$media_photo_detail->id)->limit(15)->get();
        Breadcrumb::add($media_photo_detail->name, url()->current());
        $metadata = $media_photo_detail->meta;
        return view('themes.media_gallery_photo_detail',compact('media_photo_detail', 'media_photo_relative','metadata'));
    }

    public function getVideo($slug)
    {
        Breadcrumb::add(trans('frontend.video'), getPageUrlByCode('MEDIA-GALLERY-PHOTO'));
        $media_video_detail = $this->gallery->findBySlug($slug);
        $media_video_relative = $this->gallery->datatable()->where('type','VIDEOS')->where('id','!=',$media_video_detail->id)->limit(15)->get();
        Breadcrumb::add($media_video_detail->name, url()->current());
        $metadata = $media_video_detail->meta;
        return view('themes.media_gallery_video_detail',compact('media_video_detail', 'media_video_relative','metadata'));
    }
}
