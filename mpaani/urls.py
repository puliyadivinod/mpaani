"""mpaani URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url, include
from django.contrib import admin
from tastypie.api import Api
from pingpong.api import (PingpongChampionshipResource, PingpongPlayerResource,
                          PingpongRefereeResource, PingpongChampionshipPlayerResource,
                          PingpongRefereeGameDrawResource, PingpongRefereeGameTransactionResource,
                          PingpongRefereeScoreResource)


v1_api = Api(api_name='v1')
v1_api.register(PingpongChampionshipResource())
v1_api.register(PingpongPlayerResource())
v1_api.register(PingpongRefereeResource())
v1_api.register(PingpongChampionshipPlayerResource())
v1_api.register(PingpongRefereeGameDrawResource())
v1_api.register(PingpongRefereeGameTransactionResource())
v1_api.register(PingpongRefereeScoreResource())

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^api/', include(v1_api.urls)),
]
