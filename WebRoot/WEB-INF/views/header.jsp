<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<link rel="shortcut icon" href="img/logo.ico" />
<!-- <script type="text/javascript" src="wangEditor-2.1.3/dist/js/lib/jquery-1.10.2.min.js"></script> -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script src="js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="assets/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="js/dialog.js"></script>
<script type="text/javascript">
var grid = [];
var addGrid = function(obj){
	if(grid.length == 0){
		grid.push(obj);
	}else{
		for (var i = 0; i < grid.length; i++) {
			if(obj !== grid[i] ){
				grid.push(obj);
			}
		}
	}
}
</script>