<?php

namespace App\Http\Controllers\Admin;

use App\Repositories\ContactRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Breadcrumb;
use Yajra\DataTables\Facades\DataTables;

class RegisterController extends Controller
{
    protected $contact;

    public function __construct(ContactRepository $contact)
    {
        $this->contact = $contact;
    }

    public function index()
    {
        Breadcrumb::title(trans('admin_contact.title'));
        return view('admin.register.index');
    }

    public function export_excel()
    {
        \Excel::create('Empirecity_register_'.date('d.m.Y'), function($excel) {

            $excel->setTitle('Empirecity export excel register');
            $excel->setCreator(auth()->user()->name)
                ->setCompany('Empirecity');
            $excel->setDescription('This document was exported at '.date('H:i:s d-m-Y'));
            $excel->sheet('Main sheet', function($sheet) {
                $data = $this->contact->export_excel_follow();
                $sheet->cells('A1:G1', function($cells) {
                    $cells->setFontWeight('bold');
                    $cells->setBackground('#64d5ca');
                    $cells->setFontSize(12);
                });
                $sheet->setBorder('A1:G'.(count($data)+1),'dashed');
                $sheet->fromArray($data);
            });
        })->download('xlsx');
    }

    public function datatable()
    {
        $data = $this->contact->datatable()->whereNull('hear');

        return DataTables::of($data)
            ->editColumn(
                'is_follow',
                function ($data) {
                    return trans("admin_contact.follow.$data->is_follow");
                }
            )
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
                        'btn_view_datatable' => true,
                        'link_delete' => route('admin.contact.destroy', $data->id),
                        'id_delete' => $data->id
                    ]
                )->render();
                }
            )
            ->escapeColumns(['name', 'phone', 'email', 'address', 'content'])
            ->make(true);
    }

    public function destroy($id)
    {
        $contact = $this->contact->find($id);
        $contact->delete();

        session()->flash('success', trans('admin_message.deleted_successful', ['attr' => trans('admin_contact.contact')]));

        return redirect()->back();
    }
}
