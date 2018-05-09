# coding: utf-8
from django.db import models
from tinymce.models import HTMLField

# Create your models here.
class TypeInfo(models.Model):
    tname = models.CharField(max_length=20)
    isDeleted = models.BooleanField(default=False)

    def __str__(self):
        return self.tname.encode('utf-8')

class GoodsInfo(models.Model):
    gname = models.CharField(max_length=20, default='湾仔码头水饺')
    gimage = models.ImageField(upload_to='df_goods')
    gprice = models.DecimalField(max_digits=10, decimal_places=2, default=3.5)
    gunit = models.CharField(max_length=20, default='500g')
    gclick = models.IntegerField(default=0)
    ginventory = models.IntegerField(default=9999)
    gbrief_introduction = models.CharField(max_length=200, default='草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。')
    gdetailed_introduction = HTMLField()
    gtype = models.ForeignKey(TypeInfo)
    isDeleted = models.BooleanField(default=False)

    def __str__(self):
        return self.gname.encode('utf-8')


