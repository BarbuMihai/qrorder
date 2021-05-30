from django.urls import path

from . import views

app_name = 'OrdersApi'

urlpatterns = [
    #  orderapi/
    path('', views.index, name='index'),

    path('payment/', views.request_payment, name='request_payment'),

]