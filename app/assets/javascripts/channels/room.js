$(document).on('turbolinks:load', function() {
  var room_number = $("#bid_table").data("room-number");
  App['room' + room_number] = App.cable.subscriptions.create({channel: "RoomChannel",room: room_number}, {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      span = document.createElement("span");
      span.innerHTML = `$${data.price.toFixed(1)}`
      document.getElementById("bid_table").innerHTML = "";
      document.getElementById("bid_table").appendChild(span);

      setTimeout(function(){
        $("#bid_update").html(`the new bid price is now ${data.price}`);
        document.getElementById("bid_update").classList.remove("hiddenbid");
        document.getElementById("bid_update").classList.add("showbid");
      }, 1000);

      setTimeout(function(){
        setTimeout(function(){
          document.getElementById("bid_update").classList.remove("showbid");
          document.getElementById("bid_update").classList.add("hiddenbid");
        }, 1000)
      }, 3000);
    }
  });
});
