<!--#include virtual="/_include/inchead.asp"-->
<!--#include virtual="/configProc/courseConfig.asp"-->
<!--#include virtual="/configProc/CourseClassList.asp"-->
<!--#include virtual="/configProc/CourseDivList.asp"-->
<!--#include virtual="/configProc/SchoolList.asp"-->
<!--#include virtual="/configProc/TeacherList.asp"-->
<!--#include virtual="/course/proc/course.asp"-->
<!--#include virtual="/course/proc/courseList.asp"-->
<%
If Not(chkPermission(mno, VIEW)) Then
	tmp = errPath(msg_nopermission, "/")
End If
Dim getConfigCourse, getCourse
Dim arrCourseClass, arrCourseDiv, arrSchool, arrCourseList, CourseView, arrCrcdList

Dim setSelect
' tbl_coursereal & tbl_courseclass
Dim crcd, clscd, divcd, crtitle, crinning, edusdate, eduedate, edustime, eduetime, edudays, eduhours, isimg, isncs, ncscd, occcd, edupay, govpay, selfpay, teacher, eduplace
Dim isview, crstatus, appcnt, isadtest, basictest, counseltest, educheck, testcnt, regdate, regadmin, lastupdate, lastupdater, clsname, divname, unity

' tbl_cousencs, tbl_couseocccode, tbl_couseedubr, tbl_couseeduplace, tbl_cousetest
Dim ncscode, ncsname, occcode, occname, cebcd, cebname, cebpgnames, cepcd, cepname, ctcd, ctname, ctmethod

Dim isCopy, copycd, copyCls, kind, realcnt, dropcnt, eajobcnt, curcnt, enrollper, recrper, uncompcnt, crtitle2
Dim compcnt, compcnt2, jobcnt, jobcnt2, compper, jobper, jobper2, jobper3, schsdate, schedate, rst2
Dim teacherGroup, teacherGroupArray, teacherArray, old_photo, tbphoto, file_name, file_root, img_path



mode = getQuery("mode")
self = "course_manage.asp?mno=" & mno
tb = "TBL_CourseReal"
width = "900"
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
</head>

<%
If mode = "proc" Then
%>
<!--#include virtual="/course/course_proc.asp"-->
<%
ElseIf mode = "list" Then
%>
<!--#include virtual="/course/course_list.asp"-->
<%
ElseIf mode = "form" Then
%>
<!--#include virtual="/course/course_form.asp"-->
<%
ElseIf mode = "formAdmin" Then
%>
<!--#include virtual="/course/course_form_admin.asp"-->
<%
ElseIf mode = "stat1" Then
%>
<!--#include virtual="/course/course_stat1.asp"-->
<%
ElseIf mode = "stat2" Then
%>
<!--#include virtual="/course/course_stat2.asp"-->
<%
ElseIf mode = "stat3" Then
%>
<!--#include virtual="/course/course_stat3.asp"-->
<%
ElseIf mode = "stat4" Then
%>
<!--#include virtual="/course/course_stat4.asp"-->
<%
ElseIf mode = "sub" Then
%>
<!--#include virtual="/course/course_sub.asp"-->
<%
ElseIf mode = "iproc" Then
%>
<!--#include virtual="/course/course_img_proc.asp"-->
<%
End If
%>

</body>
</html>

<!--#include virtual="/_include/inctail.asp"-->
