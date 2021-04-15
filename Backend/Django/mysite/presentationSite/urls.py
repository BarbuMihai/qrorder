# import admin
from django.urls import path
from . import views


app_name = 'presentationSite'

urlpatterns = [
    # /
    path('', views.presentationPage, name='presentationPage'),
    path('template/', views.templatePage, name='templatePage'),
    path('download/', views.downloadPage, name='downloadPage'),
]