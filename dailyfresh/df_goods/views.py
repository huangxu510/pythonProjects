# coding: utf-8
from django.shortcuts import render
from django.core.paginator import Paginator
from .models import *
import random

# Create your views here.
def index(request):

    type_list = TypeInfo.objects.all()

    list = []

    for i in range(1, len(type_list) + 1):
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


def list(request, type_id, current_page_index, sort_type):
    """
    goodlist函数负责展示某类商品的信息。
    :param request: 请求
    :param type_id: 商品类型id
    :param current_page_index: 页码
    :param sort_type: 查询条件id 1为根据id查询 2根据价格查询 3根据点击量查询
    :return: 响应
    """
    goods_list_new = GoodsInfo.objects.all().order_by('-id')[:2]

    # 某种分类的所有商品
    goods_list = GoodsInfo.objects.filter(gtype_id=type_id)
    if sort_type == '1':
        goods_list = goods_list.order_by('-id')
    elif sort_type == '2':
        goods_list = goods_list.order_by('-gprice')
    elif sort_type == '3':
        goods_list == goods_list.order_by('-gclick')

    paginator = Paginator(goods_list, 15)
    # 每页的商品列表
    goods_list = paginator.page(int(current_page_index))

    goods_type = TypeInfo.objects.get(id=type_id)


    contex = {
        'title': '商品列表',
        'guest_cart': 1,
        'type_id': type_id,
        'sort_type': sort_type,
        'goods_list_new': goods_list_new,
        'goods_list': goods_list,
        'page_range': paginator.page_range,
        'current_page_index': int(current_page_index),
        'goods_type': goods_type,
    }
    return render(request, 'df_goods/list.html', contex)


def detail(request, goods_id):

    goods = GoodsInfo.objects.get(pk=int(goods_id))
    goods.gclick = goods.gclick + 1
    goods.save()

    goods_list_new = goods.gtype.goodsinfo_set.order_by('-id')[:2]

    goods_type = goods.gtype

    contex = {
        'title': goods.gtype.tname,
        'guest_cart': 1,
        'is_detail': True,
        'goods': goods,
        'goods_list_new': goods_list_new,
        'goods_type': goods_type,
    }

    return render(request, 'df_goods/detail.html', contex)
