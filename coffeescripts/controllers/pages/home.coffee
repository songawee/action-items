angular.module('application').controller 'HomePageController', [
  '$scope'
  'Item'

  class HomePageController
    constructor: (@$scope, Item) ->
      @$scope.items = Item
      $scope.items.$bind($scope, 'item.votes')

    addMessage: (item) ->
      @$scope.items.$add
        description: item.description

    upVote: (item) ->
      item = @$scope.items.$child(item.$id)
      item.votes ?= 0
      item.$update
        votes: item.votes + 1

    downVote: (item) ->
      item = @$scope.items.$child(item.$id)
      item.votes ?= 0
      item.$update
        votes: item.votes - 1
]
