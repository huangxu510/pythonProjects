from django.contrib import admin
from .models import *

# Register your models here.



class TypeInfoAdmin(admin.ModelAdmin):
    list_display = ['id', 'tname']


class GoodsInfoAdmin(admin.ModelAdmin):
    list_display = ['id', 'gname', 'gprice', 'gunit', 'ginventory', 'gtype', 'isDeleted']
    list_per_page = 15


admin.site.register(TypeInfo, TypeInfoAdmin)
admin.site.register(GoodsInfo, GoodsInfoAdmin)