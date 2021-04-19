from django.urls import path

from . import views

app_name = 'polls2'

urlpatterns = [

    path('', views.index, name='index'),

    # ex: /polls2/5/
    path('<int:question_id>/', views.detail, name='detail'),

    # ex: /polls2/5/results/
    path('results/<int:question_id>/', views.results, name='results'),

    # ex: /polls2/5/vote/
    path('vote/<int:question_id>/', views.vote, name='vote'),

]
