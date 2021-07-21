from django.shortcuts import render
from .models import *
from django.shortcuts import HttpResponse
from django.http import Http404, JsonResponse, HttpResponseNotFound
from RestaurantApp.RestaurantFunctions import RestaurantInterface
from django.http import HttpResponseNotAllowed

from django.views.decorators.csrf import csrf_exempt

from django.middleware.csrf import get_token


# import time

def index(request):
    return HttpResponse('Index')


@csrf_exempt
def return_restaurant_data(request, code):
    try:
        if request.method == 'GET':
            # time.sleep(2)
            return JsonResponse(data=RestaurantInterface.create_Restaurant_JSON_data(code))
        if request.method == 'POST':
            # get_token(request)
            return HttpResponseNotAllowed('Not allowed')
    except TableId.DoesNotExist:
        return HttpResponseNotFound()


# in order to post to the server the header of the request ust contain
def post_JSON_django(request):
    if request.method == "GET":
        get_token(request)
        response = HttpResponse("CSRF token sent")
        return response

    if request.method == "POST":
        return HttpResponseNotAllowed('Not Allowed')
