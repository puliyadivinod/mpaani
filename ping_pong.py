import requests
import json
from time import time
import logging
from random import shuffle, randint


class Player(object):
    game_id = None
    opponent = None
    order_of_play = None

    def __init__(self, *args, **kwargs):
        self.player_id = kwargs.get('id')
        self.player_name = kwargs.get('nick_name')
        self.defense_length = kwargs.get('defence_length')
        self.resource_uri = kwargs.get("resource_uri")

    def __str__(self):
        return self.player_name

    def notify(self, game_id, opponent, order_of_play):
        self.game_id = game_id
        self.opponent = opponent
        self.order_of_play = order_of_play

    def defending_array(self):
        return [randint(1, 10) for i in xrange(self.defense_length)]

    @property
    def random_number(self):
        return randint(1, 10)


class PingPongChampionShip(object):
    host = 'http://127.0.0.1:8000'
    api_url = '/api/v1/championship/'

    players = []

    def __init__(self):
        self.create_tournament()

    def create_tournament(self):
        tournament_name = "Winter " + str(time())
        response = requests.post(self.host+self.api_url,
                                 headers={"Content-Type": "application/json"},
                                 data=json.dumps({"tournament_name": tournament_name}))
        if response.status_code == 201:
            response_json = json.loads(response.text)
            self.tournament_id = int(response_json.get("id"))
            self.resource_uri = response_json.get("resource_uri")
        else:
            logging.exception(response.text)

    def add_referee(self):
        response = requests.post(self.host + "/api/v1/referee/",
                                 headers={"Content-Type": "application/json"},
                                 data=json.dumps({"championship": self.resource_uri}))

        if response.status_code == 201:
            response_json = json.loads(response.text)
            self.referee_id = int(response_json.get("id"))
            self.referee_resource_uri = response_json.get("resource_uri")
        else:
            logging.exception(response.text)

    def join_players(self, players):
        data = []
        for player in players:
            p = Player(**player)
            data.append({"championship": self.resource_uri,
                         "player": p.resource_uri})
            self.players.append(p)

        response = requests.patch(self.host + "/api/v1/joinchampionship/",
                         headers={"Content-Type": "application/json"},
                         data=json.dumps({"objects": data}))

def main():

    response = requests.get('http://127.0.0.1:8000/api/v1/player/?format=json')
    response_json = json.loads(response.text)
    players = response_json.get('objects')

    championship = PingPongChampionShip()
    championship.add_referee()
    championship.join_players(players)




if __name__ == '__main__':
    main()