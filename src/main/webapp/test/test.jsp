<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <META NAME="Author" CONTENT="한글과컴퓨터"> 
    <META NAME="Keywords" CONTENT="한글, 체험판, 한글과컴퓨터, 한컴오피스, 지니톡, 평창올림픽, 2018 올림픽, 평창, 말랑말랑, 인터프리, 프리핸즈, 번역앱, HWP, 한컴, 한컴 체험판, 뷰어,이지포토, 클라우드 서비스, 오피스 프로그램, 한글뷰어, 한프랜즈, 디지털 노트, 문서 번역, 사물인터넷, 아래 한글, 업무 보안, 우문지, 이미지 에디터, 임베디드 솔루션, 전자책, 통번역, 파일호환" >
    <META NAME="Description" CONTENT="(주)한글과컴퓨터 웹사이트 방문을 환영합니다. ">
    <META NAME="Title" CONTENT="글로벌 소프트웨어의 리더 한글과컴퓨터">
    <META NAME="Classification" CONTENT="소프트웨어">
    <META NAME="Author-Date(Date)" CONTENT="2016-10-09">
    <META NAME="Location" CONTENT="대한민국">
    <title>웹한글기안기 활용 예제: 한글과컴퓨터</title>
    <link rel="stylesheet" href="https://webhwp-demo.hancom.com/css/hcwo_hwpctrl.css">
    <script type="text/javascript" src="https://webhwp-demo.hancom.com/js/libs/jquery/jquery-min.js"></script>
    <script type="text/javascript" src="https://webhwp-demo.hancom.com/js/hwpctrlapp/utils/util.js"></script>
    <script type="text/javascript" src="https://webhwp-demo.hancom.com/js/hwpctrlapp/hwpCtrlApp.js"></script>
    <script type="text/javascript" src="https://webhwp-demo.hancom.com/js/webhwpctrl.js"></script>
    <style>
        body {
            border : 0px solid black;
            margin : 0;
            padding : 0;
            background-color:white;
        }

        ::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
        ::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
        ::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}

        .loading_progress,
        .loading_progress:after {position:fixed; top:50%; left:45%; width:2em; height:2em; border-radius: 50%;}
        .loading_progress {
            position:fixed;
            font-size: 10px;
            text-indent: -9999em;
            border-top: 6px solid rgba(76, 115, 213, 0.9);
            border-right: 6px solid rgba(76, 115, 213, 0.9);
            border-bottom: 6px solid rgba(76, 115, 213, 0.9);
            border-left: 6px solid #ffffff;
            -webkit-transform: translateZ(0);
            -ms-transform: translateZ(0);
            transform: translateZ(0);
            -webkit-animation: load8 1.1s infinite linear;
            animation: load8 1.1s infinite linear;
        }
        @-webkit-keyframes load8 {
            0% {-webkit-transform: rotate(0deg); transform: rotate(0deg);}
            100% {-webkit-transform: rotate(360deg); transform: rotate(360deg);}
        }
        @keyframes load8 {
            0% {-webkit-transform: rotate(0deg); transform: rotate(0deg);}
            100% {-webkit-transform: rotate(360deg); transform: rotate(360deg);}
        }

        div {
            margin : 0;
            padding : 0;
            border : 0px solid black;
        }

        div.header {
            background: #e9ebfa url(images/bg_gian_header.png) top center repeat-x;
            height:140px;
            padding-left:10px;
            text-align: center;
        }
        div.header  header{height: 81px; position: relative;}
        div.header  header a{       
            position: absolute;
            left:24px;
            top: 24px;
        }
        div.header h1{
            background: transparent url(images/img_title_gian.png) top left no-repeat;
            width: 199px;
            height: 29px;
            display: inline-block;
            text-indent: -50000px;
            margin-top: 25px;
            font-weight: 100;
        }
        nav.btn{
            position: relative;
            padding-top: 10px;
            padding-bottom: 13px;
        }
        .btn label{
            position: relative;
            cursor: pointer;
            display: inline-block;
            vertical-align: middle;
            overflow: hidden;
            color: #fff;
            text-align: center;
            text-indent: -5000px !important;
            text-decoration: none !important;
            margin: 0;
            border: 0;
            width: 122px;
            height: 37px;
            cursor: pointer;
        }
        label.file-open{
            background: transparent url(images/btn_open_file.png) top left no-repeat;
        }
        label.file-run{
            background: transparent url(images/btn_run.png) top left no-repeat;
        }
        label.file-insert{
            background: transparent url(images/btn_insert_file.png) top left no-repeat;
        }
        label.file-open:hover, label.file-open:focus,
        label.file-insert:hover, label.file-insert:focus,
        label.file-run:hover, label.file-run:focus{
            background-position: 0px -37px;
        }
        
        aside {
            margin : 0px;
            background-color: #ffffff;
            border-left: 1px solid #d8d8d8;
            border-right: 1px solid #d8d8d8;
        }
        .object h3{font-size: 20px; font-weight: 100;}
        .object h4{font-size: 15px; font-weight: 100;}
        .object ul li span{font-size: 12px;}
        #apiName{ padding: 0px; margin: 0px; font-size: 20px; font-weight: 100;}
        #exampleText{ font-size: 12px;  color: #333; line-height: 1.6em;}
        #apilist h2{
            text-indent: -5000px;
            font-weight: 100;
            height: 68px;
            background: url(images/img_title_api.png) top left no-repeat;
            padding: 0px;
            margin: 0px;
            position: absolute;
            right: 0px;
            left: 0px;
        }
        #staticExample{
          margin-top: 10px
        }
        .overflow-yellow{
           height: 90%; overflow-y: auto; overflow-x: visible;
           margin-bottom: 10px;
           background: #f9f7e6;
           padding: 10px;
        }
        article{
            margin : 0px;
            padding : 30px;
            background-color:white;
        }
        aside#apilist .wrap{
            height: inherit;
            position: relative;
        }
        aside#apilist .wrap div.overflow nav{
            margin-top: 40px;
            padding: 20px;
        }
        aside#apiexample .wrap{
            padding: 18px 11px;
        }
        aside#apiexample .wrap .tab_area{
            padding: 10px;
            border: 1px solid #bbbbbb;
            overflow: hidden;
        }
        span.coreline {
            background-color: #eae087;
            font-weight: bold;
        }
        
        span.notsupported {
            color: red;
            text-decoration: line-through;
        }

        span.selected {
            color:white;
            background-color: lightgreen;
        }

        div.object{
            margin: 20px 0px 0px 0px;
        }

        h3.object {
            margin: 0px;
        }

        h4.type {
            margin: 0px;
            padding: 10px;
        }

        ul {
            margin: 0px;
        }

        input[type="button"] {
            width: auto;
            padding-left : 5px;
            padding-right : 5px;
            color:black;
            background-color:white;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            font-size: 8.5pt;
            font-weight: bold;
        }

        li:hover {
            color:blue;
        }

        input[type="text"] {
            margin:0px 6px 0px 0px;
            padding:0;
            color:black;
            border: 2px solid gray;
            background-color:white;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            font-size: 9pt;
            font-weight: bold;
        }

        input[type="button"] {
            color: #333;
            font-size: 13px;
            border: none;
            width: 116px;
            text-align: center;
            cursor: pointer;
            padding: 0px;
            height: 30px;
        }

        input[type="button"].selected {
            background: #f7f7f7;
        }

        input[type="button"]:hover {
            background-color:lightgray;
        }

        input[type="text"]:hover {
            border: 2px solid deepskyblue;
        }

        input:active {
            border: 2px solid gray;
            background-color:darkgray;
        }
    </style>
    <script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-79918145-1', 'auto');
	</script>
</head>


<body width="100%" height="100%">
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-NX7HVS"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NX7HVS');</script>
<!-- End Google Tag Manager -->
<div  class="header" id="header">
    <header>
        <h1>웹한글컨트롤 API</h1>
        <a href="https://www.hancom.com/" style="border: 0px;" target="_blank"><img src="images/img_logo.png" alt="" style="border: 0px;"></a>
    </header>
    <nav class="btn">
        <label  class="file-open" for="파일열기" id="labelOpen">
            <input type="button" id="open_button" value="파일열기" style="color:white; background: black" />
        </label>
        <!--label class="file-insert"  for="파일끼워넣기"  id="labelInsert"> 
            <input type="button" id="insert_button" value="파일끼워넣기" style="color:white; background: black"/>
        </label//-->
        <input type="file" id="open" name="openFile" style="visibility: hidden;width:1px"/>
    </nav>
</div>

<div id="loader" style="overflow:auto;">
    <div class="loading_progress">
    </div>
</div>

