#####################
# input�t�H���_�ɕۑ����ꂽ�t�@�C�����A�g���q���Ƃɐ������ďo�͂���X�N���v�g�ł��B
#####################

# ���s�p�X�Ɉړ�����B
cd "$PSScriptRoot"

#####################
#�ϐ���`
#####################
# ���s�p�X�ƃt�H���_��
$WORKSPACE =  $PSScriptRoot # �o�[�W�����R�ȏ�͎��s�p�X��PSScriptRoot�Ŏ擾�ł���
$INPUT_FOLDER = "input"
$OUTUT_FOLDER = "output"

# �U�蕪���Ώۂ̃t�@�C�����ۑ����ꂽ�t�H���_�ƁA�o�͂���t�H���_�̃t���p�X
$INPUT_PATH = Join-Path $WORKSPACE $INPUT_FOLDER
$OUTPUT_PATH = Join-Path $WORKSPACE $OUTUT_FOLDER

# ��ƃt�H���_�Ɉړ�
cd "$INPUT_PATH"

# �{����
Get-ChildItem | Group-Object Extension | ForEach-Object {
    $outDirEx = Join-Path $OUTPUT_PATH $_.Name
    if(!(Test-Path $outDirEx)){mkdir $outDirEx}
    $_.Group | %{copy $_.FullName $outDirEx }
}

# �������I����������s�p�X�ɖ߂�
cd "$PSScriptRoot"