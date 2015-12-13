
from tastypie.authorization import Authorization
from tastypie.authentication import ApiKeyAuthentication, Authentication
from tastypie.resources import ModelResource
from tastypie.utils import trailing_slash
from tastypie.serializers import Serializer
from django.conf.urls import url
from tastypie import fields
import json
from pingpong.models import (PingpongChampionship, PingpongChampionshipPlayer,
                             PingpongPlayer, PingpongReferee, PingpongRefereeGameDraw,
                             PingpongRefereeGameTransaction, PingpongRefereeScore)


class PingpongChampionshipResource(ModelResource):
    class Meta:
        queryset = PingpongChampionship.objects.all()
        resource_name = 'championship'
        serializer = Serializer(formats=['json', 'jsonp', ])
        always_return_data = True
        authorization = Authorization()
        # authentication = ApiKeyAuthentication()


class PingpongPlayerResource(ModelResource):
    class Meta:
        queryset = PingpongPlayer.objects.all()
        resource_name = 'player'
        # authorization = DjangoAuthorization()
        # authentication = ApiKeyAuthentication()


class PingpongChampionshipPlayerResource(ModelResource):
    championship = fields.ToOneField(PingpongChampionshipResource, 'championship', full=True)
    player = fields.ToOneField(PingpongPlayerResource, 'player', full=True)

    class Meta:
        queryset = PingpongChampionshipPlayer.objects.all()
        resource_name = 'joinchampionship'
        serializer = Serializer(formats=['json', 'jsonp', ])
        authorization = Authorization()
        # authentication = ApiKeyAuthentication()




class PingpongRefereeResource(ModelResource):
    championship = fields.ToOneField(PingpongChampionshipResource, 'championship', full=True)
    class Meta:
        queryset = PingpongReferee.objects.all()
        resource_name = 'referee'
        serializer = Serializer(formats=['json', 'jsonp', ])
        always_return_data = True
        authorization = Authorization()
        # authentication = ApiKeyAuthentication()


class PingpongRefereeGameDrawResource(ModelResource):
    class Meta:
        queryset = PingpongRefereeGameDraw.objects.all()
        resource_name = 'refereegamedraw'
        # authorization = DjangoAuthorization()
        # authentication = ApiKeyAuthentication()


class PingpongRefereeGameTransactionResource(ModelResource):
    class Meta:
        queryset = PingpongRefereeGameTransaction.objects.all()
        resource_name = 'refereegametransaction'
        # authorization = DjangoAuthorization()
        # authentication = ApiKeyAuthentication()


class PingpongRefereeScoreResource(ModelResource):
    class Meta:
        queryset = PingpongRefereeScore.objects.all()
        resource_name = 'refereescore'
        # authorization = DjangoAuthorization()
        # authentication = ApiKeyAuthentication()

    def export(self, request, **kwargs):
        response = {}
        return self.create_response(request, response)

    def prepend_urls(self):
        return [
            url(r"^(?P<resource_name>%s)/export%s$" % (
                self._meta.resource_name, trailing_slash()),
                self.wrap_view('export'),
                name="api_export"),
        ]