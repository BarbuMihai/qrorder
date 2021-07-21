import json

from django.http import HttpResponse, Http404
from django.views.decorators.csrf import csrf_exempt
from django.middleware.csrf import get_token
from django.http import JsonResponse, HttpResponseNotFound, HttpResponseForbidden

from .models import *
from RestaurantApp.models import MenuItem


@csrf_exempt
def index(request):
    if request.method == 'GET':
        get_token(request)
        return HttpResponse('Sent CSRF')

    if request.method == 'POST':
        jsRes = json.loads(request.body)
        # print(jsRes)

        try:
            order_id = jsRes['order_id']
            new_order = OrderModel.objects.get(id=order_id)
        except KeyError:
            table_name = jsRes['table_index']
            table_obj = TableId.objects.get(
                table_unique_code=table_name
            )

            new_order = OrderModel(
                table=table_obj
            )
            new_order.save()

        food_items = jsRes['food_items']
        # print(food_items)
        for item in range(0, len(food_items)):
            food_of_list = MenuItem.objects.get(
                food_name=food_items[item]['item_name'],
                restaurant=new_order.table.restaurant
            )
            quantity_of_item = food_items[item]['quantity']
            food_of_order = FoodItems(
                order=new_order,
                food=food_of_list,
                quantity=quantity_of_item
            )
            food_of_order.save()

        # print(request.body)
        return JsonResponse({'order_id': new_order.id})


@csrf_exempt
def request_payment(request):
    if request.method == 'GET':
        return HttpResponseForbidden('Not Allowed')
    if request.method == 'POST':
        payment_request = json.loads(request.body)
        try:
            order = OrderModel.objects.get(id=payment_request['order_id'])
            order.requested_payment = True
            order.payment_method = payment_request['payment_method']
            order.save()
        except OrderModel.DoesNotExist:
            raise Http404('Order does not exist')
        return HttpResponse('Payment Requested')
