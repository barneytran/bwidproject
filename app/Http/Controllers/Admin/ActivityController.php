<?php

namespace App\Http\Controllers\Admin;

use App\Helper\Breadcrumb;
use App\Models\Permission;
use App\Repositories\ActivityRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;
use DB;

class ActivityController extends Controller
{
    protected $activity;

    public function __construct(ActivityRepository $activity)
    {
        $this->activity = $activity;
    }

    public function index()
    {
        Breadcrumb::title(trans('admin_activity.title'));

        return view('admin.activity.index');
    }

    public function datatable()
    {
        $data = $this->activity->datatable();

        return DataTables::of($data)
        	->addColumn(
                'name',
                function ($data) {
                    $user = DB::table('users')->where('id', $data->causer_id)->first();
                    return $user->name;
                }
            )
            ->escapeColumns([])
            ->make(true);
    }
}
