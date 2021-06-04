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



url1 = 'https://script.baertt.com/count2/callback?si='+si()+'0cc11b74a5333b117bc00706dc1ba3f3&referer=https%253A%252F%252Ffocus.youth.cn%252Farticle%252Fs%253Fsignature%253DnME6PzmgxDLdbpG4wzbNKGSdL6VKtRexq9w1rjJNqwAQ0OoW9B%2526uid%253D52234038%2526phone_code%253D9f187973b629846a0c387d082e8ad7f2%2526scid%253D38016918%2526time%253D1619658345%2526app_version%253D2.0.2%2526sign%253Db129c8a629b7aee83e7a6297f655781e&_=1619658356399&jsonpcallback=jsonp5'

url2 = 'https://script.baertt.com/count2/callback?si=ec6647e5d202614a83d97f776a549b62&referer=https%253A%252F%252Ffocus.youth.cn%252Farticle%252Fs%253Fsignature%253DdQOvnJNrgR0GzE9azWLb3Qc8GOPkfrPAZm61V6yqY2lXojxeM8%2526uid%253D52943275%2526phone_code%253Dc727c5cabcfb4122ba15b49e36429551%2526scid%253D32466507%2526time%253D1619666060%2526app_version%253D2.0.2%2526sign%253D0b0eea86c1598506db5f1dd182a23b41&_=1619666071484&jsonpcallback=jsonp6'


#多号码

headers={"Accept": "*/*","Accept-Encoding": "gzip, deflate, br","Accept-Language": "zh-cn","Connection": "keep-alive","Host": "script.baertt.com","Referer": "https://focus.youth.cn/","User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.2(0x18000239) NetType/4G Language/zh_CN"}
#headers={"Accept": "*/*","Accept-Encoding": "gzip, deflate, br","Accept-Language": "zh-cn","Connection": "keep-alive","Host": "script.baertt.com","Referer": "https://focus.youth.cn/","User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.4(0x18000422) NetType/4G Language/zh_CN"}


resp = requests.get(url=url1,headers=headers,timeout=60).text

print(resp)
    
    
    
    
    
    
    
    
    
    
    
    
#多号码
#resp = requests.get(url=url2,headers=headers,timeout=60).text

#print(resp)




