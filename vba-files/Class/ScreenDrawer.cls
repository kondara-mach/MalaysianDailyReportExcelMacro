VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ScreenDrawer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private mDrowEnabled As Boolean

Public Property Get RefreshDrow() As Boolean
    RefreshDrow = mDrowEnabled
End Property

Public Property Let RefreshDrow(ByVal vNewValue As Boolean)
    Select Case vNewValue
        Case True
            Call DrowStart
        Case False
            Call DroStop
    End Select
End Property

Private Sub class_initialize()
    '�`�揈���X�g�b�v
    Call DroStop
End Sub

Private Sub Class_Terminate()
    '��ʕ`��ĊJ
    If Not mDrowEnabled Then
        Call DrowStart
    End If
End Sub

Private Sub DrowStart()
    '��ʕ`��ĊJ
    mDrowEnabled = True
    Application.EnableEvents = True
    Application.ScreenUpdating = True
    Application.DisplayAlerts = True
    '�v�Z�����ĊJ
    Application.Calculation = xlCalculationAutomatic
    '�Čv�Z���s��
    Application.Calculate
End Sub

Private Sub DroStop()
    '�`�揈���X�g�b�v
    mDrowEnabled = False
    Application.ScreenUpdating = False
    Application.EnableEvents = False
    Application.DisplayAlerts = False
    '�v�Z�����X�g�b�v
    Application.Calculation = xlCalculationManual
End Sub