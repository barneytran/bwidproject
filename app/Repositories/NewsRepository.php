<?php

namespace App\Repositories;

use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Interface NewsRepository
 *
 * @package namespace App\Repositories;
 */
interface NewsRepository extends RepositoryInterface
{
    public function listNews($limit, $is_top);//show in page home

    public function datatable();

    public function findBySlug($slug);

    public function search(array $inputs);

    public function newsByCategory($category_id, $limit, $ignore = null, $paging = false);

    public function topNews($limit, $is_top);

    public function newsInPage($limit);

    public function relative_news(int $current_news_id);

}
