Class {
	#name : #BaselineOfGToolkitFileBrowser,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitFileBrowser
}

{ #category : #baseline }
BaselineOfGToolkitFileBrowser >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'GToolkitInspector' with: [
				spec repository: 'github://feenkcom/gtoolkit-inspector/src' ].
		spec baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow/src' ].
		spec baseline: 'GToolkitSpotter' with: [
				spec repository: 'github://feenkcom/gtoolkit-spotter/src' ].
		spec package: 'GToolkit-FileBrowser' with: [
				spec requires: #(#GToolkitInspector GToolkitPhlow GToolkitSpotter). ]. ].

]
