from django.urls import path,include
import account

urlpatterns = [
    path("auth/", include('account.urls')),
]
                            