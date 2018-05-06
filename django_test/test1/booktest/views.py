# coding: utf-8
from django.shortcuts import render
from django.http import *
from .models import *
# from django.template import RequestContext, loader

# Create your views here.
def index(request):
    # 加载模板
    # temp = loader.get_template('booktest/index.html')
    # 将模板内容返回给浏览器
    # return HttpResponse(temp.render())
    bookList = BookInfo.objects.all()
    context = {'title': 'hello', 'list': bookList}
    return render(request, 'booktest/index.html', context)

def show(request, bookId):

    book = BookInfo.objects.get(pk=bookId)
    heroList = book.heroinfo_set.all()
    context = {'list': heroList}
    return render(request, 'booktest/show.html', context)