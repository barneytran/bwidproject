<?php
/**  * Created by PhpStorm.
 * User: Hadesker - HienNV
 * Date: 9/13/2018
 * Time: 4:17 PM
 */

namespace App\Helper;

class Search
{
    public $type;
    public $url;
    public $title;
    public $description;

    public static $TYPE_OUR_BUSINESS = 1;
    public static $TYPE_PROPERTY = 2;
    public static $TYPE_MEDIA = 3;
    public static $TYPE_CAREER = 4;

    public function getTypeName()
    {
        switch ($this->type)
        {
            case self::$TYPE_PROPERTY : return trans('frontend.property_leasing');
            case self::$TYPE_MEDIA : return trans('frontend.media_center');
            case self::$TYPE_CAREER : return trans('frontend.careers');
            default: return trans('frontend.our_businesses');
        }
    }
}