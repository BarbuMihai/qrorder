from django.db import models

from RestaurantApp.models import Restaurant


class Staff(models.Model):
    genders = (
        ('F', 'Feminine'),
        ('M', 'Masculine'),
    )
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
    staff_first_name = models.CharField(max_length=30)
    staff_last_name = models.CharField(max_length=30)

    staff_position = models.CharField(max_length=50)
    employment_date = models.DateField(default='')

    staff_phone = models.CharField(max_length=20, default='')
    staff_email = models.EmailField(default='')
    staff_gender = models.CharField(max_length=20, choices=genders)

    def __str__(self):
        return self.staff_first_name + ' ' + \
               self.staff_last_name + ' -- ' + \
               self.staff_position + \
               ' -- {0}'.format(self.restaurant.restaurant_name)
