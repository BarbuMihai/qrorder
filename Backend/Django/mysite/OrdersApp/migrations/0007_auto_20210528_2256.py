# Generated by Django 3.1.7 on 2021-05-28 19:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('OrdersApp', '0006_auto_20210528_2244'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ordermodel',
            name='payment_method',
            field=models.CharField(choices=[('Card', 'Card'), ('Cash', 'Cash'), ('App Payment', 'App Payment')], default='', max_length=12),
        ),
    ]