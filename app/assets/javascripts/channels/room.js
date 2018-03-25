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

      setTimeout(function(){
        document.getElementById("bid_update").classList.remove("hidden");
        document.getElementById("bid_update").classList.add("fade-in");

        $("#bid_update").html(`the new bid price is now ${data.price}`);
      }, 1000);

      setTimeout(function(){
        document.getElementById("bid_update").classList.add("fade-out");
        setTimeout(function(){
          document.getElementById("bid_update").classList.add("hidden");
        }, 1000)
      }, 10000);
    }
  });
});
