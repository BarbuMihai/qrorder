from django.contrib import admin

from .models import OrderModel, FoodItems

admin.site.register(OrderModel)
admin.site.register(FoodItems)
