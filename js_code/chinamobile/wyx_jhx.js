var userid = "e18cf88c644b4fe29380088ae0d061ee"
var taskId = "2c909969630101e7016325c827520000"
if (new Date().getDate() != $cache.get("qiandao")) {
    $http.request({
    method: "post",
    url: "http://task.jegotrip.com.cn:8080/app/sign",
    header: {
      "Content-Type": "application/json;charset=UTF-8",
      "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 11_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15G77 source/jegotrip"
    },
    body: {
      "userid": userid,
      "taskId": taskId
    },
    handler: function(resp) {
	$cache.set("qiandao", new Date().getDate());
    let d = resp.data.result
      $push.schedule({
        title: "无忧行签到",
        body: d,              
    }) 
   }
 })
}