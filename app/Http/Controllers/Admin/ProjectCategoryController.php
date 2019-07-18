<?php

namespace App\Http\Controllers\Admin;

use App\Helper\Breadcrumb;
use App\Repositories\ProductRepository;
use App\Repositories\ProjectCategoryRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class ProjectCategoryController extends Controller
{
    protected $category;

    public function __construct(ProjectCategoryRepository $category)
    {
        $this->category = $category;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Breadcrumb::title(trans('admin_project_category.list'));
        return view('admin.project_category.index');
    }

    public function datatable()
    {
        $data = $this->category->datatable();
        return DataTables::of($data)
            ->editColumn('name', function ($data) {
                return $data->parent ? $data->parent->name.' <i>---></i> '.$data->name : $data->name;
            })
            ->addColumn(
                'action',
                function ($data) {
                    return view('admin.layouts.partials.table_button')->with(
                        [
                            'link_edit' => route('admin.project_category.edit', $data->id),
                            'link_delete' => route('admin.project_category.destroy', $data->id),
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
        Breadcrumb::title(trans('admin_project_category.create'));
        return view('admin.project_category.create_edit');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all();

        $project_category_id = $this->category->create($request->input());

        $locale = \App::getLocale();

        activity('Create Project Category')->log(\Auth::user()->name.'('.\Auth::user()->email.') created project category "'.$input[$locale]['name'].'" (id: '.$project_category_id->id.')');

        session()->flash('success', trans('admin_message.created_successful', ['attr' => trans('admin_project_category.title')]));
        return redirect()->route('admin.project_category.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        Breadcrumb::title(trans('admin_project_category.edit'));
        $project_category = $this->category->find($id);
        $metadata = $project_category->meta;
        return view('admin.project_category.create_edit', compact('project_category', 'metadata'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input = $request->all();

        $this->category->update($request->input(), $id);

        $locale = \App::getLocale();

        activity('Update Project Category')->log(\Auth::user()->name.'('.\Auth::user()->email.') updated project category "'.$input[$locale]['name'].'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.updated_successful', ['attr' => trans('admin_project_category.title')]));
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $info_project_category = $this->category->find($id);

        $title = $info_project_category->name;

        $this->category->delete($id);

        activity('Delete Project Category')->log(\Auth::user()->name.'('.\Auth::user()->email.') deleted project category"'.$title.'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.deleted_successful', ['attr' => trans('admin_project_category.title')]));
        return redirect()->route('admin.project_category.index');
    }
}
