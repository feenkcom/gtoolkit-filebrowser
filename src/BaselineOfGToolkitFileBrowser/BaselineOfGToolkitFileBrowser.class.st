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
				spec repository: 'github://feenkcom/gtoolkit-inspector:v0.8.927/src' ].
		spec
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.658/src' ].
		spec
			baseline: 'GToolkitSpotter' with: [
				spec repository: 'github://feenkcom/gtoolkit-spotter:v0.8.630/src' ].

		spec package: 'GToolkit-FileBrowser' with: [
			spec requires: #('GToolkitInspector' 'GToolkitPhlow' 'GToolkitSpotter') ].
	]
]
