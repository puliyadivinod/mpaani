from django.contrib import admin
from pingpong.models import (PingpongChampionship, PingpongChampionshipPlayer,
                             PingpongPlayer, PingpongReferee, PingpongRefereeGameDraw,
                             PingpongRefereeGameTransaction, PingpongRefereeScore)


# Register your models here.

class PingpongChampionshipPlayerInlineAdmin(admin.StackedInline):
    model = PingpongChampionshipPlayer

    def has_add_permission(self, request):
        return False


class PingpongRefereeGameDrawInlineAdmin(admin.StackedInline):
    model = PingpongRefereeGameDraw

    def has_add_permission(self, request):
        return False


class PingpongRefereeGameTransactionInlineAdmin(admin.StackedInline):
    model = PingpongRefereeGameTransaction

    def has_add_permission(self, request):
        return False


class PingpongRefereeScoreInlineAdmin(admin.StackedInline):
    model = PingpongRefereeScore

    def has_add_permission(self, request):
        return False


class PingpongChampionshipAdmin(admin.ModelAdmin):
    inlines = [PingpongChampionshipPlayerInlineAdmin,
               PingpongRefereeGameDrawInlineAdmin,
               PingpongRefereeGameTransactionInlineAdmin,
               PingpongRefereeScoreInlineAdmin]
    list_display = ['id', 'tournament_name', 'updated_date', ]
    list_filter = ['created_date', ]
    list_display_links = ['id', 'tournament_name', ]


class PingpongPlayerAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'nick_name', 'defence_length', 'updated_date',]
    list_filter = ['created_date', 'defence_length',]
    list_display_links = ['id', 'user',]


class PingpongRefereeAdmin(admin.ModelAdmin):
    list_display = ['id', 'championship', 'updated_date', ]
    list_filter = ['created_date', ]
    list_display_links = ['id', 'championship', ]


admin.site.register(PingpongChampionship, PingpongChampionshipAdmin)
admin.site.register(PingpongPlayer, PingpongPlayerAdmin)
admin.site.register(PingpongReferee, PingpongRefereeAdmin)
