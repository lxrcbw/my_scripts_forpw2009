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



#随即字母#
#════════════════════════════════════════
def rd(y):
  str=''
  return str.join(random.choice(string.ascii_letters) for x in range(y))
#════════════════════════════════════════

#print(si())
#print(rd(5))


#url1 = 'https://script.baertt.com/count2/callback?si='+si()+'6ae910123910054ac8012a2e13b86b34&referer=https%253A%252F%252Ffocus.youth.cn%252Farticle%252Fnewshare_one%253Fsignature%253Do9xqzDrKG6wJnYZ5Ek4eL5jMlToXdjk1R3LXvBgNylVOMbA02W%2526scene_id%253Dhome_feed%2526share_id%253D58036361392696391630646956%2526time%253D1630646956&_=1630646978705&jsonpcallback=jsonp6'
#url2 = 'https://script.baertt.com/count2/callback?si='+si()+'ed3cb36ab23033f29a3a120032d46a06&referer=https%253A%252F%252Ffocus.youth.cn%252Farticle%252Fnewshare_seven%253Fsignature%253DbD6x5nzGA2pvRerWXy4Q8K0LZIVdNgp1Og8LdMkQlPVqJYN0Bo%2526scene_id%253Dhome_feed%2526share_id%253D58160467392687421630647335%2526time%253D1630647335&_=1630647365052&jsonpcallback=jsonp6'
url1 = 'https://script.baertt.com/count2/callback?si='+si()+'5f87ee4d553fbcbd90c1b32c6dfeff7e&referer=https%253A%252F%252Ffocus.youth.cn%252Farticle%252Fws_seven%253Fsignature%253DgbJynLeRd3VA29KYqE4gqAdEgTBm0KyaDNrGQloPXZzxvOB6jW%2526scene_id%253Dhome_feed%2526share_id%253D58160467403344201634624902%2526time%253D1634624902&_=1634624964145&jsonpcallback=jsonp6'
url2 = 'https://script.baertt.com/count2/callback?si='+si()+'5f87ee4d553fbcbd90c1b32c6dfeff7e&referer=https%253A%252F%252Ffocus.youth.cn%252Farticle%252Fws_one%253Fsignature%253DPDAM2LbdQB6J8ljGNZazZReV8U2BQ3XaKX0mkV39oyW5xrzpYe%2526scene_id%253Dhome_feed%2526share_id%253D58036361404241161634624605%2526time%253D1634624605&_=1634624627867&jsonpcallback=jsonp5'

#多号码


ra1=str(random.randint(123,345))
ra2=str(random.randint(123,345))

brev1=str(random.randint(11,14))
srev1=str(random.randint(1,5))

brev2=str(random.randint(11,14))
srev2=str(random.randint(1,5))


#header1={"Accept": "*/*","Accept-Encoding": "gzip, deflate, br","Accept-Language": "zh-cn","Connection": "keep-alive","Host": "script.baertt.com","Referer": "https://focus.youth.cn/","User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS "+brev1+"_"+srev1+" like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.12(0x18000"+ra1+") NetType/WIFI Language/zh_CN"}
#header2={"Accept": "*/*","Accept-Encoding": "gzip, deflate, br","Accept-Language": "zh-cn","Connection": "keep-alive","Host": "script.baertt.com","Referer": "https://focus.youth.cn/","User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS "+brev2+"_"+srev2+" like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.12(0x18000"+ra2+") NetType/WIFI Language/zh_CN"}

header1={"Accept": "*/*","Accept-Encoding": "gzip, deflate, br","Accept-Language": "zh-cn","Connection": "keep-alive","Host": "script.baertt.com","Referer": "https://focus.youth.cn/","User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS "+brev1+"_"+srev1+" like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.12(0x18000"+ra1+") NetType/4G Language/zh_CN"}
header2={"Accept": "*/*","Accept-Encoding": "gzip, deflate, br","Accept-Language": "zh-cn","Connection": "keep-alive","Host": "script.baertt.com","Referer": "https://focus.youth.cn/","User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS "+brev2+"_"+srev2+" like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.12(0x18000"+ra2+") NetType/4G Language/zh_CN"}


print(header1)
print(header2)

resp = requests.get(url=url1,headers=header1,timeout=60).text
print(resp)

resp = requests.get(url=url2,headers=header2,timeout=60).text
print(resp)

    
    
    
    
    
    
    
    
    
    
    
#多号码
#resp = requests.get(url=url2,headers=headers,timeout=60).text

#print(resp)




