App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

    # Called when there's incoming data on the websocket for this channel

  #speak: ->
    #@perform 'speak'

  #channes/room_channelのspeakアクションを呼び出し
  speak: (message) ->
    @perform 'speak', message: message

  #ブロードキャストされたときの処理
  received: (data) ->
    $('#messages').append data['message']


  #エンターキーを押す
  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
