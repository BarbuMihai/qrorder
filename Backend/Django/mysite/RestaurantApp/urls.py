from django.urls import path

from . import views

app_name = 'RestaurantApp'

urlpatterns = [

    #  rest/
    path('', views.index, name='index'),

    # rest/post
    #  must not include in production
    path('write/', views.post_JSON_django, name='post_JSON_django'),

    #  rest/*table_code*
    path('<str:code>/', views.return_restaurant_data, name='return_restaurant_data'),

]
