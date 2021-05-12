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
			aptitude: (BrGlamorousLabelAptitude new thin foreground: Color gray);
			text: '>';
			margin: (BlInsets left: 5 right: 5) ]).
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
		self addItem: (BrLabel new
			aptitude: BrGlamorousLabelAptitude;
			text: echFolderModel fileReference absolutePath basename) ]
]
