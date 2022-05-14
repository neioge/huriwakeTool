#####################
# inputフォルダに保存されたファイルを、拡張子ごとに整理して出力するスクリプトです。
#####################

# 実行パスに移動する。
cd "$PSScriptRoot"

#####################
#変数定義
#####################
# 実行パスとフォルダ名
$WORKSPACE =  $PSScriptRoot # バージョン３以上は実行パスをPSScriptRootで取得できる
$INPUT_FOLDER = "input"
$OUTUT_FOLDER = "output"

# 振り分け対象のファイルが保存されたフォルダと、出力するフォルダのフルパス
$INPUT_PATH = Join-Path $WORKSPACE $INPUT_FOLDER
$OUTPUT_PATH = Join-Path $WORKSPACE $OUTUT_FOLDER

# 作業フォルダに移動
cd "$INPUT_PATH"

# 本処理
Get-ChildItem | Group-Object Extension | ForEach-Object {
    $outDirEx = Join-Path $OUTPUT_PATH $_.Name
    if(!(Test-Path $outDirEx)){mkdir $outDirEx}
    $_.Group | %{copy $_.FullName $outDirEx }
}

# 処理を終了した後実行パスに戻す
cd "$PSScriptRoot"