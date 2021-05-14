Class {
	#name : #GtFileBrowserTreeRowDataBinder,
	#superclass : #BrDefaultTreeRowDataBinder,
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #'api - instantiation' }
GtFileBrowserTreeRowDataBinder >> buildDefault [	
	super buildDefault.
	
	self rowElement fileBrowserTreeNode: self itemNode
]
