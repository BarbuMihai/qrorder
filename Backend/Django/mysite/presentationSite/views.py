import os
from django.shortcuts import render
from django.http import HttpResponse
from django.http import HttpResponseRedirect

root = os.path.normpath('presentationSite')
presentation_html = os.path.join(root, 'presentationPage.html')
template_html = os.path.join(root, "templatePage.html")
download_html = os.path.join(root, "downloadPage.html")


def presentationPage(request):
    if request.method == 'POST':
        return HttpResponse("Move along please :)")

    elif request.method == 'GET':
        return render(request, presentation_html)


def templatePage(request):
    if request.method == 'POST':
        return HttpResponse("Move along please :)")

    elif request.method == 'GET':
        return render(request, template_html)


def downloadPage(request):
    if request.method == 'POST':
        return HttpResponse("Move along please :)")

    elif request.method == 'GET':
        return render(request, download_html)


def rootRedirect(request):
    if request.method == 'POST':
        return HttpResponse("Move along please :)")

    elif request.method == 'GET':
        return HttpResponseRedirect('/')
