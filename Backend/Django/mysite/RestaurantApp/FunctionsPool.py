from .models import *
import random, string

# TODO Perform cheeck to be sure table code is unique

class Functions:

    @staticmethod
    def initialize_restaurant(name, table_number):
        """
        Creates Restaurant and then Creates Tables for it
        Schedule and Address to be added
        """
        new_rest = Restaurant(restaurant_name=name,
                              address='address here',
                              schedule_start='0:00:00',
                              schedule_end='0:00:00',
                              total_tables=table_number)

        new_rest.save()

        for table in range(1, table_number + 1):
            generated_code = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
            TableId(restaurant=name,
                    table_number=table,
                    table_unique_code=generated_code,
                    table_capacity=2,
                    smoking_allowed=False).save()

        print("--------------------------------------------------------------------")
        print("\"{0}\" Restaurant added Tables ! \nAdd manually the address and schedule for the restaurant !".format(
            name))
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
            else:
                print("--------------------------------------------------------------------")
                print("Tables already created!")
                print("--------------------------------------------------------------------")

        except IndexError:
            print("--------------------------------------------------------------------")
            print('No such Restaurant with ID = {0}'.format(rest_id))
            print("--------------------------------------------------------------------")


