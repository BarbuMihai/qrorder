from django.db import models


class SubscribedRestaurant(models.Model):
    restaurant_name = models.CharField(max_length=200)
    owner_email = models.EmailField(max_length=200)
    owner_phone_number = models.CharField(max_length=200)
    restaurant_address = models.CharField(max_length=200)
    mentions = models.CharField(max_length=500, default='')

    def __str__(self):
        return self.restaurant_name
