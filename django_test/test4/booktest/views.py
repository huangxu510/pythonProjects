from django.shortcuts import render
from django.http import JsonResponse, HttpResponse
from django.forms.models import model_to_dict
from .models import *

# Create your views here.

def index(request):
    return render(request, 'booktest/index.html')


def pro(request):
    proList = AreaInfo.objects.filter(parea__isnull=True)
    list = []
    for item in proList:
        list.append(model_to_dict(item))

    return JsonResponse({'data': list})
