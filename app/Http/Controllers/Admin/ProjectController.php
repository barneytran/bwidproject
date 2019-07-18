<?php

namespace App\Http\Controllers\Admin;

use App\Helper\Breadcrumb;
use App\Repositories\ProductRepository;
use App\Repositories\ProjectCategoryRepository;
use App\Repositories\ProjectRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class ProjectController extends Controller
{
    protected $category;
    protected $project;
    public function __construct(
        ProjectCategoryRepository $category,
        ProjectRepository $project
    )
    {
        $this->category = $category;
        $this->project = $project;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Breadcrumb::title(trans('admin_project.list'));
        return view('admin.project.index');
    }

    public function datatable()
    {
        $data = $this->project->datatable();
        return DataTables::of($data)
            ->addColumn(
                'category_name', function($data) {
                    $output = '';
                    $category = $data->category;
                    if (!empty($data->category)) {
                        $output .= '<a href="'
                            . route('admin.project_category.edit', $category->id)
                            .'">'
                            . ($category->name ?? trans('admin_project_category.empty_name'))
                            .'</a>';
                    }
                    return $output;
                }
            )
            ->addColumn(
                'action',
                function ($data) {
                    return view('admin.layouts.partials.table_button')->with(
                        [
                            'link_edit' => route('admin.project.edit', $data->id),
                            'link_delete' => route('admin.project.destroy', $data->id),
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
        Breadcrumb::title(trans('admin_project.create'));
        $categories = $this->category->all();
        return view('admin.project.create_edit',compact('categories'));
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

        $project_id = $this->project->create($request->input());

        $locale = \App::getLocale();

        activity('Create Project')->log(\Auth::user()->name.'('.\Auth::user()->email.') created project "'.$input[$locale]['name'].'" (id: '.$project_id->id.')');

        session()->flash('success', trans('admin_message.created_successful', ['attr' => trans('admin_project.title')]));
        return redirect()->route('admin.project.index');
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
        Breadcrumb::title(trans('admin_project.edit'));
        $project = $this->project->find($id);
        $categories = $this->category->all();
        $metadata = $project->meta;
        return view('admin.project.create_edit', compact('categories','project', 'metadata'));
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

        $this->project->update($request->input(), $id);

        $locale = \App::getLocale();

        activity('Update Project')->log(\Auth::user()->name.'('.\Auth::user()->email.') updated project "'.$input[$locale]['name'].'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.updated_successful', ['attr' => trans('admin_project.title')]));
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
        $info_project = $this->project->find($id);

        $title = $info_project->name;

        $this->project->delete($id);

        activity('Delete Project')->log(\Auth::user()->name.'('.\Auth::user()->email.') deleted project "'.$title.'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.deleted_successful', ['attr' => trans('admin_project.title')]));
        return redirect()->route('admin.project.index');
    }
}
