# coding: utf-8
from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from .models import *
from hashlib import sha1

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
    return JsonResponse({'count': count})




