<?php

namespace App\Repositories;

use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Interface ServiceRepository
 *
 * @package namespace App\Repositories;
 */
interface ServiceRepository extends RepositoryInterface
{
    public function listService($limit, $is_top);//show in page home

    public function datatable();

    public function findBySlug($slug);

    public function search(array $inputs);

    public function newsByCategory($category_id, $limit, $ignore = null, $paging = false);

    public function topService($limit, $is_top);

    public function newsInPage($limit);

    public function relative_news(int $current_news_id);

}
