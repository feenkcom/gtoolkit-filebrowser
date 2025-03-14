Class {
	#name : #BaselineOfGToolkitFileBrowser,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitFileBrowser
}

{ #category : #baseline }
BaselineOfGToolkitFileBrowser >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'GToolkitInspector' with: [
				spec repository: 'github://feenkcom/gtoolkit-inspector:v0.8.2598/src' ].
		spec
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.1581/src' ].
		spec
			baseline: 'GToolkitSpotter' with: [
				spec repository: 'github://feenkcom/gtoolkit-spotter:v0.8.1506/src' ].

		spec package: 'GToolkit-FileBrowser' with: [
			spec requires: #(#GToolkitInspector #GToolkitPhlow #GToolkitSpotter) ].
	]
]
