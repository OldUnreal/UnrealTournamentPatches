<style>
header,
#top,
article {
	width: 100%%;
	box-sizing: border-box;
	position: relative;
	font-family: Verdana, Arial, Helvetica;
	overflow: hidden;
	border-radius: 18px;
	background: #226474;
}
header {
	font-size: small;
	font-weight: bold;
	color: #fff;
	border-radius: 18px;
	padding: 6px 9px;
	background: #226474;
}
#header-inner {
	border-radius: 12px;
	padding: 2px 12px;
	background: #000;
	background: linear-gradient(to left, #226474 30px, #000 90px, #000 100%%);
}
#top {
	position: relative;
	border-radius: 0;
	background: #226474;
	line-height: 20px;
}
#top:before,
#top:after {
	content: '';
	position: absolute;
	display: block;
	width: 26px;
	height: 100%%;
	right: 106px;
	top: 0;
	border-radius: 26px;
	background: #000;
}
#top:before {
	width: 98px;
	border-radius: 12px 0 0 12px;
	right: 0;
}
#area {
	font-weight: bold;
	color: #33cc66;
	background: #000;
	border-radius: 0 12px 12px 0;
	margin-right: 140px;
	padding: 3px 0 3px 25px;
}
#bugs {
	position: absolute;
	top: 50%%;
	right: 0;
	margin-top: -10px;
	padding-right: 25px;
	color: #fff;
	font-weight: bold;
	font-size: small;
}
#area:before,
#bugs:after {
	content: '';
	position: absolute;
	display: block;
	width: 12px;
	height: 12px;
	left: 4px;
	top: 50%%;
	margin-top: -6px;
	border-radius: 12px;
	background: #226474;
}
#bugs:after {
	left: auto;
	right: 4px;
}
#bugs a {
	font-weight: normal;
}
article {
	color: silver;
	padding: 9px 9px 28px;
}
#inner {
	border-radius: 12px;
	padding: 12px;
	background: #135565;
}
select {
	max-width: 100%%;
}
table, textarea {
	max-width: 82vw;
}
.inl-mid {
	display: inline-block;
	vertical-align: middle;
}
#credits {
	position: absolute;
	right: 46px;
	padding: 0 6px;
	bottom: 0;
	height: 18px;
	line-height: 18px;
	font-size: small;
	border-radius: 6px;
	background: #000;
}
</style>

<header><div id="header-inner">%Section%</div></header>

<div id="top">
	<div id="area">%Area%</div>
	<div id="bugs">«<a href="https://github.com/OldUnreal/UnrealTournamentPatches/issues" target="_blank">Bugs?</a>»</div>
</div>

<article>
	<div id="inner">