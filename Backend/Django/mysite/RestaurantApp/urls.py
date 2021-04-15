from django.urls import path

from . import views

app_name = 'RestaurantApp'

urlpatterns = [

    path('<str:code>/', views.index, name='index'),

]
