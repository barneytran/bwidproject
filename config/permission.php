<?php
return [
    'permission' => [
        'model' => 'Admin',
        'permissions' => [
            'admin.index' => 'Truy cập'
        ]
    ],

    'project_category' => [
        'model' => 'Danh mục dự án',
        'permissions' => [
            'admin.project.category.index' => 'Truy cập',
            'admin.project.category.create' => 'Tạo',
            'admin.project.category.edit' => 'Sửa',
            'admin.project.category.destroy' => 'Xóa'
        ]
    ],

    'project' => [
        'model' => 'Dự án',
        'permissions' => [
            'admin.project.index' => 'Truy cập',
            'admin.project.create' => 'Tạo',
            'admin.project.edit' => 'Sửa',
            'admin.project.destroy' => 'Xóa',
        ]
    ],

//    'product_category' => [
//        'model' => 'Product category',
//        'permissions' => [
//            'admin.product.category.index' => 'Product category index',
//            'admin.product.category.create' => 'Create product category',
//            'admin.product.category.edit' => 'Edit product category',
//            'admin.product.category.destroy' => 'Delete product category',
//        ]
//    ],

//    'product' => [
//        'model' => 'Sản phẩm',
//        'permissions' => [
//            'admin.product.index' => 'Truy cập',
//            'admin.product.create' => 'Tạo',
//            'admin.product.edit' => 'Sửa',
//            'admin.product.destroy' => 'Xóa'
//        ]
//    ],

    'news_category' => [
        'model' => 'Loại tin tức',
        'permissions' => [
            'admin.news.category.index' => 'Truy cập',
            'admin.news.category.create' => 'Tạo',
            'admin.news.category.edit' => 'Sửa',
            'admin.news.category.destroy' => 'Xóa'
        ]
    ],

    'news' => [
        'model' => 'Tin tức',
        'permissions' => [
            'admin.news.index' => 'Truy cập',
            'admin.news.create' => 'Tạo',
            'admin.news.edit' => 'Sửa',
            'admin.news.destroy' => 'Xóa',
        ]
    ],

    'service' => [
        'model' => 'Dịch vụ',
        'permissions' => [
            'admin.service.index' => 'Truy cập',
            'admin.service.create' => 'Tạo',
            'admin.service.edit' => 'Sửa',
            'admin.service.destroy' => 'Xóa',
        ]
    ],

    'brochures' => [
        'model' => 'Tài liệu quảng cáo',
        'permissions' => [
            'admin.brochures.index' => 'Truy cập',
            'admin.brochures.create' => 'Tạo',
            'admin.brochures.edit' => 'Sửa',
            'admin.brochures.destroy' => 'Xóa',
        ]
    ],



    'theme' => [
        'model' => 'Bản mẫu',
        'permissions' => [
            'admin.theme.index' => 'Truy cập',
            'admin.theme.create' => 'Tạo',
            'admin.theme.edit' => 'Sửa',
            'admin.theme.destroy' => 'Xóa',
        ]
    ],

    'page' => [
        'model' => 'Trang',
        'permissions' => [
            'admin.page.index' => 'Truy cập',
            'admin.page.create' => 'Tạo',
            'admin.page.edit' => 'Sửa',
            'admin.page.destroy' => 'Xóa'
        ]
    ],

    'career' => [
        'model' => 'Tuyển dụng',
        'permissions' => [
            'admin.career.index' => 'Truy cập',
            'admin.career.create' => 'Tạo',
            'admin.career.edit' => 'Sửa',
            'admin.career.destroy' => 'Xóa',
            'admin.career.application' => 'Ứng tuyển'
        ]
    ],

    'branch' => [
        'model' => 'Branch',
        'permissions' => [
            'admin.branch.index' => 'Branch index',
            'admin.branch.create' => 'Create branch',
            'admin.branch.edit' => 'Edit branch',
            'admin.branch.destroy' => 'Delete branch'
        ]
    ],

    'contact' => [
        'model' => 'Liên hệ',
        'permissions' => [
            'admin.contact.index' => 'Truy cập',
            'admin.contact.destroy' => 'Xóa'
        ]
    ],

    'register' => [
        'model' => 'Đăng ký theo dõi',
        'permissions' => [
            'admin.register.index' => 'Truy cập',
            'admin.register.destroy' => 'Xóa'
        ]
    ],

    'subscribe' => [
        'model' => 'Subscribe',
        'permissions' => [
            'admin.subscribe.index' => 'Truy cập',
            'admin.subscribe.destroy' => 'Xóa'
        ]
    ],


//    'rfp' => [
//        'model' => 'Rfp',
//        'permissions' => [
//            'admin.rfp.index' => 'Truy cập',
//            'admin.rfp.destroy' => 'Xóa'
//        ]
//    ],

//    'faq' => [
//        'model' => 'FAQs',
//        'permissions' => [
//            'admin.faq.index' => 'Truy cập',
//            'admin.faq.create' => 'Tạo',
//            'admin.faq.edit' => 'Sửa',
//            'admin.faq.destroy' => 'Xóa'
//        ]
//    ],

//    'image360' => [
//        'model' => 'Image 360',
//        'permissions' => [
//            'admin.image360.index' => 'Image 360 index',
//            'admin.image360.create' => 'Create image 360',
//            'admin.image360.edit' => 'Edit image 360',
//            'admin.image360.destroy' => 'Delete image 360'
//        ]
//    ],

    'slider' => [
        'model' => 'Băng rôn',
        'permissions' => [
            'admin.slider.index' => 'Truy cập',
            'admin.slider.create' => 'Tạo',
            'admin.slider.edit' => 'Sửa',
            'admin.slider.destroy' => 'Xóa'
        ]
    ],

//    'image_map' => [
//        'model' => 'Bản đồ hình ảnh',
//        'permissions' => [
//            'admin.image.map.index' => 'Truy cập',
//            'admin.image.map.create' => 'Tạo',
//            'admin.image.map.edit' => 'Sửa',
//            'admin.image.map.destroy' => 'Xóa',
//        ]
//    ],

    'partner' => [
        'model' => 'Đối tác',
        'permissions' => [
            'admin.partner.index' => 'Truy cập',
            'admin.partner.create' => 'Tạo',
            'admin.partner.edit' => 'Sửa',
            'admin.partner.destroy' => 'Xóa'
        ]
    ],

    'team' => [
        'model' => 'Đội ngũ',
        'permissions' => [
            'admin.team.index' => 'Truy cập',
            'admin.team.create' => 'Tạo',
            'admin.team.edit' => 'Sửa',
            'admin.team.destroy' => 'Xóa'
        ]
    ],

//    'book_space' => [
//        'model' => 'Đăng ký đặt chỗ',
//        'permissions' => [
//            'admin.book.space.index' => 'Truy cập',
//            'admin.book.space.show' => 'Hiển thị',
//            'admin.book.space.destroy' => 'Xóa'
//        ]
//    ],

//    'visit_registration' => [
//        'model' => 'Đăng ký tham quan',
//        'permissions' => [
//            'admin.visit.registration.index' => 'Truy cập',
//            'admin.visit.registration.show' => 'Hiển thị',
//            'admin.visit.registration.destroy' => 'Xóa'
//        ]
//    ],

    'general' => [
        'model' => 'Thông tin chung',
        'permissions' => [
            'admin.general.index' => 'Truy cập',
            'admin.general.create' => 'Tạo',
            'admin.general.edit' => 'Sửa',
            'admin.general.destroy' => 'Xóa'
        ]
    ],

    'user' => [
        'model' => 'Tài khoản',
        'permissions' => [
            'admin.user.index' => 'Truy cập',
            'admin.user.create' => 'Tạo',
            'admin.user.edit' => 'Sửa',
            'admin.user.destroy' => 'Xóa',
            'admin.user.set.permission' => 'Cấp quyền'
        ]
    ],

    'role' => [
        'model' => 'Vai trò',
        'permissions' => [
            'admin.role.index' => 'Truy cập',
            'admin.role.create' => 'Tạo',
            'admin.role.edit' => 'Sửa',
            'admin.role.destroy' => 'Xóa'
        ]
    ],

    'system' => [
        'model' => 'Hệ thống',
        'permissions' => [
            'admin.system.edit' => 'Sửa',
        ]
    ],

    'activity' => [
        'model' => 'Hoạt động',
        'permissions' => [
            'admin.activity.index' => 'Truy cập',
        ]
    ],

    'gallery' => [
        'model' => 'Thư viện ảnh/video',
        'permissions' => [
            'admin.gallery.index' => 'Truy cập',
            'admin.gallery.create' => 'Tạo',
            'admin.gallery.edit' => 'Sửa',
            'admin.gallery.destroy' => 'Xóa'
        ]
    ],

//    'catalogue' => [
//        'model' => 'Catalogue',
//        'permissions' => [
//            'admin.catalogue.index' => 'Truy cập',
//            'admin.catalogue.create' => 'Tạo',
//            'admin.catalogue.edit' => 'Sửa',
//            'admin.catalogue.destroy' => 'Xóa'
//        ]
//    ],
];
