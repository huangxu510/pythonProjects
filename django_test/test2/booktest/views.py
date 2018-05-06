# coding: utf-8
from django.shortcuts import render
from .models import *
from django.db.models import Max, F, Q

# Create your views here.
def index(request):
    # list = BookInfo.books1.filter(pk__lte=4)
    max1 = BookInfo.books1.aggregate(Max('bpub_date'))
    # list = BookInfo.books1.filter(bread__gt=F('bcommet'))
    # list = BookInfo.books1.filter(pk__lt=4, btitle__contains='江')
    # list = BookInfo.books1.filter(pk__lt=4).filter(btitle__contains='江')
    list = BookInfo.books1.filter(Q(pk__lt=4) | Q(btitle__contains='q'))
    context = {'list': list,
               'max1': max1}
    return render(request, 'booktest/index.html', context)

