<?php

namespace App\Repositories;

use App\Models\Subscribe;
use Prettus\Repository\Criteria\RequestCriteria;
use Prettus\Repository\Eloquent\BaseRepository;

/**
 * Class ContactRepositoryEloquent
 * @package namespace App\Repositories;
 */
class SubscribeRepositoryEloquent extends BaseRepository implements SubscribeRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Subscribe::class;
    }


    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }

    public function datatable()
    {
        return $this->model->select('*')->orderBy('id', 'desc');
    }

    public function export_excel()
    {
        return $this->model->select('email as Email','created_at as Send date')->orderByDesc('created_at')->get();
    }
}
