casper.test.begin 'nikkei.comにアクセスしてタイトルが正しいか', 5, (test) ->
  casper.start 'http://www.nikkei.com/', ->
    test.comment "トップページにアクセス"
    test.assertHttpStatus 200
    test.assertTitleMatch /^日本経済新聞/
    test.assertExists "li.bs-latest a", "速報タブがある"

  casper.then ->
    test.comment "速報タブをクリック"
    # @click "li.bs-latest a"
    @clickLabel "速報"

  casper.then ->
    test.comment "速報ページにアクセス"
    test.assertHttpStatus 200
    test.assertUrlMatch "http://www.nikkei.com/news/category/"

  casper.run ->
    test.done()

