# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('gname', models.CharField(max_length=20)),
                ('gimage', models.ImageField(upload_to=b'df_goods')),
                ('gprice', models.DecimalField(max_digits=10, decimal_places=2)),
                ('gunit', models.CharField(default=b'500g', max_length=20)),
                ('gclick', models.IntegerField()),
                ('gbrief_introduction', models.CharField(max_length=200)),
                ('ginventory', models.IntegerField()),
                ('gdetailed_introduction', tinymce.models.HTMLField()),
                ('isDeleted', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='TypeInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tname', models.CharField(max_length=20)),
                ('isDeleted', models.BooleanField(default=False)),
            ],
        ),
        migrations.AddField(
            model_name='goodsinfo',
            name='gtype',
            field=models.ForeignKey(to='df_goods.TypeInfo'),
        ),
    ]
