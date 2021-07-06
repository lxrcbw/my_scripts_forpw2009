var userid = "e18cf88c644b4fe29380088ae0d061ee"
var taskId = "2c909969630101e7016325c827520000"

var http = require('http')

console.log("CM-wyx sign test")
  
  var options = {
	        url: "http://task.jegotrip.com.cn:8080/app/sign",
			method:'POST',
			header: {
					"Content-Type": "application/json;charset=UTF-8",
					"User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 11_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15G77 source/jegotrip"
					},
			body:   {
			"userid": userid,
			"taskId": taskId
				    }

  }



var req = http.request(options, function(res){
	        res.setEncoding('utf8');
		    res.on('data',function(data){
			console.log("data:",data);  
			}
		});
});


req.end;
