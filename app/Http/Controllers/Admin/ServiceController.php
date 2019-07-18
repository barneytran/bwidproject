<?php

namespace App\Http\Controllers\Admin;

use App\Helper\Breadcrumb;
use App\Repositories\ServiceRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class ServiceController extends Controller
{
    protected $service;

    public function __construct(ServiceRepository $service)
    {
        $this->service = $service;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Breadcrumb::title(trans('admin_service.title'));

        return view('admin.service.index');
    }

    public function datatable()
    {
        $data = $this->service->datatable();
        return DataTables::of($data)
            ->addColumn(
                'translations',
                function ($data) {
                    return $data->title;
                }
            )
            ->editColumn(
                'active',
                function ($data) {
                    return $data->active ? '<span class="label label-success">'.$data->label_active.'</span>' : '<span class="label label-warning">'.$data->label_active.'</span>';
                }
            )
            ->addColumn(
                'action',
                function ($data) {
                    return view('admin.layouts.partials.table_button')->with(
                        [
                        'link_edit' => route('admin.service.edit', $data->id),
                        'link_delete' => route('admin.service.destroy', $data->id),
                        'id_delete' => $data->id
                        ]
                    )->render();
                }
            )
            ->escapeColumns([])
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Breadcrumb::title(trans('admin_service.create'));

        return view('admin.service.create_edit');
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

        $service_id = $this->service->create($input);

        $locale = \App::getLocale();

        activity('Create Service')->log(\Auth::user()->name.'('.\Auth::user()->email.') created service "'.$input[$locale]['title'].'" (id: '.$service_id->id.')');

        session()->flash('success', trans('admin_message.created_successful', ['attr' => trans('admin_service.service')]));

        return redirect()->route('admin.service.index');
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
        Breadcrumb::title(trans('admin_service.edit'));

        $service = $this->service->find($id);

        $metadata = $service->meta;

        return view('admin.service.create_edit', compact('service', 'metadata'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int                      $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input = $request->all();

        $this->service->update($input, $id);

        $locale = \App::getLocale();

        activity('Update Service')->log(\Auth::user()->name.'('.\Auth::user()->email.') updated service "'.$input[$locale]['title'].'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.updated_successful', ['attr' => trans('admin_service.service')]));

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
        $info_service = $this->service->find($id);

        $title = $info_service->title;

        $this->service->delete($id);

        activity('Delete Service')->log(\Auth::user()->name.'('.\Auth::user()->email.') deleted service "'.$title.'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.deleted_successful', ['attr' => trans('admin_service.service')]));

        return redirect()->back();
    }
}
