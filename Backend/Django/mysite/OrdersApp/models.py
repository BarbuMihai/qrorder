from django.db import models
from RestaurantApp.models import MenuItem, TableId


class OrderModel(models.Model):
    PAYMENT_OPTIONS = (
        ('Card', 'Card'),
        ('Cash', 'Cash'),
        ('App Payment', 'App Payment'),
    )
    table = models.ForeignKey(TableId, on_delete=models.CASCADE)
    requested_payment = models.BooleanField(default=False)
    payment_method = models.CharField(default='', choices=PAYMENT_OPTIONS, max_length=12)

    def __str__(self):
        return self.table.restaurant.restaurant_name + ' -- ' + \
               self.table.table_unique_code + \
               ' -- ID: ' + str(self.id)


class FoodItems(models.Model):
    order = models.ForeignKey(OrderModel, on_delete=models.CASCADE)
    food = models.ForeignKey(MenuItem, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.order.table.table_unique_code + \
               ' -- ' + \
               self.food.food_name + \
               ' -- quantity: ' + \
               str(self.quantity) + \
               ' ( Order ID: ' + str(self.order.id) + ' )'
