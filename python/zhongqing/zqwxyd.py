import requests
import json
import random,string



#每次改si#
#════════════════════════════════════════
def si():
  # 随机生成数字个数
  Ofnum=random.randint(1,32)
  Ofletter=32-Ofnum
  # 选中ofnum个数字
  slcNum=[random.choice(string.digits) for i in range(Ofnum)]
  # 选中ofletter个字母
  slcLetter=[random.choice(string.ascii_letters) for i in range(Ofletter)]
  # 打乱组合
  slcChar=slcLetter+slcNum
  random.shuffle(slcChar)
  # 生成随机密码
  getPwd=''.join([i for i in slcChar])
  return getPwd
#════════════════════════════════════════

print(si())

#随即字母#
#════════════════════════════════════════
def rd(y):
return ''.join(random.choice(string.ascii_letters) for x in range(y))
#════════════════════════════════════════

print(rd(5))

#url1 = 'https://script.baertt.com/count2/callback?si='+si()+'0cc11b74a5333b117bc00706dc1ba3f3&referer=https%253A%252F%252Ffocus.youth.cn%252Farticle%252Fs%253Fsignature%253DnME6PzmgxDLdbpG4wzbNKGSdL6VKtRexq9w1rjJNqwAQ0OoW9B%2526uid%253D52234038%2526phone_code%253D9f187973b629846a0c387d082e8ad7f2%2526scid%253D38016918%2526time%253D1619658345%2526app_version%253D2.0.2%2526sign%253Db129c8a629b7aee83e7a6297f655781e&_=1619658356399&jsonpcallback=jsonp5'
url1 = 'https://script.baertt.com/count2/callback?si='+si()+'6fccaf9e1a275741eb3ebd5b01f0dff0&referer=https%253A%252F%252Ffocus.youth.cn%252Farticle%252Fnewshare_eight%253Fsignature%253D5yNLlPgo6r98RX0bMW7YYyGG6s8N6eR7KEVpwGOxvAqDZzBJdm%2526scene_id%253Dhome_feed%2526share_id%253D52234038392222821625554191%2526time%253D1625554191&_=1625554209007&jsonpcallback=jsonp6'
url2 = 'https://script.baertt.com/count2/callback?si='+si()+'46b99850e3db7558fabfdc7e4c5c3d8c&referer=https%253A%252F%252Ffocus.youth.cn%252Farticle%252Fnewshare_five%253Fsignature%253DG6vDYbegoP2Owr90x84KkjyZjcNz5mG4jVBXQnmqNLEMRyzZ3l%2526scene_id%253Dhome_feed%2526share_id%253D52943275392435321625554743%2526time%253D1625554743&_=1625554760228&jsonpcallback=jsonp5'


#多号码


ra1=str(random.randint(0,9))
ra2=str(random.randint(0,9))

print(ra1)
print(ra2)

brev=str(random.randint(11,14))
srev=str(random.randint(1,5))

print(brev)
print(srev)

header1={"Accept": "*/*","Accept-Encoding": "gzip, deflate, br","Accept-Language": "zh-cn","Connection": "keep-alive","Host": "script.baertt.com","Referer": "https://focus.youth.cn/","User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.2(0x18000239) NetType/4G Language/zh_CN"}


ra1=str(random.randint(0,9))
ra2=str(random.randint(0,9))

print(ra1)
print(ra2)

brev=str(random.randint(11,14))
srev=str(random.randint(1,5))

print(brev)
print(srev)

header2={"Accept": "*/*","Accept-Encoding": "gzip, deflate, br","Accept-Language": "zh-cn","Connection": "keep-alive","Host": "script.baertt.com","Referer": "https://focus.youth.cn/","User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS "+brev+"_"+srev+" like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.4(0x18000422) NetType/4G Language/zh_CN"}

print(header2)

#resp = requests.get(url=url1,headers=header1,timeout=60).text
#print(resp)

#resp = requests.get(url=url2,headers=header2,timeout=60).text
#print(resp)

    
    
    
    
    
    
    
    
    
    
    
#多号码
#resp = requests.get(url=url2,headers=headers,timeout=60).text

#print(resp)




