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
利用正規表達式(re)刪除特殊符號(※ \\n ...) 只保留中文、英文和數字。\
資料清洗完畢，將資料合併。
* [資料清洗](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/clean%26combine.ipynb)

利用pandas將時間字串轉換成日期格式
* [日期資料型態](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/convert_to_datetime.ipynb)

## 3.自然語言處理 (Natural Language Processing)
中文必須先將句子中每個字詞分割出來 (ex.今天天氣很好 => 今天 天氣 很好)。\
使用中研院開發的[ckiptagger](https://github.com/ckiplab/ckiptagger)來進行斷詞。\
先安裝ckiptagger，下載提供的語料庫，並進行測試。
* [ckiptagger測試](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/ckiptagger_demo.ipynb)

加入自定義字典協助斷詞。
* [建立股票用語及名目字典](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/build_dict.ipynb)

將網路爬蟲所得的股票文章進行斷詞。
* [股票文章斷詞](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/word_segment.ipynb)

將斷詞後的資料轉換成詞袋模型 (Bag of Words Model)，轉換成數值型態。\
利用Scikit-Learn建立詞頻(Term Frequency, TF)和詞頻-逆向文件頻率(Term Frequency-Inverse Document Frequency, TF-IDF)矩陣，再利用pandas轉成DataFrame，以csv檔儲存。
* [TF & TF-IDF](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/word_segment.ipynb)

## 4.文字挖掘 (Text mining)
將股票文章對照台股名稱列表，找到每篇文章出現的股票。
* [尋找文章中的股票名](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/word_segment.ipynb)

上述資料利用Scikit-Learn轉成數值矩陣，使用pandas變成DataFrame的形式，以股票名為欄位名稱。
* [各文章股票出現紀錄](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/word_segment.ipynb)

利用R的dplyr套件將資料整理成各股票每日出現的次數。
* [每日股票出現次數](https://github.com/KangChungLin/Public-Opinion-Analysis/blob/master/word_segment.ipynb)
