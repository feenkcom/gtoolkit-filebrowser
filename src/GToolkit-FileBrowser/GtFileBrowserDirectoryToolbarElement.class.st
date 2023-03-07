Class {
	#name : #GtFileBrowserDirectoryToolbarElement,
	#superclass : #BrHorizontalPane,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#instVars : [
		'breadcrumb',
		'addButton',
		'spotterButton'
	],
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #initialization }
GtFileBrowserDirectoryToolbarElement >> initialize [
	super initialize.
	
	breadcrumb := GtFileBrowserDirectoryBreadcrumbElement new.
	breadcrumb fitContent.
	
	self addChild: (BrScrollPane new
		aptitude: BrScrollPaneAptitude;
		hMatchParent;
		vFitContent;
		content: breadcrumb).

	self cellSpacing: 5.

	addButton := BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude + BrGlamorousButtonWithLabelTooltipAptitude;
		label: 'Create a new folder';
		beSmallSize;
		icon: BrGlamorousVectorIcons add;
		action: [
			self hasFileBrowserFolderViewModel
				ifTrue: [ self fileBrowserFolderViewModel fileBrowserFolderModel addNewFolder ] ].

	spotterButton := GtSpotterDropdownButtonStencil new
		object: (GtFileBrowserSpotterStart new fileBrowserFolderModelBlock: [ self fileBrowserFolderViewModel fileBrowserFolderModel ]);
		tooltip: 'Search Files and Folder';
		actOn: [ :anActOnEvent :aFileBrowserFolderOrFileModel :theButton | 
			aFileBrowserFolderOrFileModel isFileBrowserFolderModel
				ifTrue: [
					self phlow spawnTool: (GtPhlowCompositeTool new
						addTool: (GtFileBrowserFolderTool forFolderModel: aFileBrowserFolderOrFileModel);
						addTool: (GtInspectorTool forObject: aFileBrowserFolderOrFileModel fileReference)) ]
				ifFalse: [ self phlow spawnTool: (GtInspectorTool forObject: aFileBrowserFolderOrFileModel fileReference) ].
			anActOnEvent actedUpon: true ];
		asElement.

	spotterButton beSmallSize.

	self addChild: addButton.
	self addChild: spotterButton
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserDirectoryToolbarElement >> onFileBrowserFolderViewModelChanged [
	"Is sent when a new fileBrowserFolderViewModel is assigned to the receiver.
	Note: #onFileBrowserFolderViewModelChanged is sent before #subscribeToFileBrowserFolderViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFolderViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	breadcrumb fileBrowserFolderViewModel: self fileBrowserFolderViewModel
]
