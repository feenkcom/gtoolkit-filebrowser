Trait {
	#name : #TGtFileBrowserFolderModel,
	#category : #'GToolkit-FileBrowser-Models'
}

{ #category : #'api - adding' }
TGtFileBrowserFolderModel >> addNewFolder [
	<return: #GtFileBrowserFolderModel>
	| aCounter aNewFolderFileReference aNewFolderModel |
	
	aCounter := 0.
	[
		| aNewFolderName |
		aNewFolderName := 'untitled folder'.
		aCounter := aCounter + 1.
		aCounter > 1
			ifTrue: [ aNewFolderName := aNewFolderName, ' ', aCounter asString ].
		
		aNewFolderFileReference := self fileReference / aNewFolderName.
		
		(self fileBrowserFoldersModel findFileBrowserFolderModel: aNewFolderFileReference) notNil
			or: [ (self fileBrowserFilesModel findFileBrowserFileModel: aNewFolderFileReference) notNil ] ] whileTrue.

	self fileBrowserFoldersModel addFileBrowserFolderModel: (aNewFolderModel := GtFileBrowserFolderModel new fileReference: aNewFolderFileReference).
	^ aNewFolderModel
]

{ #category : #'api - adding' }
TGtFileBrowserFolderModel >> deleteFolder [
	self hasParentFileBrowserFoldersModel
		ifFalse: [ ^ self ].

	self parentFileBrowserFoldersModel removeFileBrowserFolderModel: self
]
