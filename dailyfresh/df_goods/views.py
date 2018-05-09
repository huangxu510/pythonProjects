# coding: utf-8
from django.shortcuts import render
from .models import *

# Create your views here.
def index(request):

    type_list = TypeInfo.objects.all()

    list = []
    list2 = []
    for i in range(1, 7):
        goods_list_new = GoodsInfo.objects.filter(gtype__id=i).order_by('-id')[:4]
        goods_list_hot = GoodsInfo.objects.filter(gtype__id=i).order_by('-gclick')[:3]

        list.append(goods_list_new)
        list2.append(goods_list_hot)


    context = {'title': '天天生鲜-首页',
               'page_name': 0,
               'shopping_cart': 1,
               'type_list': type_list,
               'goods_list_new': list,
               'goods_list_hot': list2}
    return render(request, 'df_goods/index.html', context)