from .models import *
import random
import string
import json
import pprint


# TODO Perform check to be sure table code is unique

class RestaurantInterface:

    @staticmethod
    def initialize_restaurant(name, table_number, address, schedule_start, schedule_end):
        """
        Creates Restaurant and then Creates Tables for it
        Schedule and Address to be added
        """
        new_rest = Restaurant(restaurant_name=name,
                              address=address,
                              schedule_start=schedule_start,
                              schedule_end=schedule_end,
                              total_tables=table_number)

        new_rest.save()

        for table in range(1, table_number + 1):
            generated_code = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
            TableId(restaurant=new_rest,
                    table_number=table,
                    table_unique_code=generated_code,
                    table_capacity=2,
                    smoking_allowed=False).save()

        print("--------------------------------------------------------------------")
        print("\"{0}\" Restaurant added Tables !".format(name))
        print("--------------------------------------------------------------------")

    @staticmethod
    def initialize_tables(rest_id):
        try:
            rest = Restaurant.objects.filter(id=rest_id)[0]
            tables_rest = TableId.objects.filter(restaurant_id=rest_id)
            # generated_code = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
            if not tables_rest.exists():
                for table in range(1, rest.total_tables + 1):
                    generated_code = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
                    TableId(restaurant=rest,
                            table_number=table,
                            table_unique_code=generated_code,
                            table_capacity=2,
                            smoking_allowed=False).save()
                print("--------------------------------------------------------------------")
                print('Restaurant Tables initialised\nManually add tables capacities!')
                print("--------------------------------------------------------------------")
            else:
                print("--------------------------------------------------------------------")
                print("Tables already created!")
                print("--------------------------------------------------------------------")

        except IndexError:
            print("--------------------------------------------------------------------")
            print('No such Restaurant with ID = {0}'.format(rest_id))
            print("--------------------------------------------------------------------")

    @staticmethod
    def create_Restaurant_JSON_data(table_code):
        # Acquire needed objects
        table_object = TableId.objects.get(table_unique_code=table_code)
        restaurant_object = table_object.restaurant

        restaurant_name = restaurant_object.restaurant_name  # Restaurant_name
        table_index = table_object.table_number  # Table Number
        smoking_permission = table_object.smoking_allowed
        restaurant_description = restaurant_object.restaurant_description

        # gets all food categories of the restaurant (by id) and stores in querySet
        food_categories_querySet = FoodCategory.objects.filter(restaurant=restaurant_object.id)

        # gets all food items of the restaurant (by id) and stores in querySet
        all_food_objects_in_menu = MenuItem.objects.filter(restaurant=restaurant_object.id)

        # Create JSON restaurant data return Object
        ret_dict = {
            'restaurant_name': restaurant_name,
            'table_index': table_index,
            'smoking_allowed': smoking_permission,
            'restaurant_description': restaurant_description,
            'menu_categories': [],
        }

        for fc in food_categories_querySet:
            food_per_category = all_food_objects_in_menu.filter(food_category=fc)
            food_list = []
            for mi in food_per_category:
                food = {'item_name': mi.food_name, 'item_calories': mi.food_calories, 'item_weight': mi.food_weight,
                        'item_price': mi.food_price, 'ingredients': [], 'allergen': []}

                ingredient_list_per_food = FoodIngredient.objects.filter(food_item=mi)
                for ing in ingredient_list_per_food:
                    food['ingredients'].append(ing.ingredient_name)

                allergen_list_per_food = FoodAllergen.objects.filter(food_item=mi)
                for alg in allergen_list_per_food:
                    food['allergen'].append(alg.allergen_name)

                food_list.append(food)

            food_categ = {
                        'menu_category_name': fc.food_category_name,
                        'items_list': food_list
            }
            ret_dict['menu_categories'].append(food_categ)
        return ret_dict


#######################################################################################################################
#######################################################################################################################

        # old_ret_dict = {
        #     'restaurant_name': restaurant_name,
        #     'table_index': table_index,
        #     'smoking_allowed': smoking_permission,
        #     'restaurant_description': restaurant_description,
        #     'food_category': {},
        # }
        #
        # for fc in food_categories_querySet:
        #     food_per_category = all_food_objects_in_menu.filter(food_category=fc)
        #
        #     ret_dict['food_category'][fc.food_category_name] = {}
        #     for mi in food_per_category:
        #         menu_items_ingredients = FoodIngredient.objects.filter(food_item=mi)
        #         ret_dict['food_category'][fc.food_category_name][mi.food_name] = {}
        #         ingredient_list = []
        #         for fi in menu_items_ingredients:
        #             ingredient_list.append(fi.ingredient_name)
        #
        #         ret_dict['food_category'][fc.food_category_name][mi.food_name]['ingredients'] = ingredient_list
        #
        #         food_allergens = FoodAllergen.objects.filter(food_item=mi)
        #
        #         allergen_list = []
        #         for fa in food_allergens:
        #             allergen_list.append(fa.allergen_name)
        #
        #         ret_dict['food_category'][fc.food_category_name][mi.food_name]['allergen'] = allergen_list
        #
        #         ret_dict['food_category'][fc.food_category_name][mi.food_name]['calories'] = mi.food_calories
        #
        #         ret_dict['food_category'][fc.food_category_name][mi.food_name]['weight'] = mi.food_weight
        #
        #         ret_dict['food_category'][fc.food_category_name][mi.food_name]['price'] = mi.food_price
        #
        # return ret_dict

        # Return JSON object format
        ###############################################################################################################
        # return_object = {
        #     'restaurant_name': restaurant_name,
        #     'table_capacity': 12,
        #     'food_category': {
        #         'pizza': {
        #             'quarto': {
        #                 'ingredients': ['cheese', 'bla'],
        #                 'allergens': 'soy',
        #                 'price': 40,
        #                 'calories': 1000,
        #                 'weight': 500
        #             }
        #         },
        #         'burger': {
        #             'bbq': {
        #                 'ingredients': ['beef', 'bread'],
        #                 'allergens': 'plm',
        #                 'price': 35,
        #                 'calories': 900,
        #                 'weight': 400
        #             }
        #         }
        #
        #     }
        # }
        # return json.dumps(return_object, indent=4)
        ###############################################################################################################

        # Print JSON restaurant data return Object
        ###############################################################################################################
        # print('Restaurant_name: ' + restaurant_name)
        # print('---------')
        # print('Table_index: ' + str(table_index))
        # print('---------')
        # for fc in food_categories_querySet:
        #     food_per_category = all_food_objects_in_menu.filter(food_category=fc)
        #     print('FC: ' + fc.food_category_name)
        #     for mi in food_per_category:
        #         print("\tMI: " + mi.food_name)
        #         menu_items_ingredients = FoodIngredient.objects.filter(food_item=mi)
        #         for fi in menu_items_ingredients:
        #             print("\t\tFI: " + fi.ingredient_name)
        #         print('\t\t---------')
        #         food_alergens = FoodAllergen.objects.filter(food_item=mi)
        #         for fa in food_alergens:
        #             print("\t\tFA: " + fa.allergen_name)
        #         print('\t\t---------')
        #         print("\t\tCAL:" + str(mi.food_calories))
        #         print('\t\t---------')
        #         print("\t\tWeight:" + str(mi.food_weight))
        #         print('\t\t---------')
        #         print("\t\tPRICE:" + str(mi.food_price))
        #         print('\t\t---------')
        ###############################################################################################################
