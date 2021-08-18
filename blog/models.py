from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField

class Post(models.Model):
    title = models.CharField(max_length=255)
    slug = models.SlugField()
    intro = models.TextField()
    body = RichTextField(config_name='default')
    date_added = models.DateTimeField(auto_now_add=True)
    upload_file = RichTextUploadingField(blank=True, null=True)

    class Meta:
        ordering = ['-date_added']