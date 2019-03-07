# メモ
## Kannaを入れた際にヘッダが読み込まれなかった時の対処法
リポジトリのMarkdownに`In the project settings add $(SDKROOT)/usr/include/libxml2 to the "header search paths" field`とあるが，そこ自体は
プロジェクトファイル->Build Settings->Header Search Pathsに追加する
