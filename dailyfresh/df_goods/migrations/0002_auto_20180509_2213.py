# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('df_goods', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='typeinfo',
            name='timage',
            field=models.ImageField(upload_to=b'df_types', blank=True),
        ),
        migrations.AlterField(
            model_name='goodsinfo',
            name='gclick',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='goodsinfo',
            name='ginventory',
            field=models.IntegerField(default=9999),
        ),
    ]
