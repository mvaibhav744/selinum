from selenium import webdriver
import time
from random import randrange

refresh_time = 10
browser_list = []

browser_one = webdriver.Chrome("chromedriver")
browser_two = webdriver.Chrome("chromedriver")
browser_three = webdriver.Chrome("chromedriver")

browser_list.append(browser_one)
browser_list.append(browser_two)
browser_list.append(browser_three)

for browser in browser_list:
    browser.get("https://www.youtube.com/watch?v=69Yu6LMANjY")

while(True):
     browser_num = randrange(0, len(browser_list))
     browser_list[browser_num].refresh()
     print("browser number", browser_num, "refreshed")
     time.sleep(refresh_time)
      
browser.close()
