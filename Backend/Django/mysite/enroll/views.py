import os

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.template import loader
from .forms import EnrollResturantForm

register_form = os.path.join('enroll', 'register_restaurant_form.html')
successful_submit = os.path.join('enroll', 'successful_Form.html')


def registerRestaurantPage(request):
    if request.method == 'POST':
        form = EnrollResturantForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('success/')
        else:
            print("NOT VALID")
        context = {
            'form': form,
        }
        return render(request, register_form, context)

    elif request.method == 'GET':
        form = EnrollResturantForm()
        context = {
            'form': form,
        }
        return render(request, register_form, context)
    # print(form.fields['restaurant_name'].label)
    # ff = list(form.fields)
    # print(ff[0])
    # return HttpResponse('THX')
    # labels_dict = {}
    # for model_name in form.fields:
    #         labels_dict[model_name] = form.fields[model_name].label
    # # print(labels_dict)

    # form = EnrollResturantForm()
    # if request.method == 'POST':
    #     # form = EnrollResturantForm(request.POST)
    #     if form.is_valid():
    #         form.save()
    #     context = {
    #         'form': form,
    #     }
    #     return render(request, register_form, context)
    # else
    #     HttpResponse("DA")


def redirect_successful_form(request):
    return render(request, successful_submit)