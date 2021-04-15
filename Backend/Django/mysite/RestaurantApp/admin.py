from django.contrib import admin

from .models import *

admin.site.register(Restaurant)
admin.site.register(TableId)
admin.site.register(FoodCategory)
admin.site.register(MenuItem)
admin.site.register(FoodIngredient)
admin.site.register(FoodAllergen)
