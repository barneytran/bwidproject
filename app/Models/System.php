<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class System extends Model implements Transformable
{
    use TransformableTrait;

    protected $table = "systems";

    protected $fillable = [
        "key",
        "content"
    ];

    protected static $system;

    public $system_key = [
        'email',
        'contact_email',
        'address',
        'address_show_room',
        'location',
        'fax',
        'phone',
        'phone_bottom',
        'phone_bottom_no',
        'google_analytic',
        'chat_script',

        'facebook',
        'youtube',
        'google',
        'twitter',
        'likedin',
        'instagram',
        'weixin',

        'website_title',
        'website_description',
        'website_keywords',

        'map_desktop',
        'map_mobile'
    ];

    public function setContentAttribute($value)
    {
        $this->attributes['content'] =  !empty($value) ? is_array($value) ? json_encode($value) : $value : null;
    }

    public function getContentAttribute($value)
    {
        return jsonContent($value);
    }

    public static function content($key, $default = null)
    {
        $model = self::$system ?? self::$system = self::select('key', 'content')->pluck('content', 'key')->toArray();
        if(!empty($model[$key]) && is_array($model[$key])){
            $locale = \App::getLocale();
            return $model[$key][$locale] ?? $default;
        }
        return $model[$key] ?? $default;
    }
}
