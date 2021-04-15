# import admin
from django.urls import path
from . import views


app_name = 'qrpartners'

urlpatterns = [
    # /qrpartners/register
    path('register/', views.registerRestaurantPage, name='registerRestaurantPage'),

    path('register/success/', views.redirect_successful_form, name='redirect_successful_form'),

    # /qrpartners/*restaurant_name* -> will load a presentation page for each QR Restaurant
]