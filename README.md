# 台灣股票網站輿情分析

## 1.資料收集
利用Python的Requests取得網頁資料，再利用beautifulsoup4解析網頁，取得特定資料。
* [PTT Stock](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/ptt_stock.ipynb)
* [鉅亨網](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/gihun.ipynb)
* [鉅亨網台股部落格](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/gihun_blog.ipynb)
* [mobile01 投資與理財](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/gihun_blog.ipynb)
* [商周財富網](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/businessweekly.ipynb)

利用pandas下載HTML的表格
* [Yahoo Finance](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/stock_price.ipynb)

利用Selenium控制chrome來爬取網頁
* [104人力銀行](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/JobBank.ipynb)

## 2.資料清洗
刪除與本文無關的內容 (如作者資訊、延伸閱讀、廣告等等)。\
利用正規表達式(re)刪除特殊符號(※ \\n ...) 只保留中文、英文和數字。
* [資料清洗](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/JobBank.ipynb)
