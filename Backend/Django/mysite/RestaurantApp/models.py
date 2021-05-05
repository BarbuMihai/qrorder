from django.db import models


class Restaurant(models.Model):
    restaurant_name = models.CharField(max_length=100)
    address = models.CharField(max_length=200)
    schedule_start = models.TimeField()
    schedule_end = models.TimeField()
    total_tables = models.IntegerField(default=1)
    restaurant_description = models.TextField(default='')

    def __str__(self):
        return self.restaurant_name + " ( id: " + str(self.id) + " )"


class TableId(models.Model):
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
    table_number = models.IntegerField(default=0)
    table_unique_code = models.CharField(default='', max_length=6)
    table_capacity = models.IntegerField(default=0)
    smoking_allowed = models.BooleanField(default=False)

    def __str__(self):
        return str(self.table_number) + ' ( {0} ) '.format(self.restaurant.restaurant_name) + \
               '( {0} )'.format(self.table_unique_code)


class FoodCategory(models.Model):
    food_category_name = models.CharField(max_length=30)
    restaurant = models.ManyToManyField(Restaurant, blank=True)

    def __str__(self):
        return str(self.food_category_name)


class MenuItem(models.Model):
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE, default=1)
    food_category = models.ForeignKey(FoodCategory, on_delete=models.CASCADE)
    food_name = models.CharField(max_length=50)
    food_calories = models.PositiveIntegerField()
    food_weight = models.PositiveIntegerField()
    food_price = models.PositiveIntegerField()

    def __str__(self):
        return self.food_name + ' (' + self.restaurant.restaurant_name + ')'


class FoodIngredient(models.Model):
    food_item = models.ForeignKey(MenuItem, on_delete=models.CASCADE)
    ingredient_name = models.CharField(max_length=50)
    ingredient_quantity = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.ingredient_name + ' (' + self.food_item.food_name + ')'


class FoodAllergen(models.Model):
    allergen_name = models.CharField(max_length=50)
    food_item = models.ManyToManyField(MenuItem, blank=True)

    def __str__(self):
        return self.allergen_name
