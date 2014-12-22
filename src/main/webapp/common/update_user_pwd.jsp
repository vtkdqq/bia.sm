<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>jquery实现密码强度的智能判断特效</title>

<script type="text/javascript" src="http://web-res.qiniudn.com/jquery-1.11.1.js"></script>

<link href="css/base.css" rel="stylesheet" type="text/css" />

<style type="text/css">

/** 清除内外边距 **/
body, h1, h2, h3, h4, h5, h6, hr, p,
blockquote, /* structural elements 结构元素 */
dl, dt, dd, ul, ol, li, /* list elements 列表元素 */
pre, /* text formatting elements 文本格式元素 */
form, fieldset, legend, button, input, textarea, /* form elements 表单元素 */
 /* table elements 表格元素 */
img/* img elements 图片元素 */{
  border:medium none;
  margin: 0;
  padding: 0;
}
input::-ms-clear{display:none;}
/** 设置默认字体 **/
body,button, input, select, textarea {
   font-family:微软雅黑, Verdana, Geneva, sans-ser;
   font-size:14px;
   color:#666;}
h1, h2, h3, h4, h5, h6 { font-size: 100%; }
em{font-style:normal;}
/** 重置列表元素 **/
ul, ol, li { list-style: none outside;  display:block;  overflow:hidden; }
/** 重置超链接元素 **/
a { text-decoration: none; color:#333;}
/** 重置图片元素 **/
img{ border:0px;}
/** 重置表格元素 **/

.ywz_zhucexiaobo{width:620px;margin:40px auto 0px auto;padding-bottom:10px;padding-top:5px;}
.ywz_zhuce_youjian{float:left;width:100px;margin: 5px 0 0 0;font-size:14px;text-align:right;}
.ywz_zhuce_xiaoxiaobao{float:left;width:226px;}
.ywz_zhuce_kuangzi{float:left;width:226px;height:38px;color:#171717;}
.ywz_zhuce_huixian{float:left;background:#d6d3d3;width:62px;height:4px;margin-top:5px;_margin-top:0px;margin-left:5px;_height:2px;font-size:0px;}
.ywz_zhuce_hongxianwenzi{float:left;width:62px;margin-left:5px;text-align:center;color:#b0adad;font-size:12px;}

.ywz_zhuce_kuangwenzi1{float:left;background: url(../res/img/common/dengl_06.jpg) no-repeat;border:0;color:#3e3e3e;width:210px;height:40px;line-height:35px;padding-left:25px;_padding-left:20px;outline:medium;}/*框*/

.ywz_zhuce_hongxian{float:left;background:#ff3300;width:62px;height:4px;margin-top:5px;margin-left:5px;_margin-top:0px;_height:2px;font-size:0px;}
.ywz_zhuce_hongxian2{float:left;background: #099;width:62px;height:4px;margin-top:5px;margin-left:5px;_margin-top:0px;_height:2px;font-size:0px;}
.ywz_zhuce_hongxian3{float:left;background: #060;width:62px;height:4px;margin-top:5px;margin-left:5px;_margin-top:0px;_height:2px;font-size:0px;}

.ywz_zhuce_yongyu1{float:left;color: #C00;font-size:12px;padding-left:10px;margin-top:10px;_padding-left:0px;}/*后面的文字*/
.ywz_zhuce_yongyu1 a{ color:#C00;text-decoration:none;}
.ywz_zhuce_yongyu1 a:hover{ color:#C00;}
</style>



</head>
<body>

<form name="form1" method="post" action="" id="form1">
	<div class="ywz_zhucexiaobo">
		<div class="ywz_zhuce_youjian"> 设置密码：</div>
		<div class="ywz_zhuce_xiaoxiaobao">
			<div class="ywz_zhuce_kuangzi">
			<input name="tbPassword" type="password" id="tbPassword" class="ywz_zhuce_kuangwenzi1" /></div>
			<div class="ywz_zhuce_huixian" id='pwdLevel_1'> </div>
			<div class="ywz_zhuce_huixian" id='pwdLevel_2'> </div>
			<div class="ywz_zhuce_huixian" id='pwdLevel_3'> </div>
			<div class="ywz_zhuce_hongxianwenzi"> 弱</div>
			<div class="ywz_zhuce_hongxianwenzi"> 中</div>
			<div class="ywz_zhuce_hongxianwenzi"> 强</div>
		</div>
		<div class="ywz_zhuce_yongyu1">
			<span id="pwd_tip" style="color: #898989"><font style="color: #F00">*</font> 6-16位，由字母（区分大小写）、数字、符号组成</span> <span id="pwd_err" style="color: #f00; display:none;">6-16位，由字母（区分大小写）、数字、符号组成</span>
		</div>
	</div>
</form>
  
<script type="text/javascript">
	$('#tbPassword').focus(function () {
		$('#pwdLevel_1').attr('class', 'ywz_zhuce_hongxian');
		$('#tbPassword').keyup();
	});

	$('#tbPassword').keyup(function () {
		var __th = $(this);

		if (!__th.val()) {
			$('#pwd_tip').hide();
			$('#pwd_err').show();
			Primary();
			return;
		}
		if (__th.val().length < 6) {
			$('#pwd_tip').hide();
			$('#pwd_err').show();
			Weak();
			return;
		}
		var _r = checkPassword(__th);
		if (_r < 1) {
			$('#pwd_tip').hide();
			$('#pwd_err').show();
			Primary();
			return;
		}

		if (_r > 0 && _r < 2) {
			Weak();
		} else if (_r >= 2 && _r < 4) {
			Medium();
		} else if (_r >= 4) {
			Tough();
		}

		$('#pwd_tip').hide();
		$('#pwd_err').hide();
	});

 

	function Primary() {
		$('#pwdLevel_1').attr('class', 'ywz_zhuce_huixian');
		$('#pwdLevel_2').attr('class', 'ywz_zhuce_huixian');
		$('#pwdLevel_3').attr('class', 'ywz_zhuce_huixian');
	}

	function Weak() {
		$('#pwdLevel_1').attr('class', 'ywz_zhuce_hongxian');
		$('#pwdLevel_2').attr('class', 'ywz_zhuce_huixian');
		$('#pwdLevel_3').attr('class', 'ywz_zhuce_huixian');
	}

	function Medium() {
		$('#pwdLevel_1').attr('class', 'ywz_zhuce_hongxian');
		$('#pwdLevel_2').attr('class', 'ywz_zhuce_hongxian2');
		$('#pwdLevel_3').attr('class', 'ywz_zhuce_huixian');
	}

	function Tough() {
		$('#pwdLevel_1').attr('class', 'ywz_zhuce_hongxian');
		$('#pwdLevel_2').attr('class', 'ywz_zhuce_hongxian2');
		$('#pwdLevel_3').attr('class', 'ywz_zhuce_hongxian3');
	}




	function checkPassword(pwdinput) {
		var maths, smalls, bigs, corps, cat, num;
		var str = $(pwdinput).val()
		var len = str.length;

		var cat = /.{16}/g
		if (len == 0) return 1;
		if (len > 16) { $(pwdinput).val(str.match(cat)[0]); }
		cat = /.*[\u4e00-\u9fa5]+.*$/
		if (cat.test(str)) {
			return -1;
		}
		cat = /\d/;
		var maths = cat.test(str);
		cat = /[a-z]/;
		var smalls = cat.test(str);
		cat = /[A-Z]/;
		var bigs = cat.test(str);
		var corps = corpses(pwdinput);
		var num = maths + smalls + bigs + corps;

		if (len < 6) { return 1; }

		if (len >= 6 && len <= 8) {
			if (num == 1) return 1;
			if (num == 2 || num == 3) return 2;
			if (num == 4) return 3;
		}

		if (len > 8 && len <= 11) {
			if (num == 1) return 2;
			if (num == 2) return 3;
			if (num == 3) return 4;
			if (num == 4) return 5;
		}

		if (len > 11) {
			if (num == 1) return 3;
			if (num == 2) return 4;
			if (num > 2) return 5;
		}
	}

	function corpses(pwdinput) {
		var cat = /./g
		var str = $(pwdinput).val();
		var sz = str.match(cat)
		for (var i = 0; i < sz.length; i++) {
			cat = /\d/;
			maths_01 = cat.test(sz[i]);
			cat = /[a-z]/;
			smalls_01 = cat.test(sz[i]);
			cat = /[A-Z]/;
			bigs_01 = cat.test(sz[i]);
			if (!maths_01 && !smalls_01 && !bigs_01) { return true; }
		}
		return false;
	}
</script>

</body>
</html>
