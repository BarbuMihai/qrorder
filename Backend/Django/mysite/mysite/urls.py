from django.contrib import admin
from django.urls import include, path
from django.shortcuts import redirect


urlpatterns = [
    path('', lambda req: redirect('/qrpresentation/')),  # root -> routes to qrpresentation/
    path('qrpresentation/', include('presentationSite.urls')),  # qrpresentation/
    path('qrpartners/', include('enroll.urls')),
    path('admin/', admin.site.urls),

    # To be deleted when in production
    path('rest/', include('RestaurantApp.urls')),
    path('polls/', include('polls.urls')),

]
