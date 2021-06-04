"
Haba


"
Class {
	#name : #ManifestGToolkitFileBrowser,
	#superclass : #PackageManifest,
	#category : #'GToolkit-FileBrowser-Manifest'
}

{ #category : #'code generation' }
ManifestGToolkitFileBrowser class >> fileBrowserModel [
"@prefix Gt
@package 'GToolkit-FileBrowser'
@objectTag 'Models'
@project FileBrowser
@suffix Model

@derive children
@derive parent
@derive phlowList
@derive announcer
@derive notify
@derive api
@derive print
@derive typeTest

folder(s) => file(s) and folder(s).

folder(s) {
	@derive add(primitive: true),
	@derive remove(primitive: true),
	@derive model(name: fileReferences)
}.

file(s) {
	@derive add(primitive: true),
	@derive remove(primitive: true),
	@derive model(name: fileReferences)
}.

folder {
	file(s): #files,
	folder(s): #directories,
	@derive model(name: fileReference)
}.

file {
	@derive model(name: fileReference)
}"
]

{ #category : #'code generation' }
ManifestGToolkitFileBrowser class >> fileBrowserViewModel [
"@prefix Gt
@package 'GToolkit-FileBrowser'
@objectTag 'View Models'
@project FileBrowser
@suffix ViewModel

@derive children
@derive parent
@derive name
@derive print
@derive announcer
@derive notifier
@derive typeTest
@derive phlowList
@derive api
@derive selection

folder(s) => file(s) and folder(s).

folder(s) {
	@derive model(api: TGtWithFileBrowserFoldersModel),
	@derive add(
		delegate: #addFileBrowserFolderModel:,
		subscribe: GtFileBrowserFolderModelAddedAnnouncement),
	@derive remove(
		delegate: #removeFileBrowserFolderModel:,
		subscribe: GtFileBrowserFolderModelRemovedAnnouncement),
	items: #fileBrowserFolderModels,
}.
folder {
	@derive model(api: TGtWithFileBrowserFolderModel),
	file(s): #fileBrowserFilesModel,
	folder(s): #fileBrowserFoldersModel
}.
file(s) {
	@derive model(api: TGtWithFileBrowserFilesModel),
	@derive add(
		delegate: #addFileBrowserFileModel:,
		subscribe: GtFileBrowserFileModelAddedAnnouncement),
	@derive remove(
		delegate: #removeFileBrowserFileModel:,
		subscribe: GtFileBrowserFileModelRemovedAnnouncement),
	items: #fileBrowserFileModels
}.
file {
	@derive model(api: TGtWithFileBrowserFileModel),
}."
]
