from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class PingpongChampionship(models.Model):
    tournament_name = models.CharField(max_length=64)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'pingpong_championship'
        verbose_name = 'ChampionShip'
        verbose_name_plural = 'ChampionShips'

    def __str__(self):
        return self.tournament_name


class PingpongPlayer(models.Model):
    user = models.ForeignKey(User)
    nick_name = models.CharField(max_length=32)
    defence_length = models.IntegerField()
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'pingpong_player'
        verbose_name = 'Player'
        verbose_name_plural = 'Players'

    def __str__(self):
        return self.nick_name


class PingpongChampionshipPlayer(models.Model):
    championship = models.ForeignKey(PingpongChampionship)
    player = models.ForeignKey(PingpongPlayer)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'pingpong_championship_player'
        verbose_name = 'Participant'
        verbose_name_plural = 'Participants'

    def __str__(self):
        return self.player.nick_name


class PingpongReferee(models.Model):
    championship = models.ForeignKey(PingpongChampionship)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'pingpong_referee'
        verbose_name = 'Referee'
        verbose_name_plural = 'Referee'

    def __str__(self):
        return self.championship.tournament_name


class PingpongRefereeGameDraw(models.Model):
    championship = models.ForeignKey(PingpongChampionship)
    player = models.ForeignKey(PingpongPlayer, related_name="player")
    opponent = models.ForeignKey(PingpongPlayer, related_name="opponent")
    order_of_play = models.IntegerField()
    round = models.IntegerField()
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'pingpong_referee_game_draw'
        verbose_name = 'Game Draw'
        verbose_name_plural = 'Game Draw'


class PingpongRefereeGameTransaction(models.Model):
    championship = models.ForeignKey(PingpongChampionship)
    game = models.ForeignKey(PingpongRefereeGameDraw)
    offending_player = models.ForeignKey(PingpongPlayer, related_name="offending")
    defending_player = models.ForeignKey(PingpongPlayer, related_name="defending")
    guess_number = models.IntegerField()
    suggested_numbers = models.CharField(max_length=32)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'pingpong_referee_game_transaction'
        verbose_name = 'Transaction'
        verbose_name_plural = 'Transactions'


class PingpongRefereeScore(models.Model):
    championship = models.ForeignKey(PingpongChampionship)
    game = models.ForeignKey(PingpongRefereeGameDraw)
    player = models.ForeignKey(PingpongPlayer)
    points = models.IntegerField()
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'pingpong_referee_score'
        verbose_name = 'Score'
        verbose_name_plural = 'Scores'
