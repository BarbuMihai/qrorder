from django.db import models
from RestaurantApp.models import Restaurant, TableId


# class OrderModel(models.Model):
#     restaurant_name = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
#     table_name = models.ForeignKey(TableId, on_delete=models.CASCADE)