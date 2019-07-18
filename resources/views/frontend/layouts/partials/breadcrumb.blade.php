@php $breadcrumbs = Breadcrumb::$breadcrumb; @endphp
@if(!empty($breadcrumbs) && is_array($breadcrumbs) && count($breadcrumbs) > 1)
    <ol class="breadcrumb">
        @foreach($breadcrumbs as $key => $value)
            <li class="breadcrumb-item {{$key == count($breadcrumbs)-1 ? 'active' : ''}}">
                @if(!$key)
                    <i class="ic_home"></i>
                @endif
                <a href="{{$value['link']}}">{{ summary($value["name"],55) }}</a>
            </li>
        @endforeach
    </ol>
@endif