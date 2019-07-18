<?php

namespace App\Http\Controllers\Admin;

use App\Helper\Breadcrumb;
use App\Models\Career;
use App\Models\City;
use App\Repositories\CareerApplyRepository;
use App\Repositories\CareerCategoryRepository;
use App\Repositories\CareerRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class CareerController extends Controller
{
    protected $career;
    protected $apply;
    protected $category;

    public function __construct(
        CareerRepository $career,
        CareerApplyRepository $apply,
        CareerCategoryRepository $category)
    {
        $this->career = $career;
        $this->apply = $apply;
        $this->category = $category;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Breadcrumb::title(trans('admin_career.title'));

        return view('admin.career.index');
    }

    public function datatable()
    {
        $data = $this->career->datatable();
        return DataTables::of($data)
            ->addColumn(
                'translations',
                function ($data) {
                    return $data->name;
                }
            )
            ->editColumn(
                'employer',
                function ($data) {
                    return $data->employer;
                }
            )
            ->editColumn(
                'status',
                function ($data) {
                    return $data->status;
                }
            )
            ->editColumn(
                'is_top',
                function ($data) {
                    return $data->is_top ? '<i class="material-icons col-pink">check</i>' : '<i class="material-icons">more_horiz</i>';
                }
            )
            ->addColumn(
                'num_of_application',
                function ($data) {
                    return $data->applies()->count();
                }
            )
            ->editColumn(
                'expired_date',
                function ($data) {
                    return $data->expired_date_format;
                }
            )
            ->addColumn(
                'action',
                function ($data) {
                    return view('admin.layouts.partials.table_button')->with(
                        [
                            'link_edit' => route('admin.career.edit', $data->id),
                            'link_delete' => route('admin.career.destroy', $data->id),
                            'id_delete' => $data->id
                        ]
                    )->render();
                }
            )
            ->escapeColumns([])
            ->make(true);
    }

    public function application()
    {
        Breadcrumb::title(trans('admin_career.apply'));

        return view('admin.career.application');
    }

    public function applicationDatatable()
    {
        $data = $this->apply->datatable();

        return DataTables::of($data)
            ->addColumn(
                'employer', function ($data) {
                return $data->career->employer; //nhatuyendung
            })
            ->addColumn(
                'position', function ($data) {
                return $data->career->name; //career
            })
            ->editColumn(
                'created_at',
                function ($data) {
                    return cvDbTime($data->created_at, DB_TIME, PHP_DATE_TIME);
                }
            )
            ->addColumn("action", function ($data) {
                return " <a class='btn btn-success btn-detail'>" . trans('button.view') . "<a>";
            })
            ->escapeColumns(['name', 'phone', 'email', 'address', 'content'])
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Breadcrumb::title(trans('admin_career.create_career'));

        $statuses = Career::getStatuses();
        $categories = $this->category->all();
        $cities = City::all();
        return view(
            'admin.career.create_edit',
            compact(
                'statuses',
                'cities',
                'categories'
            )
        );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all();

        $career_id = $this->career->create($input);

        $locale = \App::getLocale();

        activity('Create Career')->log(\Auth::user()->name.'('.\Auth::user()->email.') created career "'.$input[$locale]['name'].'" (id: '.$career_id->id.')');

        session()->flash('success', trans('admin_message.created_successful', ['attr' => trans('admin_career.career')]));

        return redirect()->route('admin.career.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $career = $this->career->find($id);

        $statuses = Career::getStatuses();
        $cities = City::all();
        $categories = $this->category->all();
        $metadata = $career->meta;
        return view(
            'admin.career.create_edit',
            compact(
                'career',
                'statuses',
                'categories',
                'cities',
                'metadata'
            )
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input = $request->all();

        $this->career->update($input, $id);

        $locale = \App::getLocale();

        activity('Update Career')->log(\Auth::user()->name.'('.\Auth::user()->email.') updated career "'.$input[$locale]['name'].'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.updated_successful', ['attr' => trans('admin_career.career')]));

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $info_career = $this->career->find($id);

        $title = $info_career->name;

        $this->career->delete($id);

        activity('Delete Career')->log(\Auth::user()->name.'('.\Auth::user()->email.') deleted career "'.$title.'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.deleted_successful', ['attr' => trans('admin_career.career')]));

        return redirect()->back();
    }
}
