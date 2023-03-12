Class {
	#name : #GtFileBrowserSpotterStart,
	#superclass : #Object,
	#instVars : [
		'fileBrowserFolderModelBlock'
	],
	#category : #'GToolkit-FileBrowser-Spotter'
}

{ #category : #accessing }
GtFileBrowserSpotterStart >> fileBrowserFolderModelBlock [
	^ fileBrowserFolderModelBlock
]

{ #category : #accessing }
GtFileBrowserSpotterStart >> fileBrowserFolderModelBlock: anObject [
	fileBrowserFolderModelBlock := anObject
]

{ #category : #searches }
GtFileBrowserSpotterStart >> gtSpotterForDirectoriesFor: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 5;
		items: [ self fileBrowserFolderModelBlock value fileBrowserFoldersModel
				fileBrowserFolderModels ];
		title: 'Directories';
		itemsLimit: Float infinity;
		itemName: [ :eachFolderModel | eachFolderModel fileReference basename ];
		filterBySubstring
]

{ #category : #searches }
GtFileBrowserSpotterStart >> gtSpotterForFilesFor: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 10;
		items: [ self fileBrowserFolderModelBlock value fileBrowserFilesModel
				fileBrowserFileModels ];
		title: 'Files';
		itemsLimit: Float infinity;
		itemName: [ :eachFileModel | eachFileModel fileReference basename ];
		filterBySubstring
]

{ #category : #printing }
GtFileBrowserSpotterStart >> printOn: aStream [
	aStream nextPutAll: self fileBrowserFolderModelBlock value fileReference absolutePath basename
]
