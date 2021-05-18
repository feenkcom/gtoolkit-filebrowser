Class {
	#name : #GtFileBrowserFolderBreadcrumbElement,
	#superclass : #BrBreadcrumb,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #initialization }
GtFileBrowserFolderBreadcrumbElement >> initialize [
	super initialize.
	
	self aptitude: (BrGlamorousBreadcrumbAptitude new separator: [
		BrLabel new
			aptitude: (BrGlamorousLabelAptitude new foreground: Color darkGray);
			text: DiskStore delimiter ])
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserFolderBreadcrumbElement >> onFileBrowserFolderViewModelChanged [
	"Is sent when a new fileBrowserFolderViewModel is assigned to the receiver.
	Note: #onFileBrowserFolderViewModelChanged is sent before #subscribeToFileBrowserFolderViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFolderViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>

	self removeAllItems.
	self fileBrowserFolderViewModel fileBrowserFolderModel withAllParentFileBrowserFolderModel reverseDo: [ :echFolderModel |
		| aForeground |
		
		aForeground := self fileBrowserFolderViewModel fileBrowserFolderModel == echFolderModel
			ifTrue: [ Color black ]
			ifFalse: [ Color gray ].
		
		self addItem: (BrButton new
			aptitude: (BrGlamorousLabelAptitude new foreground: aForeground);
			label: echFolderModel fileReference absolutePath basename;
			model: echFolderModel;
			action: [ :aButton |
				| aPhlowTool |
			
				aPhlowTool := GtPhlowCompositeTool new
					addTool: (GtFileBrowserFolderTool forFolderModel: aButton model);
					addTool: (GtInspectorTool forObject: aButton model fileReference).
				self phlow spawnTool: aPhlowTool ]) ]
]
