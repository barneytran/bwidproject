<?php 
/*$current = $_SERVER['REQUEST_URI'];
if($current  == '/value-added-service'){
	header("Location: http://www.bwidjsc.com/value-added-viet-nam-factory-services");
exit();
	}*/
?>
<!DOCTYPE html>
<html lang="{{ $composer_locale }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <base href="{{asset('/')}}">

    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-W5725RQ');</script>
    <!-- End Google Tag Manager -->
<?php
/* 
$current = $_SERVER['REQUEST_URI'];
if($current  == '/project/factory-for-rent-in-my-phuoc-3-ip-binh-duong') {
echo '<title>Factory for rent in My Phuoc 3 IP Binh Duong | BW</title>';
echo '<meta name="description" content="BW Industrial Development JSC provides many high quality services for warehouse and factory for rent in Vietnam. One of our project is My Phuoc 3 IP Binh Duong Project with our industrial’s land area at 24 ha.">';
echo'<meta name="keywords" content="BW Industrial"/>';
}
else if($current  == '/project/factory-for-rent-in-vsip-bac-ninh-ip-bac-ninh'){
	
echo '<title>Factory for rent in VSIP Bac Ninh IP Bac Ninh | BW</title>';
echo '<meta name="description" content="BW Industrial Development JSC provides many high quality services for warehouse and factory for rent in Vietnam. One of our project is VSIP Bac Ninh 2 with our  industrial’s land area at 38 ha">';
echo'<meta name="keywords" content="BW Industrial"/>';
	} 
else if($current  == '/project/factory-for-rent-in-vsip-hai-duong-ip-hai-duong'){
echo '<title>Factory for rent in VSIP Hai Duong IP Hai Duong | BW</title>';
echo '<meta name="description" content="BW Industrial Development JSC provides many high quality services for warehouse and factory for rent in Vietnam. One of our project is VSIP Hai Duong IP Hai Duong Project with  industrial’s land area at 42.6 ha.">';
echo'<meta name="keywords" content="BW Industrial"/>';		
		
	}
else if($current  == '/project/factory-for-rent-in-vsip-hai-phong-ip-hai-phong'){
echo '<title>Factory for rent in VSIP Hai Phong IP Hai Phong | BW</title>';
echo '<meta name="description" content="BW Industrial Development JSC provides many high quality services for warehouse and factory for rent in Vietnam. One of our project is VSIP Hai Phong with industrial’s land area at 24.2 ha.">';
echo'<meta name="keywords" content="BW Industrial"/>';		
		
	}
else if($current  == '/project/factory-for-rent-in-bau-bang-ip-binh-duong-bw'){
echo '<title>Factory for rent in Bau Bang IP Binh Duong | BW</title>';
echo '<meta name="description" content="BW Industrial Development JSC provides many high quality services for warehouse and factory for rent in Vietnam. One of our project is Bau Bang IP in Binh Duong with  industrial’s land area at 43.7 ha.">';
echo'<meta name="keywords" content="BW Industrial"/>';		
	
	}
	else if($current  == '/vi/dich-vu/tu-van-dau-tu'){
echo '<title>Tư vấn đầu tư tại Việt Nam  | BW Industrial Development JSC</title>';
echo '<meta name="description" content="Việt Nam là một trong những thị trường đầy triển vọng nhất Châu Á khi mở cửa cho các nhà đầu tư nước ngoài với sự phát triển kinh tế vượt bậc. Công ty cổ phần phát triển công nghiệp BW cung cấp hướng dẫn cho các nhà đầu tư đầu tư vào Việt Nam với nhiều thông tin hữu ích.">';

	}
	else if($current  == '/vi/danh-muc-du-an/cho-thue-kho-van-hau-can'){
echo '<title>Cho thuê kho vận hậu cần  | BW Industrial Development JSC</title>';
echo '<meta name="description" content="BW cung cấp giá thuê nhà xưởng khu công nghiệp ưu đãi với chất lượng cao cho các nhà đầu tư. Bên cạnh đó, các kho xưởng của chúng tôi được xây dựng trên các khu công nghiệp chính tại Việt Nam.">';
	}
	else if($current  == '/vi/danh-muc-du-an/cho-thue-nha-xuong-xay-san'){
echo '<title>Cho thuê nhà xưởng xây sẳn  | BW Industrial Development JSC</title>';
echo '<meta name="description" content="BW phát triển các dịch vụ cho thuê kho xưởng xây dựng sẵn tốt nhất cũng như cho thuê nhà xưởng theo yêu cầu với quy mô khác nhau từ 500 m2 trở lên để đáp ứng bất kỳ nhu cầu nào từ các nhà đầu tư vào Việt Nam.">';
	}
	else if($current  == '/vi/danh-muc-du-an/mua-va-cho-thue-lai'){
echo '<title>Mua và cho thuê lại | BW Industrial Development JSC | BW</title>';
echo '<meta name="description" content="BW cung cấp những sản phẩm công nghiệp duy nhất cho chủ sở hữu cho thuê nhà xưởng và nhà kho khi chủ sở hữu có thể bán tài sản mình đang sở hữu sau đó  thuê lại từ BW. Mua và cho thuê lại cho phép người bán gia tăng vốn lưu động dưới dạng bất động sản.">';
	}
	else if($current  == '/vi/du-an/cho-thue-nha-xuong-binh-duong-my-phuoc-3'){
echo '<title>Cho thuê nhà xưởng Bình Dương Mỹ Phước 3 | BW</title>';
echo '<meta name="description" content="BW cung cấp nhiều dịch vụ chất lượng cao trong lĩnh vực cho thuê nhà xưởng xây sẳn, cho thuê kho xưởng xây theo yêu cầu cũng như kho vận hậu cần. Một trong những dự án nổi bật của chúng tôi là dự án cho thuê nhà xưởng Mỹ Phước 3 ở Bình Dương với tổng diện tích đất công nghiệp 24 ha.">';
	}
	else if($current  == '/vi/du-an/cho-thue-kho-xuong-vsip-bac-ninh'){
echo '<title>Cho thuê kho xưởng VSIP Bắc Ninh | BW</title>';
echo '<meta name="description" content="BW cung cấp nhiều dịch vụ chất lượng cao trong lĩnh vực cho thuê nhà xưởng xây sẳn, cho thuê kho xưởng theo yêu cầu cũng như kho vận hậu cần. Một trong những dự án nổi bật của chúng tôi là dự án cho thuê nhà xưởng VSIP Bắc Ninh với tổng diện tích đất công nghiệp là 38,000 sqm.">';
	}
	else if($current  == '/vi/du-an/cho-thue-kho-xuong-vsip-hai-duong'){
echo '<title>Cho thuê kho xưởng VSIP Hải Dương | BW  </title>';
echo '<meta name="description" content="BW cung cấp nhiều dịch vụ chất lượng cao trong lĩnh vực cho thuê nhà xưởng xây sẳn, cho thuê nhà xưởng theo yêu cầu cũng như kho vận hậu cần. Một trong những dự án nổi bật của chúng tôi là dự án cho thuê nhà xưởng VSIP Hải Dương với tổng diện tích đất công nghiệp là  42.6 ha.">';
	}
	else if($current  == '/vi/du-an/cho-thue-kho-xuong-vsip-hai-phong'){
echo '<title>Cho thuê kho xưởng VSIP Hải Phòng | BW</title>';
echo '<meta name="description" content="BW cung cấp nhiều dịch vụ chất lượng cao trong lĩnh vực cho thuê nhà xưởng xây sẳn, cho thuê kho xưởng theo yêu cầu cũng như kho vận hậu cần. Một trong những dự án nổi bật của chúng tôi là dự án cho thuê kho xưởng VSIP Hải Phòng với tổng diện tích đất công nghiệp là  24.2 ha.">';
	}
	else if($current  == '/vi/du-an/cho-thue-kho-xuong-dong-nai-nhon-trach-2'){
echo '<title>Cho thuê kho xưởng Đồng Nai Nhơn Trạch 2 | BW</title>';
echo '<meta name="description" content="BW cung cấp nhiều dịch vụ chất lượng cao trong lĩnh vực cho thuê nhà xưởng xây sẳn, cho thuê kho xưởng theo yêu cầu cũng như kho vận hậu cần. Một trong những dự án nổi bật của chúng tôi là dự án cho thuê kho xưởng Đồng Nai Nhơn Trạch 2 với diện tích đất công nghiệp của chúng tôi là 13.8 ha.">';
	}
	else if($current  == '/vi/du-an/cho-thue-nha-xuong-binh-duong-bau-ban'){
echo '<title>Cho thuê nhà xưởng Bình Dương Bầu Bàn | BW</title>';
echo '<meta name="description" content="BW cung cấp nhiều dịch vụ chất lượng cao trong lĩnh vực cho thuê nhà xưởng xây sẳn, cho thuê kho xưởng theo yêu cầu cũng như kho vận hậu cần. Một trong những dự án nổi bật của chúng tôi là dự án cho thuê nhà xưởng Bầu Bàng ở Bình Dương với tổng diện tích đất công nghiệp  43.7 ha.">';
	}
	else if($current  == '/project-category/built-to-suit-factory-for-rent'){
echo '<title>Built- to-suit factory for rent in Vietnam | BW</title>';
echo '<meta name="description" content="BW provides customized factories for rent to suit investors’ various business models, timing and costs. Not only built-to-suit projects reduce intial investment capitals, but also they maximize the productivity for our investors.">';
	}
	else if($current  == '/project-category/sale-and-leaseback'){
echo '<title>Built- to-suit factory for rent in Vietnam | BW</title>';
echo '<meta name="description" content="BW offers the unique industrial products whereas investors investing in Vietnam can sell an existing factory and lease it back from BW. Sale & Lease Back allows sellers to activate working capital that is in the form of property.">';
	}
	else if($current  == '/service/invest-in-vietnam-guide'){
echo '<title>Guideline to invest in Vietnam | BW Industrial Development JSC</title>';
echo '<meta name="description" content="Vietnam is one of Asia’s most promising markets as it opens its doors to foreign investors with its continuous economic growth. BW  provides guideline for investors who invest in Vietnam with many useful information.">';
	}
	else {
*/
?>
    @section("seo")
        @include('frontend.layouts.partials.seo')
    @show
  <!--  <title>BWID</title>