<div id="body" >
    <aside id="apilist" style="width:15%; float:left; ">
        <div class="wrap">
        <h2>API 목록</h2>
        <div class="overflow" style="height: inherit; overflow-y: auto; overflow-x: auto">
            <nav>
                <div class="object" id="Action">
                    <h3 class="object">Action</h3>
                    <h4 class="type">Properties</h4>
                    <ul>
                        <li id="Action_Properties_0">
                            <span onclick=" window[id](id);" id="OnActionID">ActID</span>
                        </li>
                        <li id="Action_Properties_1">
                            <span onclick=" window[id](id);" id="OnActionSetID">SetID</span>
                        </li>
                    </ul>
                    <h4 class="type">Method</h4>
                    <ul>
                        <li id="Action_Method_0">
                            <span onclick=" window[id](id);" id="OnActionCreateSet">CreateSet</span>
                        </li>
                        <li id="Action_Method_1">
                            <span onclick=" window[id](id);" id="OnGetDefault">GetDefault</span>
                        </li>
                        <li id="Action_Method_2">
                            <span onclick=" window[id](id);" id="OnPopupDialog">PopupDialog</span>
                        </li>
                        <li id="Action_Method_3">
                            <span onclick=" window[id](id);" id="OnExecute">Execute</span>
                        </li>
                        <li id="Action_Method_4">
                            <span onclick=" window[id](id);" id="OnActionRun">Run</span>
                        </li>
                    </ul>
                </div>
                <div class="object" id="CtrlCode">
                    <h3 class="object">CtrlCode</h3>
                    <h4 class="type">Properties</h4>
                    <ul>
                        <li id="CtrlCode_Properties_0">
                            <span onclick=" window[id](id);" id="OnCtrlCh">CtrlCh</span>
                        </li>
                        <li id="CtrlCode_Properties_1">
                            <span onclick=" window[id](id);" id="OnCtrlID">CtrlID</span>
                        </li>
                        <li id="CtrlCode_Properties_2">
                            <span onclick=" window[id](id);" id="OnNext">Next</span>
                        </li>
                        <li id="CtrlCode_Properties_3">
                            <span onclick=" window[id](id);" id="OnPrev">Prev</span>
                        </li>
                        <li id="CtrlCode_Properties_4">
                            <span onclick=" window[id](id);" id="OnProperties">Properties</span>
                        </li>
                        <li id="CtrlCode_Properties_5">
                            <span onclick=" window[id](id);" id="OnUserDesc">UserDesc</span>
                        </li>
                    </ul>
                    <h4 class="type">Method</h4>
                    <ul>
                        <li id="CtrlCode_Method_0">
                            <span onclick=" window[id](id);" id="OnGetAnchorPos">GetAnchorPos</span>
                        </li>
                    </ul>
                </div>
                <div class="object" id="ParameterSet">
                    <h3 class="object">ParameterSet</h3>
                    <h4 class="type">Properties</h4>
                    <ul>
                        <li id="ParameterSet_Properties_0">
                            <span onclick=" window[id](id);" id="OnParameterSetCount">Count</span>
                        </li>
                        <li id="ParameterSet_Properties_1">
                            <span onclick=" window[id](id);" id="OnParameterSetIsSet">IsSet</span>
                        </li>
                        <li id="ParameterSet_Properties_2">
                            <span onclick=" window[id](id);" id="OnParameterSetID">SetID</span>
                        </li>
                    </ul>
                    <h4 class="type">Method</h4>
                    <ul>
                        <li id="ParameterSet_Method_0">
                            <span onclick=" window[id](id);" id="OnParameterSetClone">Clone</span>
                        </li>
                        <li id="ParameterSet_Method_1">
                            <span onclick=" window[id](id);" id="OnCreateItemArray">CreateItemArray</span>
                        </li>
                        <li id="ParameterSet_Method_2">
                            <span onclick=" window[id](id);" id="OnCreateItemSet">CreateItemSet</span>
                        </li>
                        <li id="ParameterSet_Method_3">
                            <span onclick=" window[id](id);" id="OnGetInterSection">GetInterSection</span>
                        </li>
                        <li id="ParameterSet_Method_4">
                            <span onclick=" window[id](id);" id="OnIsEquivalent">IsEquivalent</span>
                        </li>
                        <li id="ParameterSet_Method_5">
                            <span onclick=" window[id](id);" id="OnItem">Item</span>
                        </li>
                        <li id="ParameterSet_Method_6">
                            <span onclick=" window[id](id);" id="OnItemExist">ItemExist</span>
                        </li>
                        <li id="ParameterSet_Method_7">
                            <span onclick=" window[id](id);" id="OnMerge">Merge</span>
                        </li>
                        <li id="ParameterSet_Method_8">
                            <span onclick=" window[id](id);" id="OnRemoveAll">RemoveAll</span>
                        </li>
                        <li id="ParameterSet_Method_9">
                            <span onclick=" window[id](id);" id="OnRemoveItem">RemoveItem</span>
                        </li>
                        <li id="ParameterSet_Method_10">
                            <span onclick=" window[id](id);" id="OnParameterSet_SetItem">SetItem</span>
                        </li>
                    </ul>
                </div>
                <div class="object" id="ParameterArray">
                    <h3 class="object">ParameterArray</h3>
                    <h4 class="type">Properties</h4>
                    <ul>
                        <li id="ParameterArray_Properties_0">
                            <span onclick=" window[id](id);" id="OnParameterArrayCount">Count</span>
                        </li>
                        <li id="ParameterArray_Properties_1">
                            <span onclick=" window[id](id);" id="OnParameterArrayIsSet">IsSet</span>
                        </li>
                    </ul>
                    <h4 class="type">Method</h4>
                    <ul>
                        <li id="ParameterArray_Method_0">
                            <span onclick=" window[id](id);" id="OnParameterArrayClone">Clone</span>
                        </li>
                        <li id="ParameterArray_Method_1">
                            <span onclick=" window[id](id);" id="OnParameterArrayCopy">Copy</span>
                        </li>
                        <li id="ParameterArray_Method_2">
                            <span onclick=" window[id](id);" id="OnParameterArrayItem">Item</span>
                        </li>
                        <li id="ParameterArray_Method_3">
                            <span onclick=" window[id](id);" id="OnParameterArraySetItem">SetItem</span>
                        </li>
                    </ul>
                </div>
                <div class="object" id="HwpCtrlNav">
                    <h3 class="object">HwpCtrl</h3>
                    <h4 class="type">Properties</h4>
                    <ul>
                        <!--li id="HwpCtrl_Properties_0">
                            <span onclick=" window[id](id);" id="OnAutoShowHideToolBar">AutoShowHideToolBar</span>
                        </li//-->
                        <li id="HwpCtrl_Properties_1">
                            <span onclick=" window[id](id);" id="OnCellShape">CellShape</span>
                        </li>
                        <li id="HwpCtrl_Properties_2">
                            <span onclick=" window[id](id);" id="OnCharShape">CharShape</span>
                        </li>
                        <li id="HwpCtrl_Properties_3">
                            <span onclick=" window[id](id);" id="OnCurFieldState">CurFieldState</span>
                        </li>
                        <li id="HwpCtrl_Properties_4">
                            <span onclick=" window[id](id);" id="OnEditMode">EditMode</span>
                        </li>
                        <li id="HwpCtrl_Properties_5">
                            <span onclick=" window[id](id);" id="OnEngineProperties">EngineProperties</span>
                        </li>
                        <li id="HwpCtrl_Properties_6">
                            <span onclick=" window[id](id);" id="OnHeadCtrl">HeadCtrl</span>
                        </li>
                        <li id="HwpCtrl_Properties_7">
                            <span onclick=" window[id](id);" id="OnIsEmpty">IsEmpty</span>
                        </li>
                        <li id="HwpCtrl_Properties_8">
                            <span onclick=" window[id](id);" id="OnIsModified">IsModified</span>
                        </li>
                        <!--li id="HwpCtrl_Properties_9">
                            <span onclick=" window[id](id);" id="OnIsPreviewMode">IsPreviewMode</span>
                        </li//-->
                        <li id="HwpCtrl_Properties_10">
                            <span onclick=" window[id](id);" id="OnLastCtrl">LastCtrl</span>
                        </li>
                        <li id="HwpCtrl_Properties_11">
                            <span onclick=" window[id](id);" id="OnPageCount">PageCount</span>
                        </li>
                        <li id="HwpCtrl_Properties_12">
                            <span onclick=" window[id](id);" id="OnParaShape">ParaShape</span>
                        </li>
                        <li id="HwpCtrl_Properties_13">
                            <span onclick=" window[id](id);" id="OnParentCtrl">ParentCtrl</span>
                        </li>
                        <li id="HwpCtrl_Properties_14">
                            <span onclick=" window[id](id);" id="OnSelectionMode">SelectionMode</span>
                        </li>
                        <li id="HwpCtrl_Properties_15">
                            <span onclick=" window[id](id);" id="OnVersion">Version</span>
                        </li>
                        <li id="HwpCtrl_Properties_16">
                            <span onclick=" window[id](id);" id="OnViewProperties">ViewProperties</span>
                        </li>
                        <li id="HwpCtrl_Properties_17">
                            <span onclick=" window[id](id);" id="OnScrollPosInfo">ScrollPosInfo</span>
                        </li>
                        <!--<li id="HwpCtrl_Properties_18">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnHyperlinkMode">HyperlinkMode</span>-->
                        <!--</li>-->
                        <li id="HwpCtrl_Properties_19">
                            <span onclick=" window[id](id);" id="OnReadOnlyMode">ReadOnlyMode</span>
                        </li>
                        <li id="HwpCtrl_Properties_20">
                            <span onclick=" window[id](id);" id="OnCurSelectedCtrl">CurSelectedCtrl</span>
                        </li>
                        <!--<li id="HwpCtrl_Properties_21">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnIsPrivateInfoProtected">IsPrivateInfoProtected</span>-->
                        <!--</li>-->
                    </ul>
                    <h4 class="type">Method</h4>
                    <ul>
                        <li id="HwpCtrl_Method_0">
                            <span onclick=" window[id](id);" id="OnClear">Clear</span>
                        </li>
                        <li id="HwpCtrl_Method_1">
                            <span onclick=" window[id](id);" id="OnCreateAction">CreateAction</span>
                        </li>
                        <li id="HwpCtrl_Method_2">
                            <span onclick=" window[id](id);" id="OnCreateField">CreateField</span>
                        </li>
                        <li id="HwpCtrl_Method_3">
                            <span onclick=" window[id](id);" id="OnCreatePageImage">CreatePageImage</span>
                        </li>
                        <li id="HwpCtrl_Method_4">
                            <span onclick=" window[id](id);" id="OnCreateSet">CreateSet</span>
                        </li>
                        <li id="HwpCtrl_Method_5">
                            <span onclick=" window[id](id);" id="OnDeleteCtrl">DeleteCtrl</span>
                        </li>
                        <li id="HwpCtrl_Method_6">
                            <span onclick=" window[id](id);" id="OnFieldExist">FieldExist</span>
                        </li>
                        <li id="HwpCtrl_Method_7">
                            <span onclick=" window[id](id);" id="OnGetCurFieldName">GetCurFieldName</span>
                        </li>
                        <li id="HwpCtrl_Method_8">
                            <span onclick=" window[id](id);" id="OnGetFieldList">GetFieldList</span>
                        </li>
                        <li id="HwpCtrl_Method_9">
                            <span onclick=" window[id](id);" id="OnGetFieldText">GetFieldText</span>
                        </li>
                        <!--<li id="HwpCtrl_Method_10">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnGetFileInfo">GetFileInfo</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_11">-->
                        <!--<span onclick=" window[id](id);" class="notsupported" id="OnGetFilterList">GetFilterList</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_12">-->
                        <!--<span onclick=" window[id](id);" id="OnGetFormObjectAttr">GetFormObjectAttr</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_13">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnGetMessageSet">GetMessageSet</span>-->
                        <!--</li>-->
                        <li id="HwpCtrl_Method_14">
                            <span onclick=" window[id](id);" id="OnGetMousePos">GetMousePos</span>
                        </li>
                        <li id="HwpCtrl_Method_15">
                            <span onclick=" window[id](id);" id="OnGetPos">GetPos</span>
                        </li>
                        <li id="HwpCtrl_Method_16">
                            <span onclick=" window[id](id);" id="OnGetPosBySet">GetPosBySet</span>
                        </li>
                        <li id="HwpCtrl_Method_17">
                            <span onclick=" window[id](id);" id="OnGetSelectedPos">GetSelectedPos</span>
                        </li>
                        <li id="HwpCtrl_Method_18">
                            <span onclick=" window[id](id);" id="OnGetSelectedPosBySet">GetSelectedPosBySet</span>
                        </li>
                        <li id="HwpCtrl_Method_19">
                            <span onclick=" window[id](id);" id="OnGetTableCellAddr">GetTableCellAddr</span>
                        </li>
                        <li id="HwpCtrl_Method_20">
                            <span onclick=" window[id](id);" id="OnGetText">GetText</span>
                        </li>
                        <li id="HwpCtrl_Method_21">
                            <span onclick=" window[id](id);" id="OnGetTextBySet">GetTextBySet</span>
                        </li>
                        <li id="HwpCtrl_Method_22">
                            <span onclick=" window[id](id);" id="OnGetTextFile">GetTextFile</span>
                        </li>
                        <li id="HwpCtrl_Method_23">
                            <span onclick=" window[id](id);" id="OnGetViewStatus">GetViewStatus</span>
                        </li>
                        <li id="HwpCtrl_Method_24">
                            <span onclick=" window[id](id);" id="OnInitScan">InitScan</span>
                        </li>
                        <li id="HwpCtrl_Method_25">
                            <span onclick=" window[id](id);" id="OnInsert">Insert</span>
                        </li>
                        <li id="HwpCtrl_Method_26">
                            <span onclick=" window[id](id);" id="OnInsertBackgroundPicture">InsertBackgroundPicture</span>
                        </li>
                        <li id="HwpCtrl_Method_27">
                            <span onclick=" window[id](id);" id="OnInsertCtrl">InsertCtrl</span>
                        </li>
                        <li id="HwpCtrl_Method_28">
                            <span onclick=" window[id](id);" id="OnInsertPicture">InsertPicture</span>
                        </li>
                        <li id="HwpCtrl_Method_29">
                            <span onclick=" window[id](id);" id="OnIsCommandLock">IsCommandLock</span>
                        </li>
                        <li id="HwpCtrl_Method_30">
                            <span onclick=" window[id](id);" id="OnKeyIndicator">KeyIndicator</span>
                        </li>
                        <li id="HwpCtrl_Method_31">
                            <span onclick=" window[id](id);" id="OnLockCommand">LockCommand</span>
                        </li>
                        <li id="HwpCtrl_Method_32">
                            <span onclick=" window[id](id);" id="OnModifyFieldProperties">ModifyFieldProperties</span>
                        </li>
                        <li id="HwpCtrl_Method_33">
                            <span onclick=" window[id](id);" id="OnMovePos">MovePos</span>
                        </li>
                        <li id="HwpCtrl_Method_34">
                            <span onclick=" window[id](id);" id="OnMoveToField">MoveToField</span>
                        </li>
                        <li id="HwpCtrl_Method_35">
                            <span onclick=" window[id](id);" id="OnMoveToFieldEx">MoveToFieldEx</span>
                        </li>
                        <li id="HwpCtrl_Method_36">
                            <span onclick=" window[id](id);" id="OnOpen">Open</span>
                        </li>
                        <li id="HwpCtrl_Method_37">
                            <span onclick=" window[id](id);" id="OnPutFieldText">PutFieldText</span>
                        </li>
                        <li id="HwpCtrl_Method_38">
                            <span onclick=" window[id](id);" id="OnReleaseScan">ReleaseScan</span>
                        </li>
                        <li id="HwpCtrl_Method_39">
                            <span onclick=" window[id](id);" id="OnRenameField">RenameField</span>
                        </li>
                        <li id="HwpCtrl_Method_40">
                            <span onclick=" window[id](id);" id="OnReplaceAction">ReplaceAction</span>
                        </li>
                        <li id="HwpCtrl_Method_41">
                            <span onclick=" window[id](id);" id="OnRun">Run</span>
                        </li>
                        <!--<li id="HwpCtrl_Method_42">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnSave">Save</span>-->
                        <!--</li>-->
                        <li id="HwpCtrl_Method_43">
                            <span onclick=" window[id](id);" id="OnSaveAs">SaveAs</span>
                        </li>
                        <li id="HwpCtrl_Method_44">
                            <span onclick=" window[id](id);" id="OnSelectText">SelectText</span>
                        </li>
                        <!--<li id="HwpCtrl_Method_45">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnSetClientName">SetClientName</span>-->
                        <!--</li>-->
                        <li id="HwpCtrl_Method_46">
                            <span onclick=" window[id](id);" id="OnSetCurFieldName">SetCurFieldName</span>
                        </li>
                        <li id="HwpCtrl_Method_47">
                            <span onclick=" window[id](id);" id="OnSetFieldViewOption">SetFieldViewOption</span>
                        </li>
                        <!--<li id="HwpCtrl_Method_48">-->
                        <!--<span onclick=" window[id](id);" id="OnSetFormObjectAttr">SetFormObjectAttr</span>-->
                        <!--</li>-->
                        <li id="HwpCtrl_Method_49">
                            <span onclick=" window[id](id);" id="OnSetPos">SetPos</span>
                        </li>
                        <li id="HwpCtrl_Method_50">
                            <span onclick=" window[id](id);" id="OnSetPosBySet">SetPosBySet</span>
                        </li>
                        <li id="HwpCtrl_Method_51">
                            <span onclick=" window[id](id);" id="OnSetTextFile">SetTextFile</span>
                        </li>
                        <li id="HwpCtrl_Method_52">
                            <span onclick=" window[id](id);" id="OnSetToolBar">SetToolBar</span>
                        </li>
                        <li id="HwpCtrl_Method_53">
                            <span onclick=" window[id](id);" id="OnShowStatusBar">ShowStatusBar</span>
                        </li>
                        <li id="HwpCtrl_Method_54">
                            <span onclick=" window[id](id);" id="OnShowToolBar">ShowToolBar</span>
                        </li>
                        <li id="HwpCtrl_Method_55">
                            <span onclick=" window[id](id);" id="OnShowRibbon">ShowRibbon</span>
                        </li>
                        <li id="HwpCtrl_Method_56">
                            <span onclick=" window[id](id);" id="OnOpenDocument">OpenDocument</span>
                        </li>
                        <li id="HwpCtrl_Method_57">
                            <span onclick=" window[id](id);" id="OnSaveDocument">SaveDocument</span>
                        </li>
                        <li id="HwpCtrl_Method_58">
                            <span onclick=" window[id](id);" id="OnInsertDocument">InsertDocument</span>
                        </li>
                        <!--<li id="HwpCtrl_Method_59">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnInsertMenu">InsertMenu</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_60">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnRemoveMenu">RemoveMenu</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_61">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnExportStyle">ExportStyle</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_62">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnImportStyle">ImportStyle</span>-->
                        <!--</li>-->
                        <li id="HwpCtrl_Method_63">
                            <span onclick=" window[id](id);" id="OnIsSpellCheckCompleted">IsSpellCheckCompleted</span>
                        </li>
                        <li id="HwpCtrl_Method_64">
                            <span onclick=" window[id](id);" id="OnGetHeadingString">GetHeadingString</span>
                        </li>
                        <!--<li id="HwpCtrl_Method_65">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnGetContextMenu">GetContextMenu</span>-->
                        <!--</li>-->
                        <li id="HwpCtrl_Method_66">
                            <span onclick=" window[id](id);" id="OnGetCtrlHorizontalOffset">GetCtrlHorizontalOffset</span>
                        </li>
                        <li id="HwpCtrl_Method_67">
                            <span onclick=" window[id](id);" id="OnGetCtrlVerticalOffset">GetCtrlVerticalOffset</span>
                        </li>
                        <li id="HwpCtrl_Method_68">
                            <span onclick=" window[id](id);" id="OnSolarToLunar">SolarToLunar</span>
                        </li>
                        <li id="HwpCtrl_Method_69">
                            <span onclick=" window[id](id);" id="OnSolarToLunarBySet">SolarToLunarBySet</span>
                        </li>
                        <li id="HwpCtrl_Method_70">
                            <span onclick=" window[id](id);" id="OnLunarToSolar">LunarToSolar</span>
                        </li>
                        <li id="HwpCtrl_Method_71">
                            <span onclick=" window[id](id);" id="OnLunarToSolarBySet">LunarToSolarBySet</span>
                        </li>
                        <li id="HwpCtrl_Method_72">
                            <span onclick=" window[id](id);" id="OnShowVerticalScroll">ShowVerticalScroll</span>
                        </li>
                        <li id="HwpCtrl_Method_73">
                            <span onclick=" window[id](id);" id="OnShowHorizontalScroll">ShowHorizontalScroll</span>
                        </li>
                        <li id="HwpCtrl_Method_74">
                            <span onclick=" window[id](id);" id="OnShowCaret">ShowCaret</span>
                        </li>
                        <!--<li id="HwpCtrl_Method_75">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnShowPageToolTip">ShowPageToolTip</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_76">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnCreatePageImageEx">CreatePageImageEx</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_77">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnAboutBox">AboutBox</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_78">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnConvertPUAHangulToUnicode">ConvertPUAHangulToUnicode</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_79">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnSetMessageBoxMode">SetMessageBoxMode</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_80">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnGetMessageBoxMode">GetMessageBoxMode</span>-->
                        <!--</li>-->
                        <!--<li id="HwpCtrl_Method_81">-->
                        <!--<span onclick=" window[id](id);" class="notsupported" id="OnSetBarCodeImage">SetBarCodeImage</span>-->
                        <!--</li>-->
                        <li id="HwpCtrl_Method_82">
                            <span onclick=" window[id](id);" id="OnGetPageText">GetPageText</span>
                        </li>
                        <li id="HwpCtrl_Method_83">
                            <span onclick=" window[id](id);" id="OnAddEventListener">AddEventListenter</span>
                        </li>
                    </ul>
                    <h4 class="type">Event</h4>
                    <ul>
                        <!--<li id="HwpCtrl_Event_0">-->
                            <!--<span onclick=" window[id](id);" class="notsupported" id="OnNotifyMessage">NotifyMessage</span>-->
                        <!--</li>-->
                        <li id="HwpCtrl_Event_1">
                            <span onclick=" window[id](id);" id="OnMouseLButtonDownTest">OnMouseLButtonDown</span>
                        </li>
                        <li id="HwpCtrl_Event_2">
                            <span onclick=" window[id](id);" id="OnMouseLButtonUpTest">OnMouseLButtonUp</span>
                        </li>
                        <li id="HwpCtrl_Event_3">
                            <span onclick=" window[id](id);" id="OnScrollTest">OnScroll</span>
                        </li>
                    </ul>
                    <br><br><br><br>
                </div>
            </nav>
        </div>
	 </div><!--.wrap-->
    </aside>
    <section id="content" style="float:left">
        <div id="hwpCtrl" style="width:100%;height:100%;" />
    </section>
    <aside id ="apiexample" style="width:25%; float:right;">
		<div class="wrap"> 
        <div class="tab_area"> 
        <input class="selected" type="button" id="staticButton" value="Example"  onclick= "ChangeExampleWorkSpace(true);"/>
        <input class="button" type="button" id="dynamicButton" value="Try it Yourself"  onclick= "ChangeExampleWorkSpace(false);"/>

        <div id="dynamicExample" style="display: none;">
            <br>
            <textarea id="inputScript" style="width: 100%; height: 300px;"></textarea>
            <br>
            <br>
            <div class="btn" style="text-align: center;">   
                <label for="run" class="file-run" id="labeldynamicRun">
                <input class="button" type="button" id="dynamicRun" value="Run"  onclick= "DynamicRun()"/>
             </label>
            </div>
        </div>
        <div id="staticExample">
           <div class="overflow-yellow">    
                <h2><p id="apiName"></p></h2>
                <p id="exampleText">
                </p>
                <br>
            </div>
             <div class="btn" style="text-align: center;">   
                <label for="run" class="file-run" id="labelRun">
                        <input class="button" type="button" id="RunButton" value="Run"  onclick= "Run()"/>
                <label>
            </div>
        </div>
        </div><!-- tab_area -->
        </div><!--.wrap-->
    </aside>

