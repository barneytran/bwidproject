<?php
/**  * Created by PhpStorm.
 * User: Hadesker - HienNV
 * Date: 8/2/2018
 * Time: 10:55 AM
 */

namespace App\Helper;
use Carbon\Carbon;

class PreventDownloadFile
{
    private static $instance;

    private $time;


    const TOLERANCE = 10;
    const TIME_FORMAT = 'H:i:s-d/m/Y';

    public function __construct()
    {
        $this->time = Carbon::now();
    }

    public static function getInstance()
    {
        if(!isset(self::$instance)){
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getTime()
    {
        return $this->time;
    }

    private function encodeTIME(Carbon $time)
    {
        return $time->format(self::TIME_FORMAT);
    }

    private function decodeTIME(string $time)
    {
        try{
            return Carbon::createFromFormat(self::TIME_FORMAT,$time);
        }catch (\Exception $exception){
            return false;
        }
    }

    public function encodeURL($path, $route_name = '')
    {
        $hash = [
            'time'=>$this->encodeTIME($this->time),
            'path'=>$path
        ];
        $json_hash = json_encode($hash);
        return route($route_name,['hash'=>encrypt($json_hash)]);
    }

    private function checkTIME(Carbon $time)
    {
        return Carbon::now()->diffInSeconds($time) <= self::TOLERANCE;
    }

    public function decodeURL($hash)
    {
        try{
            $hash = decrypt($hash);
            $hash = json_decode($hash,true);
            $time = $hash['time'];
            $time = $this->decodeTIME($time);
            $check = $this->checkTIME($time);
            return $check ? $hash['path'] : false;
        } catch (\Exception $exception){
           return false;
        }
    }

}