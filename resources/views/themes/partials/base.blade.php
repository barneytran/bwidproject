<div class="bgBanner" style="background-image:url('{{(isset($blocks) && optional($blocks->get('BANNER'))->first() && $blocks->get('BANNER')->first()->url ? $blocks->get('BANNER')->first()->url : $banner) ?? 'images/business-model/bg-business-model.jpg'}}')">
    <img src="{{(isset($blocks) && optional($blocks->get('BANNER'))->first() && $blocks->get('BANNER')->first()->url ? $blocks->get('BANNER')->first()->url : $banner) ?? 'images/business-model/bg-business-model.jpg'}}">
</div>
<section class="mainBeardcrumb" >
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12 align-self-center">
                @include('frontend.layouts.partials.breadcrumb')
            </div>
        </div>
    </div>
</section>