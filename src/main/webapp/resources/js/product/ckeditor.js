/**
 * This configuration was generated using the CKEditor 5 Builder. You can modify it anytime using this link:
 * https://builder.ckeditor.com/#installation/NoNgNARAzAdALDADBSBGRAmVBWVqDsBGAnCIosYgBwjaFVQYW23YhyJT4bcoQDWAexSIwwVGFGiJ0gLqQ6+fABNi2CLKA===
 */

const {
	ClassicEditor,
	Autosave,
	Essentials,
	Paragraph,
	ImageUtils,
	ImageEditing,
	Bold,
	Italic,
	Underline,
	Strikethrough,
	FontBackgroundColor,
	FontColor,
	FontFamily,
	FontSize,
	Highlight,
	Heading,
	BlockQuote,
	Alignment,
	ImageInline,
	ImageToolbar,
	ImageBlock,
	ImageUpload,
	CloudServices,
	Link,
	ImageInsertViaUrl,
	AutoImage,
	ImageStyle
} = window.CKEDITOR;

const LICENSE_KEY =
	'eyJhbGciOiJFUzI1NiJ9.eyJleHAiOjE3OTAyOTQzOTksImp0aSI6IjUxMzkzMDgzLTRmNzQtNDdiZS1iYTBmLTIzY2E5Y2M1YjE5MiIsInVzYWdlRW5kcG9pbnQiOiJodHRwczovL3Byb3h5LWV2ZW50LmNrZWRpdG9yLmNvbSIsImRpc3RyaWJ1dGlvbkNoYW5uZWwiOlsiY2xvdWQiLCJkcnVwYWwiLCJzaCJdLCJ3aGl0ZUxhYmVsIjp0cnVlLCJsaWNlbnNlVHlwZSI6InRyaWFsIiwiZmVhdHVyZXMiOlsiKiJdLCJyZW1vdmVGZWF0dXJlcyI6WyJBSSJdLCJ2YyI6Ijg0YzI0YjNjIn0.DSN6kvsXoTzyGtnPXyzpBGrYcE9pzQcMgCjiCf89scISydlT9Zd4OFMxBaka-J8F7M2ATxQSbhqBsDyk175LWQ';

const editorConfig = {
	attachTo: document.querySelector('#editor'),
	root: {
		placeholder: '상품 설명을 입력하세요.',
		initialData:
			''
	},
	toolbar: {
		items: [
			'undo',
			'redo',
			'|',
			'heading',
			'|',
			'fontSize',
			'fontFamily',
			'fontColor',
			'fontBackgroundColor',
			'|',
			'bold',
			'italic',
			'underline',
			'strikethrough',
			'|',
			'link',
			'highlight',
			'blockQuote',
			'|',
			'alignment'
		],
		shouldNotGroupWhenFull: false
	},
	plugins: [
		Alignment,
		AutoImage,
		Autosave,
		BlockQuote,
		Bold,
		CloudServices,
		Essentials,
		FontBackgroundColor,
		FontColor,
		FontFamily,
		FontSize,
		Heading,
		Highlight,
		ImageBlock,
		ImageEditing,
		ImageInline,
		ImageInsertViaUrl,
		ImageStyle,
		ImageToolbar,
		ImageUpload,
		ImageUtils,
		Italic,
		Link,
		Paragraph,
		Strikethrough,
		Underline
	],
	licenseKey: LICENSE_KEY,
	autosave: {
		/* See: https://ckeditor.com/docs/ckeditor5/latest/features/autosave.html */
	},
	fontFamily: {
		supportAllValues: true
	},
	fontSize: {
		options: [10, 12, 14, 'default', 18, 20, 22],
		supportAllValues: true
	},
	heading: {
		options: [
			{
				model: 'paragraph',
				title: 'Paragraph',
				class: 'ck-heading_paragraph'
			},
			{
				model: 'heading1',
				view: 'h1',
				title: 'Heading 1',
				class: 'ck-heading_heading1'
			},
			{
				model: 'heading2',
				view: 'h2',
				title: 'Heading 2',
				class: 'ck-heading_heading2'
			},
			{
				model: 'heading3',
				view: 'h3',
				title: 'Heading 3',
				class: 'ck-heading_heading3'
			},
			{
				model: 'heading4',
				view: 'h4',
				title: 'Heading 4',
				class: 'ck-heading_heading4'
			},
			{
				model: 'heading5',
				view: 'h5',
				title: 'Heading 5',
				class: 'ck-heading_heading5'
			},
			{
				model: 'heading6',
				view: 'h6',
				title: 'Heading 6',
				class: 'ck-heading_heading6'
			}
		]
	},
	image: {
		toolbar: ['imageStyle:inline', 'imageStyle:wrapText', 'imageStyle:breakText']
	},
	language: 'ko',
	link: {
		addTargetToExternalLinks: true,
		defaultProtocol: 'http://',
		decorators: {
			toggleDownloadable: {
				mode: 'manual',
				label: 'Downloadable',
				attributes: {
					download: 'file'
				}
			}
		}
	}
};

ClassicEditor.create(editorConfig);
