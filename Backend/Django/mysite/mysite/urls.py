from django.contrib import admin
from django.urls import include, path
from django.shortcuts import redirect


urlpatterns = [

    # root -> routes to qrpresentation/
    path('', lambda req: redirect('/qrpresentation/')),

    # qrpresentation/
    path('qrpresentation/', include('presentationSite.urls')),

    # Register Restaurant Application
    path('qrpartners/', include('enroll.urls')),

    # Admin Site
    path('admin/', admin.site.urls),

    # Restaurant Applciation Should return 404 if accessed
    path('rest/', include('RestaurantApp.urls')),


    # To be deleted when in production
    path('polls2/', include('polls2.urls')),

]
