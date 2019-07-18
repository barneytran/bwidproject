<?php

namespace App\Http\Controllers\Admin;

use App\Helper\Breadcrumb;
use App\Repositories\NewsCategoryRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class NewsCategoryController extends Controller
{
    protected $news_category;

    public function __construct(NewsCategoryRepository $news_category)
    {
        $this->news_category = $news_category;
    }

    public function index()
    {
        Breadcrumb::title(trans('admin_news_category.title'));

        return view('admin.news_category.index');
    }

    public function datatable()
    {
        $data = $this->news_category->datatable();

        return DataTables::of($data)
            ->addColumn(
                'code',
                function ($data) {
                    return $data->code;
                }
            )
            ->addColumn(
                'translations',
                function ($data) {
                    return $data->name;
                }
            )
            ->addColumn(
                'action',
                function ($data) {
                    return view('admin.layouts.partials.table_button')->with(
                        [
                            'link_edit' => route('admin.news_category.edit', $data->id),
                            'link_delete' => route('admin.news_category.destroy', $data->id),
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
        Breadcrumb::title(trans('admin_news_category.create'));
        $news_category_parent = $this->news_category->datatable()->where('parent_id',0)->get();
        return view('admin.news_category.create_edit',compact('news_category_parent'));
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

        $news_category_id = $this->news_category->create($input);

        $locale = \App::getLocale();

        activity('Create News Category')->log(\Auth::user()->name.'('.\Auth::user()->email.') created news category "'.$input[$locale]['name'].'" (id: '.$news_category_id->id.')');

        session()->flash('success', trans('admin_message.created_successful', ['attr' => trans('admin_news_category.news_category')]));

        return redirect()->route('admin.news_category.index');
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
        Breadcrumb::title(trans('admin_news_category.edit'));
        $news_category_parent = $this->news_category->datatable()->where('parent_id',0)->get();
        $news_category = $this->news_category->find($id);
        $metadata = $news_category->meta;
        return view(
            'admin.news_category.create_edit',
            compact(
                'news_category',
                'news_category_parent',
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

        $this->news_category->update($input, $id);

        $locale = \App::getLocale();

        activity('Update News Category')->log(\Auth::user()->name.'('.\Auth::user()->email.') updated news category "'.$input[$locale]['name'].'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.updated_successful', ['attr' => trans('admin_news_category.news_category')]));

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
        $info_news_category = $this->news_category->find($id);

        $title = $info_news_category->name;

        $this->news_category->delete($id);

        activity('Delete News Category')->log(\Auth::user()->name.'('.\Auth::user()->email.') deleted news category"'.$title.'" (id: '.$id.')');

        session()->flash('success', trans('admin_message.deleted_successful', ['attr' => trans('admin_news_category.news_category')]));

        return redirect()->back();
    }
}
