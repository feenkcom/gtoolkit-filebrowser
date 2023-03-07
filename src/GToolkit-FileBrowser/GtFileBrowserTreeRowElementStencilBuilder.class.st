Class {
	#name : #GtFileBrowserTreeRowElementStencilBuilder,
	#superclass : #BrColumnedTreeRowElementStencilBuilder,
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #'api - instantiation' }
GtFileBrowserTreeRowElementStencilBuilder >> createRowElement [
	^ self itemType = #folder
		ifTrue: [ GtFileBrowserTreeDirectoryRowElement new ]
		ifFalse: [ GtFileBrowserTreeFileRowElement new ]
]
