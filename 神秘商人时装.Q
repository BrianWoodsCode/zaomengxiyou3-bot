[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=00949cef-3e8c-403e-9aa2-d4dd12ff442c
Description=神秘商人时装
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
Do

    '====================================
    ' 优先检测第五格
    '====================================
    FindPic 1574,309,1664,446,"Attachment:\购买.bmp",0.7,intX,intY

    If intX > 0 And intY > 0 Then

        '第五格开放，检查是否为时装
        FindPic 1574,309,1664,446,"Attachment:\时装.bmp",0.7,intX,intY

        If intX > 0 And intY > 0 Then

            '找到时装，购买第五格
            MoveTo 1620,434
            LeftClick 1
            Delay 2000

        Else

            '不是时装，点击第一格刷新第五格物品
            MoveTo 1210,438
            LeftClick 1
            Delay 600

        End If

    Else

        '====================================
        ' 第五格未开放，检测第四格
        '====================================
        FindPic 1474,309,1562,446,"Attachment:\购买.bmp",0.7,intX,intY

        If intX > 0 And intY > 0 Then

            '第四格开放，尝试推进到第五格
            MoveTo 1520,434
            LeftClick 1
            Delay 600

        Else

            '====================================
            ' 检测第三格
            '====================================
            FindPic 1372,309,1458,446,"Attachment:\购买.bmp",0.7,intX,intY

            If intX > 0 And intY > 0 Then

                '第三格开放，尝试推进到第四格
                MoveTo 1417,434
                LeftClick 1
                Delay 600

            Else

                '====================================
                ' 检测第二格
                '====================================
                FindPic 1253,309,1353,446,"Attachment:\购买.bmp",0.7,intX,intY

                If intX > 0 And intY > 0 Then

                    '第二格开放，尝试推进到第三格
                    MoveTo 1309,434
                    LeftClick 1
                    Delay 600

                Else

                    '====================================
                    ' 只有第一格开放
                    ' 尝试推进到第二格
                    '====================================
                    MoveTo 1210,438
                    LeftClick 1
                    Delay 600

                End If

            End If

        End If

    End If

    '等待界面稳定后重新识别
    Delay 300

Loop