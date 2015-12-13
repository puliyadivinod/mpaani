__author__ = 'vinu'

from random import shuffle, randint
from uuid import uuid1
from collections import defaultdict


class Player(object):
    game_id = None
    opponent = None
    order_of_play = None

    def __init__(self, *args, **kwargs):
        self.player_id = kwargs.get('player_id')
        self.player_name = kwargs.get('player_name')
        self.defense_length = kwargs.get('defence_length')

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


class Referee(object):

    group_a = None
    group_b = None

    def __init__(self):
        self.games = {}
        self.scores = {}

    def start_game(self):
        pass  # starts and waits

    def draw_games(self, players, number_of_games):
        self.group_a, self.group_b = players[number_of_games:], players[:number_of_games]

        shuffle(self.group_a), shuffle(self.group_b)  # shuffle the players position

        for pair in zip(self.group_a, self.group_b):  # pick players from each group and create a pair
            g = Game(*pair)  # initialize game object with the pair or players
            player_1, player_2 = pair
            order_to_play = randint(1, 2)  # deciding order to play
            opponent = player_2  # deciding opponent
            for player in pair:
                player.notify(*[g.game_id, opponent, order_to_play])  # notifying players of game details
                opponent = player_1  # deciding opponent
                order_to_play = 1 if order_to_play == 2 else 2
            self.games[g.game_id] = g

    def supervise(self):
        for game_id, game in self.games.iteritems():  # each game started
            result = game.play()  # playing game
            print result.loser

    def knockout_losers(self):
        pass

    def winners(self):
        pass

    def results(self):
        pass


class Game(object):
    points = None
    max_points = 5  # winning point
    winner = None
    loser = None

    def __init__(self, player_1, player_2):
        self.game_id = uuid1()
        self.points = defaultdict(int)
        if player_1.order_of_play == 1:  # assign player to respective role as per the order of play
            self.offensive = player_1
            self.defending = player_2
        else:
            self.offensive = player_2
            self.defending = player_1

    def play(self):
        while True:  # check for the first player to get 5 points
            if self.points[self.offensive] == self.max_points or self.points[self.defending] == self.max_points:
                for player, points in self.points.iteritems():
                    if points >= self.max_points:
                        self.winner = player
                    else:
                        self.loser = player
                break

            if self.offensive.random_number in self.defending.defending_array():
                self.points[self.defending] += 1  # defender player gets 1 point
                self.offensive = self.defending  # switch roles
                self.defending = self.offensive  # switch roles
                # now defender attacks
            else:
                self.points[self.offensive] += 1  # offensive player gets 1 point
        return self


class PingPongChampionShip(object):
    referee = None
    players = []
    initial_games = 4

    def appoint_referee(self, referee):
        self.referee = referee

    def join_players(self, players):
        for player in players:
            self.players.append(Player(**player))

    def play_tournament(self):
        self.referee.start_game("round_1")

        # beginning of initial game
        self.referee.draw_games(self.players, self.initial_games)
        self.referee.supervise()
        self.referee.knockout_losers()
        semifinal_players = self.referee.winners()

        self.referee.start_game("round_2")

        # # beginning of semi-final game
        # self.referee.draw_games(semifinal_players, 2)
        # self.referee.supervise()
        # self.referee.knockout_losers()
        # final_players = self.referee.winners()

        self.referee.start_game("round_3")

        # # beginning of final game
        # self.referee.draw_games(final_players, 1)
        # self.referee.supervise()
        # self.referee.knockout_losers()
        # winner = self.referee.winners()

    def results(self):
        return self.referee.results()


def main():

    players = [
        {"player_name": "Joey", "defence_length": 8, "player_id": 1},
        {"player_name": "Nick", "defence_length": 8, "player_id": 2},
        {"player_name": "Russel", "defence_length": 7, "player_id": 3},
        {"player_name": "Vivek", "defence_length": 7, "player_id": 4},
        {"player_name": "Pritam", "defence_length": 6, "player_id": 5},
        {"player_name": "Amit", "defence_length": 6, "player_id": 6},
        {"player_name": "Chandler", "defence_length": 5, "player_id": 7},
        {"player_name": "Colwin", "defence_length": 5, "player_id": 8},
    ]

    ping_pong = PingPongChampionShip()
    ping_pong.appoint_referee(Referee())
    ping_pong.join_players(players)
    ping_pong.play_tournament()
    ping_pong.results()


if __name__ == '__main__':
    main()