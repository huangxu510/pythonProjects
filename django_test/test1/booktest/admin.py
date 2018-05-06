# coding: utf-8

from django.contrib import admin
from .models import *

class HeroInfoInline(admin.TabularInline):
    model = HeroInfo
    extra = 3

class BookInfoAdmin(admin.ModelAdmin):
    # 定义要显示的字段
    list_display = ['id', 'btitle', 'bpub_date']
    list_filter = ['btitle']
    search_fields = ['btitle']
    list_per_page = 10
    fieldsets = [
        ('base', {'fields': ['btitle']},),
        ('more', {'fields': ['bpub_date']})
    ]

    inlines = [HeroInfoInline]


# Register your models here.
admin.site.register(BookInfo, BookInfoAdmin)
admin.site.register(HeroInfo)
