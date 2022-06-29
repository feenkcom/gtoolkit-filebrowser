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
GtFileBrowserSpotterStart >> gtSpotterForDirectoriesFor: aStep [
	<gtSearch>

	^ aStep listProcessor
		priority: 5;
		allCandidates: [ self fileBrowserFolderModelBlock value fileBrowserFoldersModel fileBrowserFolderModels ];
		title: 'Directories';
		candidatesLimit: Float infinity;
		itemName: [ :eachFolderModel | eachFolderModel fileReference basename ];
		itemIcon: [ BrGlamorousIcons glamorousFolder ];
		filter: GtFilterSubstring
]

{ #category : #searches }
GtFileBrowserSpotterStart >> gtSpotterForFilesFor: aStep [
	<gtSearch>

	^ aStep listProcessor
		priority: 10;
		allCandidates: [ self fileBrowserFolderModelBlock value fileBrowserFilesModel fileBrowserFileModels ];
		title: 'Files';
		candidatesLimit: Float infinity;
		itemName: [ :eachFileModel | eachFileModel fileReference basename ];
		itemIcon: [ BrGlamorousIcons folder ];
		filter: GtFilterSubstring
]

{ #category : #printing }
GtFileBrowserSpotterStart >> printOn: aStream [
	aStream nextPutAll: self fileBrowserFolderModelBlock value fileReference absolutePath basename
]
