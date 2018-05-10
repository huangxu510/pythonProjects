# coding: utf-8
from django.shortcuts import render
from .models import *

# Create your views here.
def index(request):

    type_list = TypeInfo.objects.all()

    list = []

    for i in range(1, 7):
        goods_list_new = GoodsInfo.objects.filter(gtype__id=i).order_by('-id')[:4]
        goods_list_hot = GoodsInfo.objects.filter(gtype__id=i).order_by('-gclick')[:3]
        type = type_list[i-1]
        dict = {
            'type': type,
            'goods_list_new': goods_list_new,
            'goods_list_hot': goods_list_hot
        }
        list.append(dict)

    context = {
        'title': '天天生鲜-首页',
        'page_name': 0,
        'shopping_cart': 1,
        'list': list
    }
    return render(request, 'df_goods/index.html', context)


def list(request, type_id, page, sort_type):
    """
    goodlist函数负责展示某类商品的信息。
    :param request: 请求
    :param type_id: 商品类型id
    :param page: 页码
    :param sort_type: 查询条件id 1为根据id查询 2根据价格查询 3根据点击量查询
    :return: 响应
    """

    goods_list = GoodsInfo.objects.filter(gtype_id=type_id)
    if sort_type == '1':
        goods_list = goods_list.order_by('-id')
    elif sort_type == '2':
        goods_list = goods_list.order_by('-gprice')
    elif sort_type == '3':
        goods_list == goods_list.order_by('-gclick')

    contex = {
        'title': '商品详情',
        'goods_list': goods_list,
    }
    return render(request, 'df_goods/list.html', contex)