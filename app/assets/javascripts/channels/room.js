$(document).on('turbolinks:load', function() {
  var room_number = $("#bid_table").data("room-number");
  App['room' + room_number] = App.cable.subscriptions.create({channel: "RoomChannel",room: room_number}, {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      span = document.createElement("span");
      span.innerHTML = data.price
      document.getElementById("bid_table").innerHTML = "";
      document.getElementById("bid_table").appendChild(span);
    }
  });
});
