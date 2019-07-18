<!-- #Top Bar -->
<section>
    <!-- Left Sidebar -->
    <aside id="leftsidebar" class="sidebar">
        <!-- User Info -->
        <div class="user-info" style="height: 100px;">
            <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, .3)"></div>
            <div class="info-container">
                <div class="image pull-left">
                    <img src="/assets/admin/images/user.png" width="48" height="48" alt="User"/>
                </div>
                <div class="name" data-toggle="dropdown" aria-haspopup="true"
                     aria-expanded="false">{{ Auth::user()->name }}</div>
                <div class="email">{{ Auth::user()->email }}</div>
                <div class="btn-group user-helper-dropdown">
                    <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="{{ route('logout') }}"
                               onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                <i class="material-icons">input</i>{!! trans("admin_menu.sign_out") !!}</a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                {{ csrf_field() }}
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- #User Info -->
        <!-- Menu -->
        <div class="menu">
            <ul class="list">
                <li class="header"></li>
                <li class="{!! currentPageMenu(["*admin"]) !!}">
                    <a href="/admin">
                        <i class="material-icons">dashboard</i>
                        <span>{!! trans("admin_menu.dashboard") !!}</span>
                    </a>
                </li>

                {{--@if(in_array('admin.product.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu([--}}
                    {{--"*admin/products*",--}}
                    {{--"*admin/product-categories*"--}}
                    {{--]) !!}">--}}
                        {{--<a href="javascript:void(0);" class="menu-toggle">--}}
                            {{--<i class="material-icons">assignment</i>--}}
                            {{--<span>{!! trans("admin_menu.products") !!}</span>--}}
                        {{--</a>--}}
                        {{--<ul class="ml-menu">--}}
                            {{--<li class="{!! currentPageMenu(["*admin/products"]) !!}">--}}
                                {{--<a href="{!! route("admin.product.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.products_list") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                            {{--<li class="{!! currentPageMenu(["*admin/products/create"]) !!}">--}}
                                {{--<a href="{!! route("admin.product.create") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.create_product") !!}</span></a>--}}
                            {{--</li>--}}

                            {{--@if(in_array('admin.product_category.index', $composer_auth_permissions))--}}
                                {{--<li class="{!! currentPageMenu(["*admin/product-categories*"]) !!}">--}}
                                    {{--<a href="{!! route("admin.product_category.index") !!}">--}}
                                        {{--<span>{!! trans("admin_menu.categories") !!}</span>--}}
                                    {{--</a>--}}
                                {{--</li>--}}
                            {{--@endif--}}
                        {{--</ul>--}}
                    {{--</li>--}}
                {{--@endif--}}

                @if(in_array('admin.project.category.index', $composer_auth_permissions) || in_array('admin.project.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/project*"]) !!}">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">wallpaper</i>
                            <span>{!! trans("admin_menu.projects") !!}</span>
                        </a>
                        <ul class="ml-menu">
                            @if(in_array('admin.project.index', $composer_auth_permissions))
                                <li class="{!! currentPageMenu(["*admin/projects*"]) !!}">
                                    <a href="{!! route("admin.project.index") !!}">
                                        <span>{!! trans("admin_menu.project_list") !!}</span>
                                    </a>
                                </li>
                            @endif
                            @if(in_array('admin.project.category.index', $composer_auth_permissions))
                                <li class="{!! currentPageMenu(["*admin/project-categories*"]) !!}">
                                    <a href="{!! route("admin.project_category.index") !!}">
                                        <span>{!! trans("admin_menu.project_category_list") !!}</span>
                                    </a>
                                </li>
                            @endif
                        </ul>
                    </li>
                @endif

                @if(in_array('admin.page.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/pages*", '*admin/themes*']) !!}">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">pages</i>
                            <span>{!! trans("admin_menu.pages") !!}</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="{!! currentPageMenu(["*admin/pages"]) !!}">
                                <a href="{!! route("admin.page.index") !!}">
                                    <span>{!! trans("admin_menu.pages_list") !!}</span>
                                </a>
                            </li>

                            <li class="{!! currentPageMenu(["*admin/pages/create*"]) !!}">
                                <a href="{!! route("admin.page.create") !!}">
                                    <span>{!! trans("admin_menu.create_page") !!}</span>
                                </a>
                            </li>

                            <li class="{!! currentPageMenu(["*admin/themes*"]) !!}">
                                <a href="{!! route("admin.theme.index") !!}">
                                    <span>{!! trans("admin_menu.themes") !!}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif

                {{--@if(in_array('admin.catalogue.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/catalogue*"]) !!}">--}}
                        {{--<a href="javascript:void(0);" class="menu-toggle">--}}
                            {{--<i class="material-icons">book</i>--}}
                            {{--<span>{!! trans("admin_menu.catalogue") !!}</span>--}}
                        {{--</a>--}}
                        {{--<ul class="ml-menu">--}}
                            {{--<li class="{!! currentPageMenu(["*admin/catalogue"]) !!}">--}}
                                {{--<a href="{!! route("admin.catalogue.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.catalogue_list") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                            {{--<li class="{!! currentPageMenu(["*admin/catalogue/create*"]) !!}">--}}
                                {{--<a href="{!! route("admin.catalogue.create") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.create_catalogue") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                        {{--</ul>--}}
                    {{--</li>--}}
                {{--@endif--}}

                @if(in_array('admin.news.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/news*"]) !!}">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">view_list</i>
                            <span>{!! trans("admin_menu.news") !!}</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="{!! currentPageMenu(["*admin/news"]) !!}">
                                <a href="{!! route("admin.news.index") !!}">
                                    <span>{!! trans("admin_menu.news_list") !!}</span>
                                </a>
                            </li>
                            <li class="{!! currentPageMenu(["*admin/news/create"]) !!}">
                                <a href="{!! route("admin.news.create") !!}">
                                    <span>{!! trans("admin_menu.news_create") !!}</span>
                                </a>
                            </li>
                            <li class="{!! currentPageMenu(["*admin/news-categories*"]) !!}">
                                <a href="{!! route("admin.news_category.index") !!}">
                                    <span>{!! trans("admin_menu.categories") !!}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif

                @if(in_array('admin.service.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/service*"]) !!}">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">view_list</i>
                            <span>{!! trans("admin_menu.service") !!}</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="{!! currentPageMenu(["*admin/service"]) !!}">
                                <a href="{!! route("admin.service.index") !!}">
                                    <span>{!! trans("admin_menu.service_list") !!}</span>
                                </a>
                            </li>
                            <li class="{!! currentPageMenu(["*admin/service/create"]) !!}">
                                <a href="{!! route("admin.service.create") !!}">
                                    <span>{!! trans("admin_menu.service_create") !!}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif

                {{--@if(in_array('admin.brochures.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/brochures*"]) !!}">--}}
                        {{--<a href="javascript:void(0);" class="menu-toggle">--}}
                            {{--<i class="material-icons">view_list</i>--}}
                            {{--<span>{!! trans("admin_menu.brochures") !!}</span>--}}
                        {{--</a>--}}
                        {{--<ul class="ml-menu">--}}
                            {{--<li class="{!! currentPageMenu(["*admin/brochures"]) !!}">--}}
                                {{--<a href="{!! route("admin.brochures.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.brochures_list") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                            {{--<li class="{!! currentPageMenu(["*admin/brochures/create"]) !!}">--}}
                                {{--<a href="{!! route("admin.brochures.create") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.brochures_create") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                        {{--</ul>--}}
                    {{--</li>--}}
                {{--@endif--}}

                @if(in_array('admin.career.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/careers*"]) !!}">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">event_seat</i>
                            <span>{!! trans("admin_menu.careers") !!}</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="{!! currentPageMenu(["*admin/careers"]) !!}">
                                <a href="{!! route("admin.career.index") !!}">
                                    <span>{!! trans("admin_menu.careers_list") !!}</span>
                                </a>
                            </li>
                            <li class="{!! currentPageMenu(["*admin/careers/create"]) !!}">
                                <a href="{!! route("admin.career.create") !!}">
                                    <span>{!! trans("admin_menu.create_career") !!}</span></a>
                            </li>
                            {{--<li class="{!! currentPageMenu(["*admin/careers/application-list"]) !!}">--}}
                                {{--<a href="{!! route("admin.career.application") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.applications") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}

                            <li class="{!! currentPageMenu(["*admin/careers/categories*"]) !!}">
                                <a href="{!! route("admin.career_category.index") !!}">
                                    <span>{!! trans("admin_menu.department") !!}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif


                @if(in_array('admin.branch.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/branches*"]) !!}">
                        <a href="{!! route("admin.branch.index") !!}">
                            <i class="material-icons">device_hub</i>
                            <span>{!! trans("admin_menu.branches") !!}</span>
                        </a>
                    </li>
                @endif

                @if(in_array('admin.contact.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/contacts*"]) !!}">
                        <a href="{!! route("admin.contact.index") !!}">
                            <i class="material-icons">contact_mail</i>
                            <span>{!! trans("admin_menu.contacts") !!}</span>
                        </a>
                    </li>
                @endif

                {{--@if(in_array('admin.register.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/register*"]) !!}">--}}
                        {{--<a href="{!! route("admin.register.index") !!}">--}}
                            {{--<i class="material-icons">contact_mail</i>--}}
                            {{--<span>{!! trans("admin_menu.register") !!}</span>--}}
                        {{--</a>--}}
                    {{--</li>--}}
                {{--@endif--}}

                {{--@if(in_array('admin.subscribe.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/subscribe*"]) !!}">--}}
                        {{--<a href="{!! route("admin.subscribe.index") !!}">--}}
                            {{--<i class="material-icons">unsubscribe</i>--}}
                            {{--<span>{!! trans("admin_menu.subscribe") !!}</span>--}}
                        {{--</a>--}}
                    {{--</li>--}}
                {{--@endif--}}

                {{--@if(in_array('admin.rfp.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/rfp*"]) !!}">--}}
                        {{--<a href="{!! route("admin.rfp.index") !!}">--}}
                            {{--<i class="material-icons">contact_phone</i>--}}
                            {{--<span>{!! trans("admin_menu.rfp") !!}</span>--}}
                        {{--</a>--}}
                    {{--</li>--}}
                {{--@endif--}}

                {{--@if(in_array('admin.faq.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/faqs*"]) !!}">--}}
                        {{--<a href="javascript:void(0);" class="menu-toggle">--}}
                            {{--<i class="material-icons">question_answer</i>--}}
                            {{--<span>{!! trans("admin_menu.faqs") !!}</span>--}}
                        {{--</a>--}}
                        {{--<ul class="ml-menu">--}}
                            {{--<li class="{!! currentPageMenu(["*admin/faqs"]) !!}">--}}
                                {{--<a href="{!! route("admin.faq.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.faqs_list") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                            {{--<li class="{!! currentPageMenu(["*admin/faqs/categories*"]) !!}">--}}
                                {{--<a href="{!! route("admin.faq_category.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.categories") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}

                            {{--<li class="{!! currentPageMenu(["*admin/faqs/customer-questions*"]) !!}">--}}
                                {{--<a href="{!! route("admin.faq_question.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.faq_question") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                        {{--</ul>--}}
                    {{--</li>--}}
                {{--@endif--}}


                @if(in_array('admin.partner.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/partners*"]) !!}">
                        <a href="{!! route("admin.partner.index") !!}">
                            <i class="material-icons">people_outline</i>
                            <span>{!! trans("admin_menu.partners") !!}</span>
                        </a>
                    </li>
                @endif

                @if(in_array('admin.team.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/team*"]) !!}">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">supervisor_account</i>
                            <span>{!! trans("admin_menu.team") !!}</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="{!! currentPageMenu(["*admin/team"]) !!}">
                                <a href="{!! route("admin.team.index") !!}">
                                    <span>{!! trans("admin_menu.team_list") !!}</span>
                                </a>
                            </li>
                            <li class="{!! currentPageMenu(["*admin/team/create"]) !!}">
                                <a href="{!! route("admin.team.create") !!}">
                                    <span>{!! trans("admin_menu.team_create") !!}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif

                {{--@if(in_array('admin.image360.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/image360*"]) !!}">--}}
                        {{--<a href="{!! route("admin.image360.index") !!}">--}}
                            {{--<i class="material-icons">filter</i>--}}
                            {{--<span>{!! trans("admin_menu.image360") !!}</span>--}}
                        {{--</a>--}}
                    {{--</li>--}}
                {{--@endif--}}

                {{--@if(in_array('admin.image.map.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/image-maps*"]) !!}">--}}
                        {{--<a href="{!! route("admin.image_map.index") !!}">--}}
                            {{--<i class="material-icons">map</i>--}}
                            {{--<span>{!! trans("admin_menu.image_map") !!}</span>--}}
                        {{--</a>--}}
                    {{--</li>--}}
                {{--@endif--}}

                {{--@if(in_array('admin.book.space.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/booking-spaces*"]) !!}">--}}
                        {{--<a href="{!! route("admin.book_space.index") !!}">--}}
                            {{--<i class="material-icons">done_all</i>--}}
                            {{--<span>{!! trans("admin_menu.book_spaces") !!}</span>--}}
                        {{--</a>--}}
                    {{--</li>--}}
                {{--@endif--}}

                {{--@if(in_array('admin.visit.registration.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu(["*admin/visit-registration*"]) !!}">--}}
                        {{--<a href="{!! route("admin.register_sightseeing.index") !!}">--}}
                            {{--<i class="material-icons">done_all</i>--}}
                            {{--<span>{!! trans("admin_menu.visit_registration") !!}</span>--}}
                        {{--</a>--}}
                    {{--</li>--}}
                {{--@endif--}}

                @if(in_array('admin.slider.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/sliders*"]) !!}">
                        <a href="{!! route("admin.slider.index") !!}">
                            <i class="material-icons">perm_media</i>
                            <span>{!! trans("admin_menu.sliders") !!}</span>
                        </a>
                    </li>
                @endif

                {{--@if(in_array('admin.general.index', $composer_auth_permissions))--}}
                    {{--<li class="{!! currentPageMenu([--}}
                    {{--"*admin/general*",--}}
                    {{--]) !!}">--}}
                        {{--<a href="javascript:void(0);" class="menu-toggle">--}}
                            {{--<i class="material-icons">assignment</i>--}}
                            {{--<span>{!! trans("admin_menu.general") !!}</span>--}}
                        {{--</a>--}}
                        {{--<ul class="ml-menu">--}}
                            {{--<li class="{!! currentPageMenu(["*admin/general/countries*"]) !!}">--}}
                                {{--<a href="{!! route("admin.country.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.countries") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                            {{--<li class="{!! currentPageMenu(["*admin/general/targets*"]) !!}">--}}
                                {{--<a href="{!! route("admin.target.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.targets") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                            {{--<li class="{!! currentPageMenu(["*admin/general/business*"]) !!}">--}}
                                {{--<a href="{!! route("admin.business.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.business") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                            {{--<li class="{!! currentPageMenu(["*admin/general/free-spaces*"]) !!}">--}}
                                {{--<a href="{!! route("admin.free_space.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.free_spaces") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}



                            {{--<li class="{!! currentPageMenu(["*admin/general/career-forms*"]) !!}">--}}
                                {{--<a href="{!! route("admin.career_form.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.career_form") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}

                            {{--<li class="{!! currentPageMenu(["*admin/general/career-levels*"]) !!}">--}}
                                {{--<a href="{!! route("admin.career_level.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.career_level") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}

                            {{--<li class="{!! currentPageMenu(["*admin/general/career-degrees*"]) !!}">--}}
                                {{--<a href="{!! route("admin.career_degree.index") !!}">--}}
                                    {{--<span>{!! trans("admin_menu.career_degree") !!}</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}

                        {{--</ul>--}}
                    {{--</li>--}}
                {{--@endif--}}
                @if(in_array('admin.gallery.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu([
                    "*admin/gallery*",
                    ]) !!}">
                        <a href="{!! route("admin.gallery.index") !!}">
                            <i class="material-icons">perm_media</i>
                            <span>{!! trans("admin_menu.gallery") !!}</span>
                        </a>
                    </li>
                @endif
                <li class="header"></li>

                @if(in_array('admin.user.index', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/users*", '*admin/roles*']) !!}">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">account_box</i>
                            <span>{!! trans("admin_menu.users") !!}</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="{!! currentPageMenu(["*admin/users*"]) !!}">
                                <a href="{!! route("admin.user.index") !!}">
                                    <span>{!! trans("admin_menu.users") !!}</span>
                                </a>
                            </li>
                            <li class="{!! currentPageMenu(["*admin/roles*"]) !!}">
                                <a href="{!! route("admin.role.index") !!}">
                                    <span>{!! trans("admin_menu.roles") !!}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif

                @if(in_array('admin.system.edit', $composer_auth_permissions))
                    <li class="{!! currentPageMenu(["*admin/system*"]) !!}">
                        <a href="{!! route("admin.system.edit", '0110') !!}">
                            <i class="material-icons">settings</i>
                            <span>{!! trans("admin_menu.system") !!}</span>
                        </a>
                    </li>
                @endif

                <li class="{!! currentPageMenu(["*"]) !!} hidden">
                    <a></a>
                </li>
            </ul>
        </div>
        <!-- #Menu -->
        <!-- Footer -->
        <div class="legal">
            <div class="copyright">
                &copy;{!! date("Y") !!} <a href="javascript:void(0);">Admin {{ config('app.name') }}</a>
            </div>
        </div>
        <!-- #Footer -->
    </aside>
    <!-- #END# Left Sidebar -->
</section>
