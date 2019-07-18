<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Repositories\SubscribeRepository;
use Breadcrumb;
use Yajra\DataTables\Facades\DataTables;

class SubscribeController extends Controller
{
    protected $subscribe;

    public function __construct(SubscribeRepository $subscribe)
    {
        $this->subscribe = $subscribe;
    }

    public function index()
    {
        Breadcrumb::title(trans('admin_subscribe.title'));
        return view('admin.subscribe.index');
    }

    public function export_excel()
    {
        \Excel::create('Empirecity_subscribe_'.date('d.m.Y'), function($excel) {

            $excel->setTitle('Empirecity export excel subscribe');
            $excel->setCreator(auth()->user()->name)
                ->setCompany('Empirecity');
            $excel->setDescription('This document was exported at '.date('H:i:s d-m-Y'));
            $excel->sheet('Main sheet', function($sheet) {
                $data = $this->subscribe->export_excel();
                $sheet->cells('A1:H1', function($cells) {
                    $cells->setFontWeight('bold');
                    $cells->setBackground('#64d5ca');
                    $cells->setFontSize(12);
                });
                $sheet->setBorder('A1:H'.(count($data)+1),'dashed');
                $sheet->fromArray($data);
            });
        })->download('xlsx');
    }

    public function datatable()
    {
        $data = $this->subscribe->datatable();

        return DataTables::of($data)
            ->editColumn(
                'created_at',
                function ($data) {
                    return cvDbTime($data->created_at, DB_TIME, PHP_DATE_TIME);
                }
            )
            ->addColumn(
                'action',
                function ($data) {
                    return view('admin.layouts.partials.table_button')->with(
                    [
                        'link_delete' => route('admin.subscribe.destroy', $data->id),
                        'id_delete' => $data->id
                    ])->render();
                }
            )
            ->escapeColumns(['email'])
            ->make(true);
    }

    public function destroy($id)
    {
        $subscribe = $this->subscribe->find($id);
        $subscribe->delete();

        session()->flash('success', trans('admin_message.deleted_successful', ['attr' => trans('admin_subscribe.subscribe')]));

        return redirect()->back();
    }
}