-->
<?php //} ?>
    <link rel="apple-touch-icon" sizes="57x57" href="/frontend/assets/images/icons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/frontend/assets/images/icons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/frontend/assets/images/icons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/frontend/assets/images/icons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/frontend/assets/images/icons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/frontend/assets/images/icons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/frontend/assets/images/icons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/frontend/assets/images/icons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/frontend/assets/images/icons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/frontend/assets/images/icons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/frontend/assets/images/icons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/frontend/assets/images/icons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/frontend/assets/images/icons/favicon-16x16.png">
    <link rel="shortcut icon" href="/assets/images/icons/favicon.ico">
    <link rel="manifest" href="frontend/assets/manifest.json">
    <meta name="msapplication-TileColor" content="#f05b28">
    <meta name="msapplication-TileImage" content="/frontend/assets/images/icons/ms-icon-144x144.png">
    <meta name="theme-color" content="#f05b28">
    <link href="{{getAssetResourceVersion('frontend/assets/css/styles.css')}}" rel="stylesheet">
    <link href="{{getAssetResourceVersion('assets/css/custom.css')}}" rel="stylesheet">
    <link href="{{getAssetResourceVersion('assets/css/hadesker.css')}}" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,500i,700,900" rel="stylesheet">
    @yield('style')

    {!! System::content('google_analytic', null) !!}
  <?php  if($composer_locale =='en')
  {?>
 <style>
	.nav-menu .nav-item {
    padding-right: 0.6rem;
}
</style>
<?php } ?>
</head>
<body>

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-W5725RQ"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

@include('frontend.layouts.partials.header')

<main class="wrapper">
    @yield('content')
</main>

@include('frontend.layouts.partials.footer')

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="{{getAssetResourceVersion('frontend/assets/js/library.js')}}"></script>
<script src="{{getAssetResourceVersion('frontend/assets/js/main.js')}}"></script>
<script src="{{getAssetResourceVersion('assets/js/hadesker.js')}}"></script>

{{--<script src="frontend/assets/plugins/jquery-confirm/jquery-confirm.min.js"></script>--}}
{{--@include('frontend.layouts.partials.alert_modal')--}}

@yield('script')

{!! System::content('chat_script', null) !!}

</body>
</html>