</div>


<script>

	var staticExampleWorkSpace = document.getElementById("staticExample");
	var dynamicExampleWorkSpace = document.getElementById("dynamicExample");
	var staticExampleButton = document.getElementById("staticButton");
	var dynamicExampleButton = document.getElementById("dynamicButton");
	var inputScript = document.getElementById("inputScript");
	var apiExampleElement = document.getElementById("exampleText");
	var apiNameElement = document.getElementById("apiName");
	var runName = "";
	var lastSelectedList ="";

	$('#labelRun').click(function() {
		Run();
	});
	
	$('#labeldynamicRun').click(function() {
		DynamicRun();
	});
	
	$('#labelOpen').click(function() {
		//openDiag.click();
		//urlOpen();
		openButton.onclick(); 
	});
	
	//$('#labelInsert').click(function() {
	//	insertDiag.click();
	//});

	var hideLoader = function() {
		var loader = document.getElementById("loader");
		loader.style.display = "none";
	};

	// Set onreisze event
	var resize = function(e) {
		var windowWidth = document.body.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		var windowHeight = document.body.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
		var body_panel = document.getElementById("body");
		var header_panel = document.getElementById("header");
		body_panel.style.width = (parseInt(windowWidth)) + "px";
		body_panel.style.height = (parseInt(windowHeight) - parseInt(header_panel.offsetHeight)) + "px";

		var apilist_panel = document.getElementById("apilist");
		var apiexample_panel = document.getElementById("apiexample");
		var hwpctrl_panel = document.getElementById("hwpCtrl");
		apilist_panel.style.height =body_panel.offsetHeight+ "px";
		apiexample_panel.style.height =body_panel.offsetHeight+ "px";
		hwpctrl_panel.style.height =body_panel.offsetHeight+ "px";
		hwpctrl_panel.style.width =windowWidth - apilist_panel.offsetWidth  - apiexample_panel.offsetWidth -10 - (body_panel.offsetWidth - body_panel.clientWidth) + "px";

		var hwpctrl_frame = document.getElementById("hwpctrl_frame");
		if (hwpctrl_frame != null) {
			hwpctrl_frame.width = parseInt(hwpctrl_panel.style.width);
			hwpctrl_frame.style.width = hwpctrl_panel.style.width;
			hwpctrl_frame.height = parseInt(hwpctrl_panel.style.height);
			hwpctrl_frame.style.height = hwpctrl_panel.style.height;
		}
	}

	var init = function () {
		resize();
		SetExampleElements(0, 'ActionIDTest', 'ActID');
	};

	window.onresize = resize;
	window.onload = init;

	var HwpCtrl = BuildWebHwpCtrl("hwpCtrl", location.href, function() {
		hideLoader();
	});

	var Run = function () {
		if(runName)
			window[runName]();
	};

	var DynamicRun = function () {
		(new Function(inputScript.value))();
	};

	//1.Action
	//1.1 Properties
	//1.1.1 ActID
	var ActionIDTest = function () {
		var act = HwpCtrl.CreateAction("TableCreate");
		alert("Action ID : " + act.ActID);
	};

	var OnActionID = function(id){
		SelectItem(id, 0, 'ActionIDTest', 'ActID');
	};

	//1.1.2 SetID
	var ActionSetIDTest = function () {
		var act = HwpCtrl.CreateAction("TableCreate");
		alert("Set ID : " + act.SetID);
	};

	var OnActionSetID = function(id){
		SelectItem(id, 0, 'ActionSetIDTest', 'SetID');
	};

	//1.2 Method
	//1.2.1 CreateSet
	var OnActionCreateSet = function(id){
		SelectItem(id, 0, 'TableCreate', 'CreateSet');
	};

	//1.2.2 GetDefault
	var OnGetDefault = function(id){
		SelectItem(id, 0, 'TableCreate2', 'GetDefault');
	};

	//1.2.3 PopupDialog
	var OnPopupDialog= function(id){
		SelectItem(id, 0, 'ActionExecuteTest', "PopupDialog");
	};

	var ActionExecuteTest = function(){
		var charAction = HwpCtrl.CreateAction("CharShape");
		var charSet = charAction.CreateSet();
		charAction.GetDefault(charSet);
		charAction.PopupDialog(charSet, function () {
			charAction.Execute(charSet);
		}, null);
	};

	//1.2.4 Execute
	var OnExecute = function(id){
		SelectItem(id, 0, 'ActionExecuteTest', 'Execute');
	};

	//1.2.5 Run
	var ActionRunTest = function () {
		var act = HwpCtrl.CreateAction('CharShapeBold');// 액션 생성
		act.Run(); //액션 실행
	};

	var OnActionRun = function(id){
		SelectItem(id, 0, 'ActionRunTest', 'Run');
	};

	//2. CtrlCode
	//2.1 Properties
	//2.1.1 CtrlCh
	var CtrlChTest = function () {
		var ctrl = HwpCtrl.HeadCtrl;
		while(ctrl) {
			if (ctrl.CtrlCh == 16) {
				alert('머리말/꼬리말이 존재합니다.');
				return;
			}
			ctrl = ctrl.Next;
		}
		alert('머리말/꼬리말이 없습니다.');
	};

	var OnCtrlCh = function (id) {
		SelectItem(id, 0, 'CtrlChTest', 'CtrlCh');
	};

	//2.1.2 CtrlID
	var OnCtrlID = function (id) {
		SelectItem(id, 0, 'ChangeAllCellSpacing', 'CtrlID');
	};

	//2.1.3 Next
	var OnNext = function (id) {
		SelectItem(id, 0, 'ChangeAllCellSpacing', 'Next');
	};

	//2.1.4 Prev
	var OnPrev = function (id) {
		SelectItem(id, 0, 'ChangeAllCellSpacingByReverseTracing', 'Prev');
	};

	//2.1.5 Properties
	var OnProperties = function(id) {
		SelectItem(id, 0, 'ChangeAllCellSpacing', 'Properties');
	};

	//2.1.6 UserDesc
	var UserDescTest = function () {
		alert(HwpCtrl.CurSelectedCtrl.UserDesc);
	};

	var OnUserDesc = function(id) {
		SelectItem(id, 0, 'UserDescTest', 'UserDesc');
	};

	//2.2 Method
	//2.2.1 GetAnchorPos
	var GetAnchorPosTest = function () {
		var code = HwpCtrl.HeadCtrl;
		var paramSet = null;
		var list = 0;
		var para = 0;
		var pos = 0;

		while (code && code != HwpCtrl.LastCtrl) {
			var strID = code.CtrlID;
			if (strID =='tbl') {
				paramSet = code.GetAnchorPos(0);
				list = paramSet.Item('List');
				para  = paramSet.Item('Para');
				pos  = paramSet.Item('Pos');
				HwpCtrl.SetPos(list, para, pos);
				return true;
			}
			code = code.Next;
		}
		return false;
	};

	var OnGetAnchorPos = function(id) {
		SelectItem(id, 0, 'GetAnchorPosTest', 'GetAnchorPos');
	};

	//3. ParameterSet
	//3.1 Properties
	//3.1.1 Count
	var OnParameterSetCount = function(id){
		SelectItem(id, 0, 'ParameterSet_ArrayPropertiesTest', 'Count');
	};

	//3.1.2 IsSet
	var OnParameterSetIsSet = function(id){
		SelectItem(id, 0, 'ParameterSet_ArrayPropertiesTest', 'IsSet');
	};

	//3.1.3 SetID
	var OnParameterSetID = function(id){
		SelectItem(id, 0, 'ParameterSet_ArrayPropertiesTest', 'SetID');
	};

	//3.2 Method
	//3.2.1 Clone
	var OnParameterSetClone = function(id){
		SelectItem(id, 0, 'ParameterSetMethodTest2', 'Clone');
	};

	//3.2.2 CreateItemArray
	var OnCreateItemArray = function (id) {
		SelectItem(id, 0, 'TableCreate2', 'CreateItemArray');
	};

	//3.2.3 CreateItemSet
	var CreateItemSetTest = function () {
		var act = HwpCtrl.CreateAction('PageSetup');
		var set = act.CreateSet();
		act.GetDefault(set);

		set.SetItem('ApplyTo', 3); //적용범위 : 문서전체

		var pset = set.CreateItemSet('PageDef','PageDef');

		// 1mm = 283.465 HWPUNITs
		pset.SetItem('TopMargin', 3401);
		pset.SetItem('BottomMargin', 5669);
		pset.SetItem('LeftMargin', 4251);
		pset.SetItem('RightMargin', 4251);
		pset.SetItem('HeaderLen', 0);
		pset.SetItem('FooterLen', 0);
		pset.SetItem('GutterLen', 0);
		act.Execute(set);
	};

	var OnCreateItemSet = function(id){
		SelectItem(id, 0, 'CreateItemSetTest', 'CreateItemSet');
	};

	//3.2.4 GetInterSection
	var OnGetInterSection = function (id) {
		SelectItem(id, 0, 'ParameterSetMethodTest', 'GetIntersection');
	};

	//3.2.5 IsEquivalent
	var OnIsEquivalent = function(id){
		SelectItem(id, 0, 'ParameterSetMethodTest2', 'IsEquivalent');
	};

	//3.2.6 Item
	var ItemTest = function () {
		var posSet = HwpCtrl.GetPosBySet();
		var curPos = {};
		curPos.List = posSet.Item('List');
		curPos.Para = posSet.Item('Para');
		curPos.Pos = posSet.Item('Pos');
		alert(curPos.List + ', ' + curPos.Para + ', ' + curPos.Pos);
	};

	var OnItem = function (id) {
		SelectItem(id, 0, 'ItemTest', 'Item');
	};

	//3.2.7 ItemExist
	var OnItemExist = function(id){
		SelectItem(id, 0, 'ParameterSetMethodTest3', 'ItemExist');
	};

	//3.2.8 Merge
	var OnMerge= function(id){
		SelectItem(id, 0, 'ParameterSetMethodTest4', 'Merge');
	};

	//3.2.9 OnRemoveAll
	var OnRemoveAll= function(id){
		SelectItem(id, 0, 'ParameterSetMethodTest4', 'RemoveAll');
	};

	//3.2.10 RemoveItem
	var OnRemoveItem = function(id){
		SelectItem(id, 0, 'ParameterSetMethodTest', 'RemoveItem');
	};

	//3.2.11 SetItem
	var OnParameterSet_SetItem = function(id){
		SelectItem(id, 0, 'ParameterSetMethodTest3', 'SetItem');
	};

	//4.ParameterArray
	//4.1 Properties
	//4.1.1 Count
	var OnParameterArrayCount = function(id){
		SelectItem(id, 0, 'ParameterSet_ArrayPropertiesTest', 'Count');
	};
	//4.1.2 IsSet
	var OnParameterArrayIsSet = function(id){
		SelectItem(id, 0, 'ParameterSet_ArrayPropertiesTest', 'IsSet');
	};

	//4.2 Method
	//4.2.1 Clone
	var OnParameterArrayClone = function(id){
		SelectItem(id, 0, 'ParameterArrayMethodTest', 'Clone');
	};
	//4.2.2 Copy
	var OnParameterArrayCopy = function(id){
		SelectItem(id, 0, 'ParameterArrayMethodTest', 'Copy');
	};
	//4.2.3 Item
	var OnParameterArrayItem= function(id){
		SelectItem(id, 0, 'ParameterArrayMethodTest', 'Item');
	};

	//4.2.4 SetItem
	var OnParameterArraySetItem = function(id){
		SelectItem(id, 0, 'ParameterArrayMethodTest', 'SetItem');
	};

	//5. HwpMenu
	//5.1 Method
	//5.1.1 AppendMenu

	//6. HwpCtrl
	//6.1 Properties
	//6.1.1 AutoShowHideToolBar
	var OnAutoShowHideToolBar = function(id){
		SelectItem(id, 2, '', 'AutoShowHideToolBar')
	};

	//6.1.2 CellShape
	var CellShapeTest = function(){
		var tp = HwpCtrl.CreateSet('Table');
		var cp = tp.CreateItemSet('Cell', 'Cell');
		tp.SetItem('CellSpacing', 200);
		cp.SetItem('Header', 1);
		HwpCtrl.CellShape = tp;
	};

	var OnCellShape = function(id){
		SelectItem(id, 0, 'CellShapeTest', 'CellShape');
	};

	//6.1.3 CharShape
	var CharShapeTest = function(){
		var cs = HwpCtrl.CharShape;
		if(cs.ItemExist('Height')){
			cs.SetItem('Height', 2000);
			HwpCtrl.CharShape = cs;
		}
	};

	var OnCharShape = function(id){
		SelectItem(id, 0, 'CharShapeTest', 'CharShape');
	};

	//6.1.4 CurFieldState
	var CurFieldStateTest = function () {
		var fieldState = HwpCtrl.CurFieldState;
		var msg = '';
		switch (fieldState){
			case 0:
				msg = '필드 없음';
				break;
			case 1:
				msg = '셀';
				break;
			case 2:
				msg = '누름틀';
				break;
			case 4:
				msg = '글상자';
				break;
		}
		alert('현재선택된 필드 : ' + msg);
	};

	var OnCurFieldState = function(id){
		SelectItem(id, 0, 'CurFieldStateTest', 'CurFieldState');
	};


	//6.1.5 EditMode
	var EditModeTest = function(){
		var editmode = HwpCtrl.EditMode;
		var msg = '';
		switch (editmode){
			case 0:
				msg = '읽기 전용 모드입니다.'
				break;
			case 1:
				msg = '일반 편집 모드입니다.'
				break;
			case 2:
				msg = '양식 모드입니다.'
				break;
			case 16:
				msg = '배포용 문서 모드입니다.'
				break;
			default:
				msg = '잘못된 EditMode 입니다.'
		}
		alert(msg);
	};

	var OnEditMode = function(id){
		SelectItem(id, 0, 'EditModeTest', 'EditMode');
	};

	//6.1.6 EngineProperties
	var EnginePropertiesTest = function () {
		var set = HwpCtrl.CreateSet("EngineProperties");
		set.SetItem("EnableAutoSpell", 1);
		HwpCtrl.EngineProperties = set;
	};

	var OnEngineProperties = function(id){
		SelectItem(id, 0, 'EnginePropertiesTest', 'EngineProperties');
	};

	//6.1.7 HeadCtrl
	var OnHeadCtrl = function(id){
		SelectItem(id, 0, 'DeleteAllTable', 'HeadCtrl');
	};

	//6.1.8 IsEmpty
	var IsEmptyTest = function(){
		var IsEmpty = HwpCtrl.IsEmpty;
		var msg = '';
		if(IsEmpty == true){
			msg = '빈 문서입니다.';
		}else{
			msg = '내용이 있는 문서입니다.';
		}
		alert(msg);

	}

	var OnIsEmpty = function (id) {
		SelectItem(id, 0, 'IsEmptyTest', 'IsEmpty')
	};

	//6.1.9 IsModified
	var IsEmptyIsModifiedTest = function(){
		var IsModified = HwpCtrl.IsModified;
		var msg = '';
		if(IsModified== true){
			msg = '변경되지 않은 깨끗한 상태입니다.';
		}else if(IsModified == false){
			msg = '변경된 상태입니다.';
		}else{
			msg = '변경되었으나 자동 저장된 상태';
		}
		alert(msg);

	}	
	
	var OnIsModified = function (id) {
		SelectItem(id, 0, 'IsEmptyIsModifiedTest', 'IsModified')
	};

	//6.1.10 IsPreviewMode
	var IsPreviewModeTest = function(){
		var IsPreviewMode = HwpCtrl.IsPreviewMode;
		var msg = '';
		if(IsPreviewMode == true){
			msg = '인쇄 미리보기 상태입니다.';
		}else{
			msg = '내용이 있는 문서입니다.';
		}
		alert(msg);

	}

	var OnIsPreviewMode = function (id) {
		SelectItem(id, 2, '', 'IsPreviewMode')
	};

	//6.1.11 LastCtrl
	var OnLastCtrl = function (id) {
		SelectItem(id, 0, 'ChangeAllCellSpacingByReverseTracing', 'LastCtrl');
	};

	//6.1.12 PageCount
	var PageCountTest = function () {
		alert("문서의 페이지 수는 " + HwpCtrl.PageCount + "장입니다.");
	};
	var OnPageCount =function (id) {
		SelectItem(id, 0, 'PageCountTest', 'PageCount');
	};
	//6.1.13 ParaShape
	var ParaShapeTest = function () {
		var paraShape = HwpCtrl.ParaShape;
		paraShape.SetItem('LeftMargin', 2000);
		HwpCtrl.ParaShape = paraShape;
	};

	var OnParaShape= function(id){
		SelectItem(id, 0, 'ParaShapeTest', 'ParaShape');
	};

	//6.1.14 ParentCtrl
	var ParentCtrl = function () {
		var ctrlcode = HwpCtrl.ParentCtrl;
		if(ctrlcode.CtrlID == 'tbl'){
			var tbset = HwpCtrl.CreateSet('Table');
			tbset.SetItem('CellSpacing', 100);
			ctrlcode.Properties = tbset;
		}
	};

	var OnParentCtrl = function(id) {
		//SelectItem(id, 2, '', 'ParentCtrl');
		SelectItem(id, 0, 'ParentCtrl', 'ParentCtrl');
		// 해당기능이 동작않해 임시로 api 문서 참조 처리
	};

	//6.1.15 SelectionMode
	var SelectionModeTest = function () {
		var HWPSEL_NONE = 0;
		var HWPSEL_NORMAL = 1;
		var HWPSEL_COLUMN = 2;
		var HWPSEL_TABLE = 3;
		var HWPSEL_CTRL = 4;
		var HWPSEL_MODE_MASK = 15;
		var HWPSEL_STRICT_MODE = 16;

		mode = HwpCtrl.SelectionMode & HWPSEL_MODE_MASK;

		if(mode == 0){//블록지정이 되지 않은 경우
			alert('No Selection ...');
		} else if(mode == HWPSEL_NORMAL) { //일반 블록이거나 F3키에 의한 블록인 경우 (TEXT)
			alert('Normal Selection ...');
		} else if(mode == HWPSEL_COLUMN) { //F4키에 의한 블록인 경우 (TEXT)
			alert('Column Selection ...');
		}else if(mode == HWPSEL_TABLE) { //테이블 셀 블록 상태
			alert('Table Selection ...');
		}else if(mode == HWPSEL_CTRL) { //그리기 개체나 표, 그림 등 ShapeObject에 해당하는 컨트롤이 선택된 상태
			alert('Ctrl Selection ...');
		}
	};

	var OnSelectionMode  = function (id) {
		SelectItem(id, 0, 'SelectionModeTest', 'SelectionMode');
	};

	//6.1.16 Version
	var OnVersion = function (id) {
		SelectItem(id, 2, '', 'Version');
	};

	//6.1.17 ViewProperties
	var ViewPropertiesTest = function () {
		var vp = HwpCtrl.CreateSet('ViewProperties');
		vp.SetItem('ZoomType', 0); //HwpZoomCustom
		vp.SetItem('ZoomRatio', 100);
		HwpCtrl.ViewProperties = vp;
	};

	var OnViewProperties = function (id) {
		SelectItem(id, 0, 'ViewPropertiesTest', 'ViewProperties');
	};

	//6.1.18 ScrollPosInfo
	var ScrollPosInfoTest = function () {
		var ScrollPosSet;
		ScrollPosSet = HwpCtrl.ScrollPosInfo;
		ScrollPosSet.SetItem('HorzPos', 100);
		ScrollPosSet.SetItem('VertPos', 100);
		HwpCtrl.ScrollPosInfo = ScrollPosSet;
	};

	var OnScrollPosInfo = function (id) {
		SelectItem(id, 0, 'ScrollPosInfoTest', 'ScrollPosInfo');
	};

	//6.1.19 HyperlinkMode
	var OnHyperlinkMode = function (id) {
		SelectItem(id, 1);
	};

	//6.1.20 ReadOnlyMode
	var ReadOnlyModeTest = function(){
		var ReadOnlyMode = HwpCtrl.ReadOnlyMode;
		var msg = '';
		if(ReadOnlyMode == true){
			msg = '읽기 전용 문서입니다.';
		}else{
			msg = '편집 가능 문서입니다.';
		}
		alert(msg);

	}
	
	var OnReadOnlyMode = function (id) {
		SelectItem(id, 0, 'ReadOnlyModeTest', 'ReadOnlyMode');
	};

	//6.1.22 CurSelectedCtrl
	var OnCurSelectedCtrl = function (id) {
		SelectItem(id, 0, 'DeleteTable', 'CurSelectedCtrl');
	//SelectItem(id, 2, '', 'CurSelectedCtrl');
	// 해당기능이 동작않해 임시로 api 문서 참조 처리
	};

	//6.1.23 IsPrivateInfoProtected
	var OnIsPrivateInfoProtected = function (id) {
		SelectItem(id, 1);
	};

	//6.2 Method
	//6.2.1 Clear
	var ClearTest = function () {
		HwpCtrl.Clear(1);
	};

	var OnClear = function (id) {
		SelectItem(id, 0, 'ClearTest', 'Clear');
	};

	//6.2.2 CreateAction
	var CreateActionTest = function () {
		var act;
		act = HwpCtrl.CreateAction('CharShapeBold');// 액션 생성
		act.Run(); //액션 실행
	};

	var OnCreateAction = function (id) {
		SelectItem(id, 0, 'CreateActionTest', 'CreateAction');
	};

	//6.2.3 CreateField
	var CreateFieldTest = function () {
		HwpCtrl.CreateField('본문을 입력하세요', '', '본문');
	};

	var OnCreateField = function (id) {
		SelectItem(id, 0, 'CreateFieldTest', 'CreateField');
	};

	//6.2.4 CreatePageImage
	var CreatePageImageTest = function () {
		HwpCtrl.CreatePageImage('pageimage.png', 0, 'png');
	};

	var OnCreatePageImage = function (id) {
		SelectItem(id, 0, 'CreatePageImageTest', 'CreatePageImage');
	};

	//6.2.5 CreateSet
	var OnCreateSet = function (id) {
		SelectItem(id, 0, 'ChangeAllCellSpacing', 'CreateSet');
	};

	//6.2.6 DeleteCtrl
	var OnDeleteCtrl = function (id) {
		//SelectItem(id, 0, 'DeleteTable', 'DeleteCtrl');
		SelectItem(id, 2, '', 'DeleteCtrl');
		// 해당기능이 동작않해 임시로 api 문서 참조 처리
	};

	//6.2.7 FieldExist
	var FieldExistTest = function () {
		if(HwpCtrl.FieldExist('이름1')){
			HwpCtrl.MoveToField('이름1', true, true, true);
			HwpCtrl.Run('ParagraphShapeAlignCenter');
		}
	};

	var OnFieldExist = function (id) {
		SelectItem(id, 0, 'FieldExistTest', 'FieldExist');
	};

	//6.2.8 GetCurFieldName
	var OnGetCurFieldName = function (id) {
		SelectItem(id, 0, 'ChangeCurFieldName', 'GetCurFieldName');
	};

	//6.2.9 GetFieldList
	var GetFieldListTest = function () {
		alert(HwpCtrl.GetFieldList(0));
	};

	var OnGetFieldList = function (id) {
		SelectItem(id, 0, 'GetFieldListTest', 'GetFieldList');
	};

	//6.2.10 GetFieldText
	var GetFieldTextTest = function () {
		//첫 번째 '본문'필드의 텍스트를 얻어낸다.
		alert(HwpCtrl.GetFieldText('본문{{0}}'));
	};

	var OnGetFieldText = function (id) {
		SelectItem(id, 0, 'GetFieldTextTest', 'GetFieldText');
	};

	//6.2.11 GetFileInfo
	var OnGetFileInfo = function (id) {
		SelectItem(id, 1);
	};

	//6.2.12 GetFilterList
	var OnGetFilterList = function (id) {
		SelectItem(id, 1);
	};

	//6.2.13 GetFormObjectAttr
	var GetFormObjectAttrTest = function () {
		var height = HwpCtrl.GetFormObjectAttr('PushButton1', 'Height');
		var width = HwpCtrl.GetFormObjectAttr('PushButton1', 'Width');
		if(height != null && width != null) {
			alert('높이 : '+ height + '폭 : ' + width);
		} else {
			alert('FormObject를 넣어주세요.');
		}
	};

	var OnGetFormObjectAttr = function (id) {
		SelectItem(id, 0, 'GetFormObjectAttrTest', 'GetFormObjectAttr');
	};

	//6.2.14 GetMessageSet
	var OnGetMessageSet = function (id) {
		SelectItem(id, 1);
	};

	//6.2.15 GetMousePos
	var GetMousePosTest = function () {
		var MousePosSet = HwpCtrl.GetMousePos(0, 0); // 쪽기준
		var xrelto = MousePosSet.Item('XRelTo');
		var yrelto = MousePosSet.Item('YRelTo');
		var page = MousePosSet.Item('Page');
		var pagex = MousePosSet.Item('X');
		var pagey = MousePosSet.Item('Y');

		alert('xrelto : ' + xrelto + '\n'
			+ 'yrelto : ' + yrelto + '\n'
			+ 'page : ' + page + '\n'
			+ 'pagex : ' + pagex + '\n'
			+ 'pagey : ' + pagey + '\n'
		);
	};

	var OnGetMousePos = function (id) {
		SelectItem(id, 0, 'GetMousePosTest', 'GetMousePos');
	};

	//6.2.16 GetPos
	var pos;
	var GetPosTest = function () {
		pos = HwpCtrl.GetPos();
		alert('GetPos : ' + pos.list + ' ' + pos.para + ' ' + pos.pos);
	};

	var OnGetPos = function(id){
		SelectItem(id, 0, 'GetPosTest', 'GetPos');
	};

	//6.2.17 GetPosBySet
	var posSet = null;
	var GetPosBySetTest = function () {
		posSet = HwpCtrl.GetPosBySet();
		alert(posSet.Item('List') + ' ' + posSet.Item('Para') +' '+ posSet.Item('Pos'));
	};

	function OnGetPosBySet(id) {
		SelectItem(id, 0, 'GetPosBySetTest', 'GetPosBySet');
	};

	//6.2.18 GetSelectedPos
	var selectedPos = null;
	var GetSelectedPosTest = function (id) {
		selectedPos = HwpCtrl.GetSelectedPos();
		if(selectedPos != null){
			alert('GetSelectedPos/start pos: ' + selectedPos.slist + ' ' + selectedPos.spara + ' ' + selectedPos.spos + '\n'
				+ 'GetSelectedPos/end pos: '+selectedPos.elist + ' ' + selectedPos.epara + ' ' + selectedPos.epos);
		}
	};

	var OnGetSelectedPos = function (id) {
		SelectItem(id, 0, 'GetSelectedPosTest', 'GetSelectedPos');
	};

	//6.2.19 GetSelectedPosBySet
	var GetSelectedPosBySetTest = function () {
		var sset = HwpCtrl.CreateSet('ListParaPos');
		var eset = HwpCtrl.CreateSet('ListParaPos');
		HwpCtrl.GetSelectedPosBySet(sset, eset);
		alert('GetSelectedPosBySet/start pos: ' + sset.Item('List') + ' ' + sset.Item('Para') + ' ' + sset.Item('Pos') + '\n'
			+ 'GetSelectedPosBySet/end pos: '+ eset.Item('List') + ' ' + eset.Item('Para') + ' ' + eset.Item('Pos'));
	};

	var OnGetSelectedPosBySet = function (id) {
		SelectItem(id, 0, 'GetSelectedPosBySetTest', 'GetSelectedPosBySet');
	};

	//6.2.20 GetTableCellAddr
	var GetTableCellAddrTest = function () {
		var col = HwpCtrl.GetTableCellAddr(0);
		var row = HwpCtrl.GetTableCellAddr(1);
		alert('col : ' + col + ', row : ' + row);
	};

	var OnGetTableCellAddr = function (id) {
		SelectItem(id, 0, 'GetTableCellAddrTest', 'GetTableCellAddr');
	};

	//6.2.21 GetText
	var OnGetText = function (id) {
		SelectItem(id, 0, 'GetTextLine', 'GetText');
	};

	//6.2.22 GetTextBySet
	var GetTextBySetTest = function () {
		HwpCtrl.InitScan(0, 2);
		var textSet = HwpCtrl.CreateSet('GetText');
		HwpCtrl.GetTextBySet(textSet);
		alert(textSet.Item("Text"));
		HwpCtrl.ReleaseScan();
	};

	var OnGetTextBySet = function (id) {
		SelectItem(id, 0, 'GetTextBySetTest', 'GetTextBySet');
	};

	//6.2.23 GetTextFile
	var GetTextFileTest = function () {
		HwpCtrl.GetTextFile("HWP", "", function(data) {
			alert(data);
		});
	};

	var OnGetTextFile = function (id) {
		//SelectItem(id, 0, 'GetTextFileTest', 'GetTextFile');
		SelectItem(id, 2, '', 'GetTextFile');
	};

	//6.2.24 GetViewStatus
	var GetViewStatusTest = function () {
		var viewLeft = 0; //한글 전체 페이지에 대하여 현재 보여지는 뷰의Left 좌표
		var viewTop = 0; //한글 전체 페이지에 대하여 현재 보여지는 뷰의Top 좌표
		var viewSet = HwpCtrl.GetViewStatus(0);

		viewLeft = viewSet.Item('ViewPosX');
		viewTop = viewSet.Item('ViewPosY');
		alert(' Left = ' + viewLeft + ', Top = ' +  viewTop);
	};

	var OnGetViewStatus = function (id) {
		SelectItem(id, 0, 'GetViewStatusTest', 'GetViewStatus');
	};

	//6.2.25 InitScan
	var OnInitScan = function (id) {
		SelectItem(id, 0, 'GetTextLine', 'InitScan');
	};

	//6.2.26 Insert
	var OnInsert = function (id) {
		/*
		if(id)
			ChangeCurItem(id);

		runName = "";
		apiNameElement.innerText = "Insert";
		apiExampleElement.innerHTML =
			"<span class='coreline'>HwpCtrl.Insert($('input[name=openFile]')[0].files[0], '', '', function (res) {" +
			"<br> console.log(res);"+
			"<br>}, {'UserData' : 'testData'}); </span>" +
			"<br><br> 상단에 파일 끼워넣기 버튼으로 사용할 수 있습니다.";
*/

			SelectItem(id, 2, '', 'Insert');
	};

	var insertDiag = document.getElementById('open');
	insertDiag.onchange = function () {
		HwpCtrl.Insert($('input[name=openFile]')[0].files[0], '', '', function (res) {
			console.log(res);
		}, {'UserData' : 'testData'});
	};
	
	/*
	var insertButton = document.getElementById('insert_button');
	insertButton.onclick = function() {
		insertDiag.click();
	};
*/
	//6.2.27 InsertBackgroundPicture
	var BasePath = '/webhwpctrl/Demo/';

	function InsertBgImg() {
		HwpCtrl.InsertBackgroundPicture('SelectedCell', 'https://www.hancom.com/legacy/webhwp/images/img_logo.png', 1, 5, 0, 0, 0, 0);
	}

	function DeleteBgImg() {
		HwpCtrl.InsertBackgroundPicture('SelectedCellDelete', 0, 0, 0, 0, 0, 0, 0);
	}

	function TestBgImg() {
		var act;
		var set;
		var subset;
		if (HwpCtrl.ParentCtrl != null && HwpCtrl.ParentCtrl.CtrlID == 'tbl'){
			HwpCtrl.Run('TableCellBlock'); // 반드시 셀을 선택해야 한다.
			act = HwpCtrl.CreateAction('CellBorderFill');
			set = act.CreateSet();
			act.GetDefault(set);
			if (set.ItemExist('FillAttr'))   {
				subset = set.Item('FillAttr');
				if(subset.ItemExist('Type'))  {
					if((subset.Item('Type') & 2) == 2)  {
						return {IsCell: true, hasImage : true };
					} else {
						return {IsCell: true, hasImage : false };
					}
				}
			} else {
				return {IsCell: true, hasImage : false };
			}
			HwpCtrl.Run('Cancel');
		} else  {
			alert('현재 위치가 표의 셀이 아님.');
			return {IsCell: false, hasImage : false };
		}
	}

	var InsertBackgroundPictureTest = function () {
		var result = TestBgImg();
		if(result.IsCell == true){
			if(result.hasImage == false){
				InsertBgImg();
			} else {
				DeleteBgImg();
			}
		}
	};

	var OnInsertBackgroundPicture = function (id) {
		if(id)
			ChangeCurItem(id);

		runName = "InsertBackgroundPictureTest";
		apiNameElement.innerText = "Insert";
		apiExampleElement.innerHTML =
			"function InsertBgImg() {" +
			"<br> <span class='coreline'>&nbsp HwpCtrl.InsertBackgroundPicture('SelectedCell',  '/images/img_logo.png', 1, 5, 0, 0, 0, 0); </span>" +
			"<br> }" +
			"<br><br> function DeleteBgImg() {" +
			"<br> <span class='coreline'>&nbsp HwpCtrl.InsertBackgroundPicture('SelectedCellDelete', 0, 0, 0, 0, 0, 0, 0);</span>" +
			"<br> }" +
			"<br><br> function TestBgImg() {" +
			"<br> &nbsp var act;" +
			"<br> &nbsp var set;" +
			"<br> &nbsp var subset;" +
			"<br> &nbsp if (HwpCtrl.ParentCtrl != null && HwpCtrl.ParentCtrl.CtrlID == 'tbl'){" +
			"<br> &nbsp&nbsp HwpCtrl.Run('TableCellBlock'); // 반드시 셀을 선택해야 한다." +
			"<br> &nbsp&nbsp act = HwpCtrl.CreateAction('CellBorderFill');" +
			"<br> &nbsp&nbsp set = act.CreateSet();" +
			"<br> &nbsp&nbsp act.GetDefault(set);" +
			"<br> &nbsp&nbsp if (set.ItemExist('FillAttr'))   {" +
			"<br> &nbsp&nbsp&nbsp subset = set.Item('FillAttr');" +
			"<br> &nbsp&nbsp&nbsp if(subset.ItemExist('Type'))  {" +
			"<br> &nbsp&nbsp&nbsp&nbsp if((subset.Item('Type') & 2) == 2)  {" +
			"<br> &nbsp&nbsp&nbsp&nbsp&nbsp return {IsCell: true, hasImage : true };" +
			"<br> &nbsp&nbsp&nbsp&nbsp } else {" +
			"<br> &nbsp&nbsp&nbsp&nbsp&nbsp return {IsCell: true, hasImage : false };" +
			"<br> &nbsp&nbsp&nbsp&nbsp }" +
			"<br> &nbsp&nbsp&nbsp }" +
			"<br> &nbsp&nbsp } else {" +
			"<br> &nbsp&nbsp&nbsp return {IsCell: true, hasImage : false };" +
			"<br> &nbsp&nbsp }" +
			"<br> &nbsp&nbsp HwpCtrl.Run('Cancel');" +
			"<br> &nbsp  } else  {" +
			"<br> &nbsp&nbsp alert('현재 위치가 표의 셀이 아님.');" +
			"<br> &nbsp&nbsp return {IsCell: false, hasImage : false };" +
			"<br> &nbsp }" +
			"<br> }"; +
			"<br><br> var InsertBackGroundPictureTest = function () { " +
		"<br> &nbspvar result = TestBgImg();" +
		"<br> &nbsp if(result.IsCell == ture){" +
		"<br> &nbsp&nbsp if(result.hasImage = false){" +
		"<br> &nbsp&nbsp&nbsp InsertBgImg();" +
		"<br> &nbsp&nbsp else {" +
		"<br> &nbsp&nbsp&nbsp DeleteBgImg();" +
		"<br> &nbsp&nbsp }" +
		"<br> &nbsp }" +
		"<br> };";
	};

	//6.2.28 InsertCtrl
	var OnInsertCtrl = function (id) {
		SelectItem(id, 0, 'TableCreate', 'InsertCtrl');
	};

	//6.2.29 InsertPicture
	var InsertPictureTest = function () {
		HwpCtrl.InsertPicture('https://www.hancom.com/legacy/webhwp/images/img_logo.png', true, 1, false, false, 0, 17, 17, function(ctrl){
			if(ctrl){
				console.log('성공');
			} else {
				console.log('실패');
			}
		});
	};

	var OnInsertPicture = function (id) {
		SelectItem(id, 0, 'InsertPictureTest', 'InsertPicture');
	};

	//6.2.30 IsCommandLock
	var OnIsCommandLock = function(id){
		SelectItem(id, 0, 'LockCommandTest', 'IsCommandLock');
	};

	//6.2.31 KeyIndicator
	var KeyIndicatorTest = function () {
		var result = HwpCtrl.KeyIndicator();
		alert(
			"result : "+ result.result + "\n" +
			"총 구역 : " + result.seccnt + "\n" +
			"현재 구역 : " + result.secno + "\n" +
			"쪽 : " + result.prnpageno + "\n" +
			"단 : " + result.colno + "\n" +
			"줄 : " + result.line + "\n" +
			"칸 : " + result.pos + "\n" +
			"over : " + result.over + "\n"
		);
	};

	var OnKeyIndicator = function (id) {
		SelectItem(id, 0, 'KeyIndicatorTest', 'KeyIndicator');
	};

	//6.2.32 LockCommand
	var OnLockCommand = function (id) {
		SelectItem(id, 0, 'LockCommandTest', 'LockCommand');
	};

	//6.2.33 ModifyFieldProperties
	var ModifyFieldProperties = function () {
		var ret;
		ret = HwpCtrl.ModifyFieldProperties('test', 0, 0);
		if (ret < 0 ) {
			var strErrMsg = 'test 필드의 정보를 알아오는 데 실패';
			if(ret & 0x40000000)
				strErrMsg += '\n지정한 필드를 찾을 수 없습니다.';
			alert(strErrMsg);
			return;
		}
		if (ret & 0x00000001){
			alert('현재 양식모드에서 편집 가능');
			ret = HwpCtrl.ModifyFieldProperties('test', 1, 0);
		} else{
			alert('현재 양식모드에서 편집 불가능');
			ret = HwpCtrl.ModifyFieldProperties('test', 0, 1);
		}
		if (ret < 0 ) {
			alert('필드 속성 변경 실패.');
		}
		if (ret & 0x00000001)
			alert('양식모드에서 편집 가능하도록 변경되었습니다.');
		else
			alert('양식모드에서 편집 불가능하도록 변경되었습니다.');
	};


	var OnModifyFieldProperties = function (id) {
		SelectItem(id, 0, 'ModifyFieldProperties', 'ModifyFieldProperties');
	};

	//6.2.34 MovePos
	var MovePosTest = function () {
		HwpCtrl.MovePos(2, 0, 0);
	};

	var OnMovePos = function (id) {
		SelectItem(id, 0, 'MovePosTest', 'MovePos');
	};

	//6.2.35 MoveToField
	var MoveToFieldTest = function () {
		HwpCtrl.MoveToField('본문', true, true, false);
	};
	var OnMoveToField = function (id) {
		SelectItem(id, 0, 'MoveToFieldTest', 'MoveToField');
	};

	//6.2.36 MoveToFieldEx
	var MoveToFieldExTest = function () {
		HwpCtrl.MoveToFieldEx('본문', true, true, false);
	};

	var OnMoveToFieldEx = function (id) {
		SelectItem(id, 0, 'MoveToFieldExTest', 'MoveToFieldEx');
	};

	//6.2.37 Open
	var OnOpen = function (id) {
		if(id)
			ChangeCurItem(id);

		runName = "";
		apiNameElement.innerText = "Open";
		apiExampleElement.innerHTML =
			"<span class='coreline'>HwpCtrl.Open($('input[name=openFile]')[0].files[0], '', '', function (res) {" +
			"<br> console.log(res);"+
			"<br>}, {'UserData' : 'testData'}); </span>" +
			"<br><br> 상단에 파일열기 버튼으로 사용할 수 있습니다.";
	};

	var openDiag = document.getElementById('open');
	openDiag.onchange = function () {
		HwpCtrl.Open($('input[name=openFile]')[0].files[0], '', '', function (res) {
			console.log(res);
		}, {'UserData' : 'testData'});
	};
	
	var openButton = document.getElementById('open_button');
	openButton.onclick = function() {
		//openDiag.click();

		HwpCtrl.Open('Sample.hwp', '', '', function (res) {
			console.log(res);
		}, {'UserData' : 'testData'});
	};

	//6.2.38 PreviewCommand
	var OnPreviewCommand = function (id) {
		SelectItem(id, 1);
	};

	//6.2.39 PutFieldText
	var PutFieldTextTest = function () {
		HwpCtrl.CreateField('이름을 입력하세요', '', '이름1');
		HwpCtrl.PutFieldText('이름1', '홍길동');
	};

	var OnPutFieldText = function (id) {
		SelectItem(id, 0, 'PutFieldTextTest', 'PutFieldText');
	};

	//6.2.40 ReleaseScan
	var OnReleaseScan = function (id) {
		SelectItem(id, 0, 'GetTextLine', 'ReleaseScan');
	};

	//6.2.41 RenameField
	var RenameFieldTest = function(){
		HwpCtrl.RenameField('이름1' , '이름2');
	};

	var OnRenameField = function (id) {
		SelectItem(id, 0, 'RenameFieldTest', 'RenameField');
	};

	//6.2.42 ReplaceAction
	var ReplaceActionTest = function(){
		HwpCtrl.ReplaceAction('CharShapeBold', 'CharShapeItalic');
	};

	var OnReplaceAction = function (id) {
		SelectItem(id, 0, 'ReplaceActionTest', 'ReplaceAction');
	};

	//6.2.43 Run
	var RunTest = function(){
		HwpCtrl.Run("CharShapeBold");
	};

	var OnRun = function (id) {
		SelectItem(id, 0, 'RunTest', 'Run');
	};

	//6.2.44 Save
	var OnSave = function (id) {
		SelectItem(id, 1);
	};

	//6.2.45 SaveAs
	var SaveAsTest = function () {
		HwpCtrl.SaveAs("test.hwp", "HWP", "download:true");
	};

	var OnSaveAs = function (id) {
	//	SelectItem(id, 0, 'SaveAsTest', 'SaveAs');
		SelectItem(id, 2, '', 'SaveAs');
	};

	//6.2.46 SelectText
	var SelectTextTest = function () {
		if(selectedPos != null){
			HwpCtrl.SelectText(selectedPos.spara, selectedPos.spos, selectedPos.epara, selectedPos.epos);
		} else {
			alert('GetSelectedPos를 먼저 실행하세요.');
		}
	};

	var OnSelectText = function (id) {
		SelectItem(id, 0, 'SelectTextTest', 'SelectText');
	};

	//6.2.47 SetClientName
	var OnSetClientName = function(id){
		SelectItem(id, 1);
	};

	//6.2.48 SetCurFieldName
	var OnSetCurFieldName = function(id){
		SelectItem(id, 0, 'ChangeCurFieldName', 'SetCurFieldName');
	};

	//6.2.49 SetFieldViewOption
	var SetFieldViewOptionTest = function(){
		HwpCtrl.SetFieldViewOption(2);
	};

	var OnSetFieldViewOption = function (id) {
		SelectItem(id, 0, 'SetFieldViewOptionTest', 'SetFieldViewOption');
	};

	//6.2.50 SetFormObjectAttr
	var SetFormObjectAttrTest = function(){
		HwpCtrl.SetFormObjectAttr('PushButton1', 'Name', 'PushButton');
	};

	var OnSetFormObjectAttr = function (id) {
		SelectItem(id, 0, 'SetFormObjectAttrTest', 'SetFormObjectAttr');
	};

	//6.2.51 SetPos
	function SetPosTest(){
		if ( posSet != null)  {
			if (!HwpCtrl.SetPos(pos.list, pos.para, pos.pos)) {
				alert ('GetPos err');
			}
		} else {
			alert('GetPos를 먼저 실행하세요.');
		}
	};

	var OnSetPos = function (id) {
		SelectItem(id, 0, 'SetPosTest', 'SetPos');
	};

	//6.2.52 SetPosBySet
	var SetPosBySetTest = function(){
		if ( posSet != null)  {
			if (!HwpCtrl.SetPosBySet(posSet)) {
				alert ('GetPos err');
			}
		} else {
			alert('GetPosBySet를 먼저 실행하세요.');
		}
	};

	var OnSetPosBySet = function (id) {
		SelectItem(id, 0, 'SetPosBySetTest', 'SetPosBySet');
	};


	//6.2.53 SetTextFile
	var SetTextFileTest = function () {
		if(text)
			HwpCtrl.SetTextFile(text, "HWP", "");
		else
			alert('GetTextFile을 먼저 실행해주세요.')
	};

	var OnSetTextFile = function (id) {
		//SelectItem(id, 0, 'SetTextFileTest', 'SetTextFile');
		SelectItem(id, 2, '', 'SetTextFile');
	};

	var isShowToolBar = false;
	var isShowStatusBar = false;
	var isShowHorizonScroll = false;
	var isShowVerticalScroll = false;
	var isShowCaret = false;
	var isShowRibbon = false;

	//6.2.54 SetToolBar
	var SetToolBarTest = function () {
		HwpCtrl.SetToolBar(1, "TOOLBAR_MENU");
		HwpCtrl.SetToolBar(0, "TOOLBAR_STANDARD");
		HwpCtrl.ShowToolBar(true);
		HwpCtrl.ShowRibbon(false);
		isShowToolBar = true;
		isShowRibbon = false;
	};

	var OnSetToolBar = function (id) {
		SelectItem(id, 0, 'SetToolBarTest', 'SetToolBar');
	}

	//6.2.55 ShowStatusBar
	var ShowStatusBarTest = function () {
		HwpCtrl.ShowStatusBar(isShowStatusBar);
		isShowStatusBar = !isShowStatusBar;
	};

	var OnShowStatusBar = function (id) {
		SelectItem(id, 0, 'ShowStatusBarTest', 'ShowStatusBar');
	}

	//6.2.56 ShowToolBar
	var ShowToolBarTest = function () {
		HwpCtrl.ShowToolBar(isShowToolBar);
		isShowToolBar = !isShowToolBar;
	};

	var OnShowToolBar = function (id) {
		SelectItem(id, 0, 'ShowToolBarTest', 'ShowToolBar');
	};

	//6.2.57 ShowRibbon
	var ShowRibbonTest = function () {
		HwpCtrl.ShowRibbon(isShowRibbon);
		isShowRibbon = !isShowRibbon;
	};

	var OnShowRibbon = function (id) {
		SelectItem(id, 0, 'ShowRibbonTest', 'ShowRibbon');
	};

	//6.2.58 OpenDocument
	var OnOpenDocument = function (id) {
		SelectItem(id, 2, '', 'OpenDocument');
	};

	//6.2.59 SaveDocument
	var SaveDocumentTest = function () {
		HwpCtrl.SaveDocument("test.hwp", "HWP");
	};

	var OnSaveDocument = function (id) {
		//SelectItem(id, 0, 'SaveDocumentTest', 'SaveDocument');
		SelectItem(id, 2, '', 'SaveDocument');
	};

	//6.2.60 InsertDocument
	var OnInsertDocument = function (id) {
		SelectItem(id, 2, '', 'InsertDocument');
	};

	//6.2.61 InsertMenu
	var OnInsertMenu = function (id) {
		SelectItem(id, 1);
	};

	//6.2.62 RemoveMenu
	var OnRemoveMenu = function (id) {
		SelectItem(id, 1);
	};

	//6.2.63 ExportStyle
	var OnExportStyle = function (id) {
		SelectItem(id, 1);
	};

	//6.2.64 ImportStyle
	var OnImportStyle = function (id) {
		SelectItem(id, 1);
	};

	//6.2.65 IsSpellCheckCompleted
	var IsSpellCheckCompletedTest = function () {

      // 맞춤법 검사 완료 여부를 체크한다.
	  if (!HwpCtrl.IsSpellCheckCompleted()) {
            // 문서의 시작부분으로 이동한다.
			HwpCtrl.MovePos(2);

            // 맞춤법 검사 액션을 실행한다.
            var dact = HwpCtrl.CreateAction("SpellingCheck");
            var dset = dact.CreateSet();
            dact.GetDefault(dset);

            // 결과를 통보받을지 여부를 설정 (결과는 HwpCtrl_NotifyMessage 로 통보 됨)
            dset.SetItem("NotifyResult", 1);
            // 맞춤법 대화상자가 표시되면서 맞춤법 검사가 시작되는 옵션
            dset.SetItem("CheckStart", 1);

            dact.PopupDialog(dset);

            HwpCtrl.AddEventListener(3, function (msg, wparam, lparam) {
                if (msg === "SpellCheckComleted") {
                    if (wparam === 1)
                        alert("맞춤법검사가 완료되었습니다.");
                    else
                        alert("맞춤법검사가 취소되었습니다.");
                }
            });

            return;
        }


	};

	var OnIsSpellCheckCompleted = function (id) {
		SelectItem(id, 0, 'IsSpellCheckCompletedTest', 'IsSpellCheckCompleted');
	};

	//6.2.66 GetHeadingString
	var GetHeadingStringTest = function () {
		alert("문단번호/글머리표 : " + HwpCtrl.GetHeadingString());
	};

	var OnGetHeadingString = function (id) {
		SelectItem(id, 0, 'GetHeadingStringTest', 'GetHeadingString');
	};

	//6.2.67 GetContextMenu
	var OnGetContextMenu = function (id) {
		SelectItem(id, 1);
	};

	//6.2.68 GetCtrlHorizontalOffset
	var GetCtrlHorizontalOffsetTest = function () {
		var ctrl = HwpCtrl.CurSelectedCtrl;
		if(ctrl){
			var offsetByPaper = HwpCtrl.GetCtrlHorizontalOffset(ctrl, 0); //HWPSO_VERT_REL_PAPER
			var offsetByPage = HwpCtrl.GetCtrlHorizontalOffset(ctrl, 1); //HWPSO_VERT_REL_PAGE
			var offsetByPara = HwpCtrl.GetCtrlHorizontalOffset(ctrl, 2); //HWPSO_VERT_REL_PARA

			alert('PaperOffset : ' + offsetByPaper + '\n'
				+ 'PageOffset : ' + offsetByPage + '\n'
				+ 'ParaOffset : ' + offsetByPara + '\n')
		} else {
			alert('Ctrl 객체를 선택해주세요');
		}
	};

	var OnGetCtrlHorizontalOffset = function (id) {
		SelectItem(id, 0, 'GetCtrlHorizontalOffsetTest', 'GetCtrlHorizontalOffset');
	};

	//6.2.69 GetCtrlVerticalOffset
	var GetCtrlVerticalOffsetTest = function () {
		var ctrl = HwpCtrl.CurSelectedCtrl;
		if(ctrl){
			var offsetByPaper = HwpCtrl.GetCtrlVerticalOffset(ctrl, 0); //HWPSO_VERT_REL_PAPER
			var offsetByPage = HwpCtrl.GetCtrlVerticalOffset(ctrl, 1); //HWPSO_VERT_REL_PAGE
			var offsetByPara = HwpCtrl.GetCtrlVerticalOffset(ctrl, 2); //HWPSO_VERT_REL_PARA

			alert('PaperOffset : ' + offsetByPaper + '\n'
				+ 'PageOffset : ' + offsetByPage + '\n'
				+ 'ParaOffset : ' + offsetByPara + '\n')
		} else {
			alert('Ctrl 객체를 선택해주세요');
		}
	};

	var OnGetCtrlVerticalOffset = function (id) {
		SelectItem(id, 0, 'GetCtrlVerticalOffsetTest', 'GetCtrlVerticalOffset');
	};

	//6.2.70 SolarToLunar
	var SolarToLunarTest = function () {
		var lunarDate = HwpCtrl.SolarToLunar(2018, 8, 8);
		alert('양력 2018/8/8 은 음력 ' + lunarDate.year + '/' + lunarDate.month + '/' + lunarDate.day + '입니다.');
	};

	var OnSolarToLunar = function (id) {
		SelectItem(id, 0, 'SolarToLunarTest', 'SolarToLunar');
	};

	//6.2.71 SolarToLunarBySet
	var SolarToLunarBySetTest = function () {
		var lunarDateSet = HwpCtrl.SolarToLunarBySet(2018, 8, 8);
		alert('양력 2018/8/8 은 음력 ' + lunarDateSet.Item('Year') + '/' + lunarDateSet.Item('Month') + '/' + lunarDateSet.Item('Day') + '입니다.');
	};

	var OnSolarToLunarBySet = function (id) {
		SelectItem(id, 0, 'SolarToLunarBySetTest', 'SolarToLunarBySet');
	};

	//6.2.72 LunarToSolar
	var LunarToSolarTest = function () {
		var solarDate = HwpCtrl.LunarToSolar(2018, 8, 8, false);
		alert('음력 2018/8/8 은 양력 ' + solarDate.year + '/' + solarDate.month + '/' + solarDate.day + '입니다.');
	};

	var OnLunarToSolar = function (id) {
		SelectItem(id, 0, 'LunarToSolarTest', 'LunarToSolar');
	};

	//6.2.73 LunarToSolarBySet
	var LunarToSolarBySetTest = function () {
		var solarDateSet = HwpCtrl.LunarToSolarBySet(2018, 8, 8, false);
		alert('음력 2018/8/8 은 양력 ' + solarDateSet.Item('Year') + '/' + solarDateSet.Item('Month') + '/' + solarDateSet.Item('Day') + '입니다.');
	};

	var OnLunarToSolarBySet = function (id) {
		SelectItem(id, 0, 'LunarToSolarBySetTest', 'LunarToSolarBySet');
	};

	//6.2.74 ShowVerticalScroll
	var ShowVerticalScrollTest = function () {
		HwpCtrl.ShowVerticalScroll(isShowVerticalScroll);
		isShowVerticalScroll = !isShowVerticalScroll;
	};

	var OnShowVerticalScroll = function (id) {
		SelectItem(id, 0, 'ShowVerticalScrollTest', 'ShowVerticalScroll');
	};

	//6.2.75 ShowHorizontalScroll
	var ShowHorizontalScrollTest = function(){
		HwpCtrl.ShowHorizontalScroll(isShowHorizonScroll);
		isShowHorizonScroll = !isShowHorizonScroll;
	};

	var OnShowHorizontalScroll = function (id) {
		SelectItem(id, 0, 'ShowHorizontalScrollTest', 'ShowHorizontalScroll');
	};

	//6.2.76 ShowCaret
	var ShowCaretTest = function(){
		HwpCtrl.ShowCaret(isShowCaret);
		isShowCaret = !isShowCaret;
	};

	var OnShowCaret = function (id) {
		SelectItem(id, 0, 'ShowCaretTest', 'ShowCaret');
	};

	//6.2.77 ShowPageToolTip
	var OnShowPageToolTip = function (id) {
		SelectItem(id, 1);
	};

	//6.2.78 CreatePageImageEx
	var OnCreatePageImageEx = function (id) {
		SelectItem(id, 0, 'CreatePageImageExTest', 'CreatePageImageEx');
	};

	var CreatePageImageExTest = function () {
		HwpCtrl.CreatePageImageEx("pageimage.png", 0, 96, 24, "png", "download:true", function(result) {
			console.log("다운로드 완료");
		});
	};

	//6.2.79 GetMemoString
	var OnGetMemoString = function (id) {
		SelectItem(id, 1);
	};

	//6.2.80 AboutBox
	var OnAboutBox = function (id) {
		SelectItem(id, 1);
	};

	//6.2.81 ConvertPUAHangulToUnicode
	var OnConvertPUAHangulToUnicode = function (id) {
		SelectItem(id, 1);
	};

	//6.2.82 SetMessageBoxMode
	var OnSetMessageBoxMode = function (id) {
		SelectItem(id, 1);
	};

	//6.2.83 GetMessageBoxMode
	var OnGetMessageBoxMode = function (id) {
		SelectItem(id, 1);
	};

	//6.2.84 SetBarCodeImage
	var OnSetBarCodeImage = function (id) {
		SelectItem(id, 1);
	};

	//6.2.85 GetPageText
	var GetPageTextTest = function(){
		alert(HwpCtrl.GetPageText(0, 1));
	};

	var OnGetPageText = function (id) {
		SelectItem(id, 0, 'GetPageTextTest', 'GetPageText');
	};

	//6.2.86 AddEventListener
	var AddEventListenerTest = function () {
		HwpCtrl.AddEventListener(0, function(x, y){
			console.log('OnMouseLButtonDown:: x : ' + x + ', y: ' + y);
		});

		HwpCtrl.AddEventListener(1, function(x, y){
			console.log('OnMouseLButtonUp:: x : ' + x + ', y: ' + y);
		});

		HwpCtrl.AddEventListener(2, function(){
			console.log('OnScroll');
		});
	};

	var OnAddEventListener = function (id) {
		SelectItem(id, 0, 'AddEventListenerTest', 'AddEventListener');
	};

	//6.3 Event
	//6.3.1 NotifyMessage
	var OnNotifyMessage = function (id) {
		SelectItem(id, 1);
	};

	//6.3.2 OnMouseLButtonDown
	var OnMouseLButtonDownTest = function (id) {
		SelectItem(id, 0, 'AddEventListenerTest', 'OnMouseLButtonDown');
	};

	//6.3.3 OnMouseLButtonUp
	var OnMouseLButtonUpTest = function (id) {
		SelectItem(id, 0, 'AddEventListenerTest', 'OnMouseLButtonUp');
	};

	//6.3.4 OnScroll
	var OnScrollTest = function (id) {
		SelectItem(id, 0, 'AddEventListenerTest', 'OnScroll');
	};

	//////////////////////////////////////////////////////////////////////////////////////////////

	//InsertCtrl을 통한 테이블 삽입.
	var TableCreate = function(){
		var tbact = HwpCtrl.CreateAction('TableCreate');
		var tbset = tbact.CreateSet();
		tbset.SetItem('Rows', 5);
		tbset.SetItem('Cols', 5);
		var table = HwpCtrl.InsertCtrl('tbl', tbset);
	};

	//Action Execute를 통한 테이블 삽입.
	var TableCreate2 = function(){
		// 표 만들기
		var act = HwpCtrl.CreateAction('TableCreate');
		var set = act.CreateSet();
		var colset = set.CreateItemArray('ColWidth', 2);
		var rowset = set.CreateItemArray('RowHeight', 2);
		act.GetDefault(set);
		set.SetItem('Rows', 2);
		set.SetItem('Cols', 2);

		colset.SetItem(0, 14400);
		colset.SetItem(1, 7200);
		rowset.SetItem(0, 3600);
		rowset.SetItem(1, 7200);
		act.Execute(set);
	};

	//문서 내 모든테이블의 셀간격을 수정한다.
	var ChangeAllCellSpacing = function(){
		var ctrl = HwpCtrl.HeadCtrl;
		var tset = null;
		var result = false;
		while(ctrl) {
			console.log(ctrl.CtrlID);

			if (ctrl.CtrlID == 'tbl') {
				var tbset = HwpCtrl.CreateSet('Table');
				tbset.SetItem('CellSpacing', 100);
				ctrl.Properties = tbset;
				result = true;
				break;
			}
			ctrl = ctrl.Next;
		}
		if(result){
			alert('성공');
		} else {
			alert('문서내에 표 개체가 없습니다.');
		}
	};

	var ChangeAllCellSpacingByReverseTracing = function(){
		var ctrl = HwpCtrl.LastCtrl;
		var tset = null;
		while(ctrl) {
			if (ctrl.CtrlID == 'tbl') {
				var tbset = HwpCtrl.CreateSet('Table');
				tbset.SetItem('CellSpacing', 100);
				ctrl.Properties = tbset;
			} /*else {
				alert('Fail');
				return;
			}*/
			ctrl = ctrl.Prev;
		}
	};

	var DeleteAllTable = function(){
		var ctrl = HwpCtrl.HeadCtrl;

		while(ctrl != null) {
			if(ctrl.CtrlID == 'tbl'){
				HwpCtrl.DeleteCtrl(ctrl);
			}
			ctrl = ctrl.Next;
		}
	};

	var ParameterSet_ArrayPropertiesTest = function(){
		var act = HwpCtrl.CreateAction('TableCreate');
		var set = act.CreateSet();
		alert('SetID:' + set.SetID);
		if(set.IsSet){
			var colset = set.CreateItemArray('ColWidth', 2);
			var rowset = set.CreateItemArray('RowHeight', 2);
			alert('ParameterArray Count : ' + colset.Count);
			if(colset.IsSet){
				alert('ColWidth는 ParameterArray 타입이어야 합니다.');
				return;
			}

			act.GetDefault(set);
			set.SetItem('Rows', 2);
			set.SetItem('Cols', 2);
			alert('ParameterSet Count : ' +set.Count);

			colset.SetItem(0, 14400);
			colset.SetItem(1, 7200);
			rowset.SetItem(0, 3600);
			rowset.SetItem(1, 7200);

			act.Execute(set);
		}
	};

	//RemoveItem, GetIntersection
	var ParameterSetMethodTest = function(){
		var charShapeSet = HwpCtrl.CharShape;
		var cloneSet = charShapeSet.Clone();

		cloneSet.RemoveItem('Height'); //cloneSet에서 글자크기 속성 제거
		charShapeSet.GetIntersection(cloneSet);  // charShapeSet에서 charShapeSet 과 cloneSet의 공통적으로 존재하는 아이템만 남긴다.

		if(charShapeSet.ItemExist('Height') == false){
			alert('글자크기 속성이 삭제되었습니다.')
		}
	};

	//Clone, IsEquivalent
	var ParameterSetMethodTest2 = function(){
		var charShapeSet = HwpCtrl.CharShape;
		var cloneSet = charShapeSet.Clone();

		if(cloneSet.IsEquivalent(charShapeSet)){
			alert('Clone 성공');
		} else {
			alert('Clone 실패');
		}
	};

	//ItemExist, SetItem
	var ParameterSetMethodTest3 = function () {
		var charShapeSet = HwpCtrl.CharShape;
		if(charShapeSet.ItemExist('Height') == true){
			charShapeSet.SetItem('Height', 2000);
			HwpCtrl.CharShape = charShapeSet;
		}
	};

	//RemoveAll, Merge
	var ParameterSetMethodTest4 = function () {
		var charShapeSet = HwpCtrl.CharShape;
		var charShapeSet2 = charShapeSet.Clone();

		charShapeSet2.RemoveAll();
		if(charShapeSet2.Count == 0){
			alert('RemoveAll 성공');
			charShapeSet2.Merge(charShapeSet);
			if(charShapeSet2.IsEquivalent(charShapeSet)){
				alert('Merge 성공');
			} else {
				alert('Merge 실패');
			}
		} else {
			alert('RemoveAll 실패');
		}
	};

	var ParameterArrayMethodTest = function(){
		var set = HwpCtrl.CreateSet('TableCreation');
		var colset = set.CreateItemArray('ColWidth', 2);
		var colWidth = 14400;
		colset.SetItem(0, colWidth);
		colset.SetItem(1, colWidth);
		if(colset.Item(0) == colWidth){
			alert('ParameterArray SetItem/Item 성공');
		} else {
			alert('ParameterArray SetItem/Item 실패');
		}
		var cloneColset = colset.Clone();
		if(cloneColset.Item(0) == colWidth && cloneColset.Item(1) == colWidth ) {
			alert('ParameterArray Clone 성공');
		} else {
			alert('ParameterArray Clone 실패');
		}
		cloneColset.SetItem(0, 0);
		if(cloneColset.Item(0) == 0) {
			cloneColset.Copy(colset);
			if(cloneColset.Item(0) == colWidth && cloneColset.Item(1) == colWidth ) {
				alert('ParameterArray Copy 성공');
			} else {
				alert('ParameterArray Copy 실패');
			}
		} else {
			alert('ParameterArray SetItem/Item 실패');
		}
	};

	var DeleteTable = function(){
		var ctrl = HwpCtrl.CurSelectedCtrl;
		if(ctrl.CtrlID == 'tbl'){
			HwpCtrl.DeleteCtrl(ctrl);
		}
	};

	var GetTextLine = function () {
		HwpCtrl.InitScan(0, 2);
		alert(HwpCtrl.GetText().text);
		HwpCtrl.ReleaseScan();
	}

	var LockCommandTest = function () {
		HwpCtrl.LockCommand('CharShapeBold', true);
		var isCommandLock = HwpCtrl.IsCommandLock('CharShapeBold');
		if(isCommandLock){
			console.log('Bold Action을 실행할 수 없습니다.')
		}else{
			console.log('Bold Action을 실행할 수 있습니다.')
		}
	};

	var ChangeCurFieldName = function(){
		if(HwpCtrl.GetCurFieldName(0) == '셀1'){
			HwpCtrl.SetCurFieldName('셀2');
		}
	};

	var ConvertHtmlCode = function (sampleStr, key) {
		var sampleLines = sampleStr.split('\n');
		var resultLines = [];
		var resultstr = "";
		var tabStr = "";
		var tempStr = "";
		var tabStrIdx = 0;

		for(var i =1; i< sampleLines.length - 1; i++){
			resultLines[i] = "";
			for(var j =0; j< sampleLines[i].length; j++){
				if(sampleLines[i].charCodeAt(j) == 9){
					resultLines[i] += "&nbsp ";
				}else {
					resultLines[i]+= sampleLines[i].charAt(j);
				}
			}

			resultstr +=  ""

			if(i > 1 )
				resultstr +=  "<br>";

			if(resultLines[i].indexOf(key) != -1){
				tabStr = "";
				tempStr = "";
				tabStrIdx = resultLines[i].lastIndexOf("&nbsp");
				tabStr = resultLines[i].substring(0, tabStrIdx + 5);
				tempStr = resultLines[i].substring(tabStrIdx + 5, resultLines[i].length);

				resultLines[i] = tabStr + "<span class =\"coreline\">" + tempStr + "</span>"
			}

			resultstr += resultLines[i];
			resultstr += "\n";
		}
		return resultstr;
	};
	var SelectItem = function (id, type, functionName, Title) {
		if(id)
			ChangeCurItem(id);

		SetExampleElements(type, functionName, Title);
	};

	var SetExampleElements = function (type, functionName, Title) {
		switch (type){
			case 0 :
				runName = functionName;
				apiNameElement.innerText = Title;
				apiExampleElement.innerHTML = ConvertHtmlCode(window[functionName].toString(), Title);
				break;
			case 1 :
				runName = "";
				apiNameElement.innerText = "지원예정";
				apiExampleElement.innerHTML = "";
				break;
			case 2:
				runName = "";
				apiNameElement.innerText = Title;
				apiExampleElement.innerHTML = "<span class='coreline'>API문서를 참고하세요.<span>";
				break;
		}
	};

	var ChangeExampleWorkSpace = function(isExampleShow){
		if(isExampleShow){
			staticExampleWorkSpace.style.display = 'block';
			staticExampleButton.className = "selected";
			dynamicExampleWorkSpace.style.display = 'none';
			dynamicExampleButton.className = "button";
		} else{
			staticExampleWorkSpace.style.display = 'none';
			staticExampleButton.className = "button";
			dynamicExampleWorkSpace.style.display = 'block';
			dynamicExampleButton.className = "selected";
		}
	};

	var lastSelectedList ="";
	var lastSelectedListOriginClassName ="";
	var ChangeCurItem = function (id) {
		if(lastSelectedList){
			document.getElementById(lastSelectedList).className = lastSelectedListOriginClassName;
		}
		lastSelectedList = id;
		lastSelectedListOriginClassName = document.getElementById(id).className;
		document.getElementById(id).className = "selected";
	};



</script>
</body>
</html>