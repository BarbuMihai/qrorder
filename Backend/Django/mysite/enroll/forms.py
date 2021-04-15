from django.forms import ModelForm, Textarea
from .models import SubscribedRestaurant


class EnrollResturantForm(ModelForm):
    class Meta:
        model = SubscribedRestaurant
        fields = '__all__'
        labels = {
            'restaurant_name': 'Restaurant Name',
            'owner_email': 'Contact Email',
            'owner_phone_number': 'Contact Phone Number',
            'restaurant_address': 'Restaurant Adress',
            'mentions': 'Mentions or anything to add'
        }

        widgets = {
            'mentions': Textarea()
        }