# coding: utf-8
from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from .models import *
from df_goods.models import *
from hashlib import sha1
from . import user_decorator

# Create your views here.
def register(request):
    return render(request, 'df_user/register.html')


def register_handle(request):
    # 接受用户输入
    post = request.POST
    user_name = post.get('user_name')
    pwd = post.get('pwd')
    cpwd = post.get('cpwd')
    email = post.get('email')

    # 判断两次密码
    if pwd != cpwd:
        return redirect('/user/register/')

    # sha1加密
    s1 = sha1()
    s1.update(pwd)
    pwd_sha1 = s1.hexdigest()

    user = UserInfo()
    user.uname = user_name
    user.upwd = pwd_sha1
    user.uemail = email
    user.save()

    return redirect('/user/login/')

# 判断用户是否已经存在
def register_exist(request):
    uname = request.GET.get('uname')
    count = UserInfo.objects.filter(uname=uname).count()
    return JsonResponse({'exist': count==1})


def login(request):
    user_name = request.COOKIES.get('user_name', '')
    context = {'title': '天天生鲜-用户登录', 'error_name': 0, 'error_pwd': 0, 'user_name': user_name}
    return render(request, 'df_user/login.html', context)


def login_handle(request):
    post = request.POST
    user_name = post.get('user_name')
    pwd = post.get('pwd')
    remember = post.get('remember', 0)

    users = UserInfo.objects.filter(uname=user_name)

    if len(users) == 1:
        s1 = sha1()
        s1.update(pwd)
        if s1.hexdigest() == users[0].upwd:
            url = request.COOKIES.get('url', '/')
            red = HttpResponseRedirect(url)
            if remember != 0:
                red.set_cookie('user_name', user_name)
            else:
                red.set_cookie('user_name', '', max_age=-1)
            request.session['user_name'] = user_name
            request.session['user_id'] = users[0].id
            return red
        else:
            contex = {'title': '用户登录',
                      'error_name': 0,
                      'error_pwd': 1}
            return render(request, 'df_user/login.html', contex)
    else:
        contex = {'title': '用户登录',
                  'error_name': 1,
                  'error_pwd': 0}
        return render(request, 'df_user/login.html', contex)


def logout(request):
    request.session.flush()
    return redirect('/')


@user_decorator.is_login
def info(request):
    user_id = request.session['user_id']
    user = UserInfo.objects.get(id=user_id)

    history_key = '%s_goods_history' % user_id
    history_id_list = request.COOKIES.get(history_key, '').split(',')
    history_list = []
    for id in history_id_list:
        goods = GoodsInfo.objects.get(id=id)
        history_list.append(goods)


    context = {
        'title': '用户中心',
        'page_name': 1,
        'shopping_cart': 0,
        'info': 1,
        'user': user,
        'history_list': history_list,
    }
    return render(request, 'df_user/user_center_info.html', context)


@user_decorator.is_login
def order(request):
    context = {
        'title': '用户中心',
        'page_name': 1,
        'shopping_cart': 0,
        'order': 1,
    }
    return render(request, 'df_user/user_center_order.html', context)


@user_decorator.is_login
def site(request):
    user = UserInfo.objects.get(id=request.session['user_id'])
    context = {
        'title': '用户中心',
        'page_name': 1,
        'shopping_cart': 0,
        'site': 1,
        'user': user,
    }
    return render(request, 'df_user/user_center_site.html', context)


def info_submit(request):
    user = UserInfo.objects.get(id=request.session['user_id'])
    user.uaddressee = request.GET['addressee']
    user.uaddress = request.GET['address']
    user.uphone = request.GET['phone']
    user.upostcode = request.GET['postcode']
    user.save()
    return redirect('/user/site/')