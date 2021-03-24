<script type="text/javascript" src="//cdn.ckeditor.com/4.5.11/full/ckeditor.js" charset="utf-8"></script>
<script type="text/javascript">
//replaceAll prototype
String.prototype.replaceAll = function(org, dest) {
    return this.split(org).join(dest);
}

function GetCharCodeReplace(x) {
	//server char change
	x = x.replaceAll(String.fromCharCode(8203),"");
	x = x.replaceAll(String.fromCharCode(160)," ");
	x = x.replaceAll(String.fromCharCode(10)," ");
	x = x.replaceAll(String.fromCharCode(13),"");

	return x;
}

function removeTag( str ) {
	return str.replace(/<(\/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(\/)?>/gi, "");
}
</script>