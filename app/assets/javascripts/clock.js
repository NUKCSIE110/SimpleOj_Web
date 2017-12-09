$(document).on('ready turbolinks:load', function(){
  getTime();
  setInterval(getTime, 60000);
  setInterval(updateTime, 1000);
});

function getTime(){
  $.get("/time", function(data){
    console.log(data);
    $("#timeLeft").data("gap", Date.now()-data.Now);
    $("#timeLeft").data("exp", data.Exp);
  }, "json");
}
function updateTime(){
  var t = new Date($("#timeLeft").data("exp") - Date.now());
  t = new Date(t.getTime() + $("#timeLeft").data("gap"));
  if(t.getTime() >= 0){
    var strTimeLeft = ("0"+t.getUTCHours()).slice(-2) + ':';
    strTimeLeft += ("0"+t.getUTCMinutes()).slice(-2) + ':';
    strTimeLeft += ("0"+t.getUTCSeconds()).slice(-2);
    console.log(t.getTime());
    $("#timeLeft").text(strTimeLeft);
  }else{
    $("#timeLeft").text("00:00:00 GAMEOVER!!");
    $("#timeLeft").addClass("text-danger");
  }
}
