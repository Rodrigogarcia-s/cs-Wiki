from django.urls import path

from . import views



urlpatterns = [
    path("", views.index, name="index"),
    path("wiki/<str:title>", views.entry, name="entry"),
    path("NewPage", views.NewPage, name="NewPage"),
    path("wiki/edit/<str:title>", views.EditEntry, name="EditEntry"),
    
]
