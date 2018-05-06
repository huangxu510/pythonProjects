from django.db import models

class BookInfoManager(models.Manager):
    def get_queryset(self):
        return super(BookInfoManager, self).get_queryset().filter(isDeleted=False)

    def create(self, btitle, bpub_date):
        b = BookInfo()
        b.btitle = btitle
        b.bpub_date = bpub_date
        b.bread = 0
        b.bcommet = 0
        b.isDeleted = False
        return b

# Create your models here.
class BookInfo(models.Model):
    btitle = models.CharField(max_length=20)
    bpub_date = models.DateTimeField(db_column='pub_date')
    bread = models.IntegerField(default=0)
    bcommet = models.IntegerField(null=False, default=0)
    isDeleted = models.BooleanField(default=False)
    class Meta:
        db_table = 'bookinfo'
    books1 = models.Manager()
    books2 = BookInfoManager()

    # @classmethod
    # def create(cls, btitle, bpub_date):
    #     b = BookInfo()
    #     b.btitle = btitle
    #     b.bpub_date = bpub_date
    #     b.bread = 0
    #     b.bcommet = 0
    #     b.isDeleted = False
    #     return b

class HeroInfo(models.Model):
    hname = models.CharField(max_length=10)
    hgender = models.BooleanField(default=True)
    hcontent = models.CharField(max_length=1000)
    isDeleted = models.BooleanField(default=False)
    book = models.ForeignKey(BookInfo)


class AreaInfo(models.Model):
    title = models.CharField(max_length=20)
    parea = models.ForeignKey('self', null=True, blank=True)