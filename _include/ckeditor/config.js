/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.filebrowserImageUploadUrl = '/_include/ckeditor/upload.asp?type=Images';
	//config.filebrowserUploadUrl = '/_include/ckeditor/upload.asp?type=Files';
	//config.filebrowserFlashUploadUrl = '/_include/ckeditor/upload.asp?type=Flash';

	//config.uiColor = '#9AB8F3';
	//config.resize_enabled = false; //하단 사이즈조정

	//view 클래스 지정
	//config.bodyClass = 'sub_con';

	//view css
	//config.contentsCss = '/_include/ckeditor/contents.css';

	//줄바꿈 - 1:CKEDITOR.ENTER_P, 2:CKEDITOR.ENTER_BR, 3:CKEDITOR.ENTER_DIV
	//config.enterMode = CKEDITOR.ENTER_BR;
	//config.shiftEnterMode = CKEDITOR.ENTER_P;
};
