# Generated by Django 3.1.7 on 2021-04-06 18:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('RestaurantApp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='menuitem',
            name='restaurant',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='RestaurantApp.restaurant'),
            preserve_default=False,
        ),
    ]
