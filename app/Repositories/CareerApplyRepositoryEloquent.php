<?php

namespace App\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\CareerApplyRepository;
use App\Models\CareerApply;
use App\Validators\CareerApplyValidator;

/**
 * Class CareerApplyRepositoryEloquent
 *
 * @package namespace App\Repositories;
 */
class CareerApplyRepositoryEloquent extends BaseRepository implements CareerApplyRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return CareerApply::class;
    }

    /**
     * Specify Validator class name
     *
     * @return mixed
     */
    public function validator()
    {
        return CareerApplyValidator::class;
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

    public function store(array $input)
    {
        $apply = $this->model->create($input);

        if (!empty($input['files'])) {
            $config = config('files.career_attach_file');
            foreach ($input['files'] as $file) {
                $arr = $this->storeFile($file, $config['path']);
                $apply->files()->create($arr);
            }
        }

        return $apply;
    }

    public function storeFile($file, $path)
    {
        $arr = [
            'name' => $file->getClientOriginalName(),
            'ext' => $file->getClientOriginalExtension(),
            'size' => $file->getClientSize() / 1024, //KB
            'path' => \Storage::putFile($path, $file)
        ];
        return $arr;
    }
}
