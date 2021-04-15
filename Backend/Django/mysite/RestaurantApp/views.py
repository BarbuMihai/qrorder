from django.shortcuts import render
from .models import *
from django.shortcuts import HttpResponse
from django.http import Http404


def index(request, code):
    try:
        table_details = TableId.objects.get(table_unique_code=code)

        return HttpResponse('Capacity is:' + str(table_details.restaurant))
    except TableId.DoesNotExist:
        raise Http404("TableId does not exist")
